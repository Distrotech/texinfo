# Text.pm: output tree as simple text.
#
# Copyright 2010, 2011 Free Software Foundation, Inc.
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License,
# or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# 
# Original author: Patrice Dumas <pertusus@free.fr>

package Texinfo::Convert::Text;

use 5.00405;
use strict;

# accent commands list.
use Texinfo::Common;
use Texinfo::Convert::Unicode;
# for debugging
use Texinfo::Convert::Texinfo;
use Data::Dumper;
use Carp qw(cluck);

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration       use Texinfo::Convert::Text ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
%EXPORT_TAGS = ( 'all' => [ qw(
  convert
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
);

$VERSION = '0.01';

# this is in fact not needed for 'footnote', 'shortcaption', 'caption'
# when they have no brace_command_arg, see below.
my %ignored_brace_commands;
foreach my $ignored_brace_command ('xref','ref','pxref','inforef','anchor',
   'footnote', 'shortcaption', 'caption', 'hyphenation') {
  $ignored_brace_commands{$ignored_brace_command} = 1;
}

my %ignored_block_commands;
foreach my $ignored_command ('titlepage', 'copying', 'documentdescription',
  'html', 'tex', 'xml', 'docbook', 'ignore', 'macro', 'rmacro') {
  $ignored_block_commands{$ignored_command} = 1;
}

our %text_brace_no_arg_commands = (
               'TeX'                => 'TeX',
               'LaTeX'              => 'LaTeX',
               'bullet'             => '*',
               'copyright'          => '(C)',
               'registeredsymbol'   => '(R)',
               'dots'         => '...',
               'enddots'      => '...',
               'equiv'        => '==',
# FIXME i18n
               'error'        => 'error-->',
               'expansion'    => '==>',
               'arrow'        => '->',
               'minus'        => '-',
               'point'        => '-!-',
               'print'        => '-|',
               'result'       => '=>',
               'today'        => '',
               'aa'           => 'aa',
               'AA'           => 'AA',
               'ae'           => 'ae',
               'oe'           => 'oe',
               'AE'           => 'AE',
               'OE'           => 'OE',
               'o'            => '/o',
               'O'            => '/O',
               'ss'           => 'ss',
               'l'            => '/l',
               'L'            => '/L',
               'DH'           => 'D',
               'dh'           => 'd',
               'TH'           => 'TH', # http://www.evertype.com/standards/wynnyogh/thorn.html

               'th'           => 'th',
               'exclamdown'   => '!',
               'questiondown' => '?',
               'pounds'       => '#',
               'ordf'         => 'a',
               'ordm'         => 'o',
               'comma'        => ',',
               'euro'         => 'Euro',
               'geq'          => '>=',
               'leq'          => '<=',
               'tie'          => ' ',
               'textdegree'      => 'o',
               'quotedblleft'    => '``',
               'quotedblright'   => "''",
               'quoteleft'       => '`',
               'quoteright'      => "'",
               'quotedblbase'    => ',,',
               'quotesinglbase'  => ',',
               'guillemetleft'   => '<<',
               'guillemetright'  => '>>',
               'guillemotleft'   => '<<',
               'guillemotright'  => '>>',
               'guilsinglleft'   => '<',
               'guilsinglright'  => '>',
               'click'           => '', # specially treated
);

my %sort_brace_no_arg_commands = (
  'copyright' => 'C',
  'registeredsymbol' => 'R',
  'today' => 't', 
);

foreach my $accent_letter ('o','O','l','L') {
  $sort_brace_no_arg_commands{$accent_letter} = $accent_letter;
}


our %text_no_brace_commands = (
           '*', "\n",
           ' ', ' ',
           "\t", ' ',
           "\n", ' ',
           '-', '',  # hyphenation hint
           '|', '',  # used in formatting commands @evenfooting and friends
           '/', '',
           ':', '',
           '!', '!',
           '?', '?',
           '.', '.',
           '@', '@',
           '}', '}',
           '{', '{',
           '\\', '\\',  # should only appear in math
);

my %accent_commands = %Texinfo::Common::accent_commands;
my %unicode_to_eight_bit = %Texinfo::Convert::Unicode::unicode_to_eight_bit;

our %formatting_misc_commands;
foreach my $command ('verbatiminclude', 'sp', 'center', 'exdent', 
                     'item', 'itemx', 'tab', 'headitem',
    'node', keys(%Texinfo::Common::sectioning_commands)) {
  $formatting_misc_commands{$command} = 1;
}
 
my %ignored_types;
foreach my $type ('empty_line_after_command', 'preamble',
            'empty_spaces_after_command', 'spaces_at_end',
            'empty_spaces_before_argument', 'empty_spaces_before_paragraph',
            'empty_spaces_after_close_brace', 
            'empty_space_at_end_def_bracketed') {
  $ignored_types{$type} = 1;
}

# find the innermost accent and the correspponding text contents
# FIXME This is not output dependent, so could be in 
# Texinfo::Convert::Converter.  However this would create a 
# dependency loop.
sub _find_innermost_accent_contents($;$)
{
  my $current = shift;
  my $encoding = shift;
  my @accent_commands = ();
  my $debug = 0;
 ACCENT:
  while (1) {
    # the following can happen if called with a bad tree
    if (!$current->{'cmdname'} 
        or !$accent_commands{$current->{'cmdname'}}) {
      #print STDERR "BUG: Not an accent command in accent\n";
      cluck "BUG: Not an accent command in accent\n";
      print STDERR Texinfo::Convert::Texinfo::convert($current)."\n";
      print STDERR Data::Dumper->Dump([$current]);
      last;
    }
    push @accent_commands, $current;
    # A bogus accent
    if (!$current->{'args'}) {
      return ([], $current, \@accent_commands);
    }
    my $arg = $current->{'args'}->[0];
    # a construct like @'e without content
    if (defined($arg->{'text'})) {
      return ([$arg], $current, \@accent_commands);
    }
    if (!$arg->{'contents'}) {
      print STDERR "BUG: No content in accent command\n";
      print STDERR Data::Dumper->Dump([$current]);
      print STDERR Texinfo::Convert::Texinfo::convert($current)."\n";
      last;
    }
    # inside the braces of an accent
    my $text_contents = [];
    foreach my $content (@{$arg->{'contents'}}) {
      if (!($content->{'extra'} and $content->{'extra'}->{'invalid_nesting'})
         and !($content->{'cmdname'} and ($content->{'cmdname'} eq 'c'
                                  or $content->{'cmdname'} eq 'comment'))) {
        if ($content->{'cmdname'} and $accent_commands{$content->{'cmdname'}}) {
          $current = $content;
          next ACCENT;
        } else {
          push @$text_contents, $content;
        }
      }
    }
    # we go here if there was no nested accent
    return ($text_contents, $current, \@accent_commands);
  }
}

# find the innermost accent and format the correspponding text contents
sub _find_innermost_accent($;$$)
{
  my $current = shift;
  my $encoding = shift;
  my $in_upper_case = shift;
  my ($contents, $innermost_accent, $stack) 
      = _find_innermost_accent_contents($current);
  my $options = {};
  $options->{'enabled_encoding'} = $encoding if (defined($encoding));
  $options->{'sc'} = $in_upper_case if (defined($in_upper_case));
  return (convert({'contents' => $contents}, $options), 
          $innermost_accent, $stack);
}

# return the 8 bit, if it exists, and the unicode codepoint
sub _eight_bit_and_unicode_point($$)
{
  my $char = shift;
  my $encoding_map_name = shift;
  my ($eight_bit, $codepoint);
  if (ord($char) <= 128) { 
    # 7bit ascii characters, the same in every 8bit encodings
    $eight_bit = uc(sprintf("%02x",ord($char)));
    $codepoint = uc(sprintf("%04x",ord($char)));
  } elsif (ord($char) <= hex(0xFFFF)) {
    $codepoint = uc(sprintf("%04x",ord($char)));
    if (exists($unicode_to_eight_bit{$encoding_map_name}->{$codepoint})) {
     $eight_bit 
         = $unicode_to_eight_bit{$encoding_map_name}->{$codepoint};
    }
  }
  return ($eight_bit, $codepoint);
}

sub eight_bit_accents($$$;$)
{
  my $current = shift;
  my $encoding = shift;
  my $convert_accent = shift;
  my $in_upper_case = shift;

  my $debug;
  #$debug = 1;

  # FIXME shouldn't it be better to format the innermost conntents with 
  # a converter, if present?
  my ($text, $innermost_accent, $stack) 
    = _find_innermost_accent($current, $encoding, $in_upper_case);

  print STDERR "INNERMOST: $innermost_accent->{'cmdname'}($text)\n"
    if ($debug);

  # accents are formatted and the intermediate results are kept, such
  # that we can return the maximum of multiaccented letters that can be
  # rendered with a given eight bit formatting.
  my $accent = $innermost_accent;
  my $current_result = $text;
  my @results_stack;

  while (1) {
    my $unicode_formatted_accent
      = Texinfo::Convert::Unicode::unicode_accent($current_result, $accent);
    if (!defined($unicode_formatted_accent)) {
      last;
    }
    $current_result = $unicode_formatted_accent;
    $unicode_formatted_accent = uc($unicode_formatted_accent)
      if ($in_upper_case);
    push @results_stack, [$unicode_formatted_accent, $accent];
    last if ($accent eq $current);
    $accent = $accent->{'parent'}->{'parent'};
  }

  if ($accent ne $current) {
    while (1) {
      push @results_stack, [undef, $accent];
      last if ($accent eq $current);
      $accent = $accent->{'parent'}->{'parent'};
    }
  }

  if ($debug) {
    print STDERR "stack: ".join('|', map {$_->{'cmdname'}} @$stack)
     ."\nPARTIAL_RESULTS_STACK:\n";
    foreach my $partial_result (@results_stack) {
      if (defined($partial_result->[0])) {
        print STDERR "   -> ".Encode::encode('utf8', $partial_result->[0])
                            ."|$partial_result->[1]->{'cmdname'}\n";
      } else {
        print STDERR "   -> NO UTF8 |$partial_result->[1]->{'cmdname'}\n";
      }
    }
  }

  my $encoding_map_name 
       = $Texinfo::Encoding::eight_bit_encoding_aliases{$encoding};
  # At this point we have the utf8 encoded results for the accent
  # commands stack, with all the intermediate results.
  # For each one we'll check if it is possible to encode it in the 
  # current eight bit output encoding table
  my ($eight_bit, $dummy) 
     = _eight_bit_and_unicode_point($text, $encoding_map_name);
  my $eight_bit_command_index = -1;
  foreach my $partial_result (@results_stack) {
    my $char = $partial_result->[0];
    last if (!defined($char));

    my ($new_eight_bit, $new_codepoint) = _eight_bit_and_unicode_point($char,
                                                           $encoding_map_name);
    if ($debug) {
      my $eight_bit_txt = 'undef';
      $eight_bit_txt = $eight_bit if (defined($eight_bit));
      print STDERR "" . Encode::encode('utf8', $char) 
        . " ($partial_result->[1]->{'cmdname'}), new_codepoint: $new_codepoint 8bit: $new_eight_bit old:$eight_bit_txt\n";
    }

    # no corresponding eight bit character found for a composed character
    last if (!$new_eight_bit);

    # in that case, the new eight bit character is the same than the one 
    # found with one less character (and it isn't a @dotless{i}). It may
    # hapen in 2 case, both meaning that there is no corresponding 8bit char:
    #
    # -> there are 2 characters in accent. This could happen, for example
    #    if an accent that cannot be rendered is found and it leads to 
    #    appending or prepending a character. For example this happens for
    #    @={@,{@~{n}}}, where @,{@~{n}} is expanded to a 2 character:
    #    n with a tilde, followed by a , 
    #    In that case, the additional utf8 diacritic is appended, which 
    #    means that it is composed with the , and leaves n with a tilde 
    #    untouched. 
    # -> the diacritic is appended but the normal form doesn't lead
    #    to a composed character, such that the first character
    #    of the string is unchanged. This, for example, happens for 
    #    @ubaraccent{a} since there is no composed accent with a and an 
    #    underbar.
    last if (($new_eight_bit eq $eight_bit)
       and !($partial_result->[1]->{'cmdname'} eq 'dotless' and $char eq 'i'));
    $eight_bit = $new_eight_bit;
    $eight_bit_command_index++;
  }
  # handle the remaining accents, that have not been converted to 8bit
  # compatible unicode
  my $result = $text;
  $result = $results_stack[$eight_bit_command_index]->[0] 
    if ($eight_bit_command_index > -1);
  for (my $remaining_accents = $eight_bit_command_index+1; 
          $remaining_accents <= $#results_stack; $remaining_accents++) {
    $result = &$convert_accent($result, 
                               $results_stack[$remaining_accents]->[1],
                               $in_upper_case);
    print STDERR "REMAINING($remaining_accents) "
       .Encode::encode('utf8', $result)."\n" if ($debug);
  }

  # An important remark is that the final conversion to 8bit is left to
  # perl.
  return $result;
}

sub ascii_accent($$)
{
  my $text = shift;
  my $command = shift;
  my $accent = $command->{'cmdname'};
  return $text if ($accent eq 'dotless');
  return $text . "''" if ($accent eq 'H');
  return $text . '.' if ($accent eq 'dotaccent');
  return $text . '*' if ($accent eq 'ringaccent');
  return $text . '[' if ($accent eq 'tieaccent');
  return $text . '(' if ($accent eq 'u');
  return $text . '_' if ($accent eq 'ubaraccent');
  return '.' . $text  if ($accent eq 'udotaccent');
  return $text . '<' if ($accent eq 'v');
  return $text . ';' if ($accent eq 'ogonek');
  return $text . $accent;
}

# format a stack of accents as ascii
sub ascii_accents ($;$)
{
  my $current = shift;
  my $in_upper_case = shift;

  my ($result, $innermost_accent, $stack) 
    = _find_innermost_accent($current, undef, $in_upper_case);

  $result = uc($result) if ($in_upper_case and $result =~ /^\w$/);
  foreach my $accent_command (reverse(@$stack)) {
    $result = ascii_accent ($result, $accent_command);
  }
  return $result;
}

# format a stack of accents as unicode
sub unicode_accents ($$;$)
{
  my $current = shift;
  my $format_accent = shift;
  my $in_upper_case = shift;
  my ($result, $innermost_accent, $stack) = _find_innermost_accent($current,
          'utf-8', $in_upper_case);
  my @stack_accent_commands = reverse(@$stack);

  while (@stack_accent_commands) {
    my $accent_command = shift @stack_accent_commands;
    my $formatted_result
     = Texinfo::Convert::Unicode::unicode_accent($result, $accent_command);
    if (!defined($formatted_result)) {
      unshift @stack_accent_commands, $accent_command;
    } else {
      $result = $formatted_result;
    }
  }
  $result = uc ($result) if ($in_upper_case);
  while (@stack_accent_commands) {
    my $accent_command = shift @stack_accent_commands;
    $result = &$format_accent($result, $accent_command, $in_upper_case);
  }
  return $result;
}

sub text_accents($$;$)
{
  my $accent = shift;
  my $encoding = shift;
  my $in_upper_case = shift;
  
  return '' if (!$accent->{'args'});
  if ($encoding and $encoding eq 'utf-8') {
    return unicode_accents($accent, \&ascii_accent, $in_upper_case);
  } elsif ($encoding 
           and $Texinfo::Encoding::eight_bit_encoding_aliases{$encoding}) {
    return eight_bit_accents($accent, $encoding, \&ascii_accent, $in_upper_case);
  } else {
    my $result = ascii_accents($accent, $in_upper_case);
  }
}

sub brace_no_arg_command($;$)
{
  my $root = shift;
  my $options = shift;
  my $encoding;
  $encoding = $options->{'enabled_encoding'}
    if ($options and $options->{'enabled_encoding'});

  my $command = $root->{'cmdname'};
  $command = $root->{'extra'}->{'clickstyle'}
     if ($root->{'extra'}
      and defined($root->{'extra'}->{'clickstyle'})
      and defined($text_brace_no_arg_commands{$root->{'extra'}->{'clickstyle'}}));
  my $result;
  if ($encoding
      and (($encoding eq 'utf-8' 
            and $Texinfo::Convert::Unicode::unicode_character_brace_no_arg_commands{$command})
           or ($Texinfo::Encoding::eight_bit_encoding_aliases{$encoding}
               and $unicode_to_eight_bit{$Texinfo::Encoding::eight_bit_encoding_aliases{$encoding}}->{$Texinfo::Convert::Unicode::unicode_map{$command}}))) {
    $result = $Texinfo::Convert::Unicode::unicode_character_brace_no_arg_commands{$command};
  } elsif ($options and $options->{'sort_string'} 
           and $sort_brace_no_arg_commands{$command}) {
    $result = $sort_brace_no_arg_commands{$command};
  } else {
    $result = $text_brace_no_arg_commands{$command};
  }
  if ($options and $options->{'sc'} 
      and $Texinfo::Common::letter_no_arg_commands{$command}) {
    $result = uc($result);
  }
  return $result;
}

my %underline_symbol = (
  0 => '*',
  1 => '*',
  2 => '=',
  3 => '-',
  4 => '.'
);

sub numbered_heading($$$)
{
  my $current = shift;
  my $text = shift;
  my $numbered = shift;

  $text = $current->{'number'}.' '.$text if (defined($current->{'number'}) 
                                         and ($numbered or !defined($numbered)));
  if ($current->{'cmdname'} eq 'appendix' and $current->{'level'} == 1) {
    # FIXME i18n
    $text = 'Appendix '.$text;
  }
  chomp ($text);
  return $text;
}

sub heading($$$)
{
  my $current = shift;
  my $text = shift;
  my $numbered = shift;

  $text = numbered_heading($current, $text, $numbered);
  return '' if ($text !~ /\S/);
  my $result = $text ."\n";
  $result .=($underline_symbol{$current->{'level'}} 
     x Texinfo::Convert::Unicode::string_width($text))."\n";
  return $result;
}

sub _normalise_space($)
{
  return undef unless (defined ($_[0]));
  my $text = shift;
  $text =~ s/\s+/ /go;
  $text =~ s/ $//;
  $text =~ s/^ //;
  return $text;
}

sub _code_options($)
{
  my $options = shift;
  my $code_options;
  if (defined($options)) {
    $code_options = { %$options };
  } else {
    $code_options = {};
  }
  $code_options->{'code'} = 1;
  return $code_options;
}

sub convert($;$);

sub convert($;$)
{
  my $root = shift;
  my $options = shift;

  if (0) {
    print STDERR "root\n";
    print STDERR "  Command: $root->{'cmdname'}\n" if ($root->{'cmdname'});
    print STDERR "  Type: $root->{'type'}\n" if ($root->{'type'});
    print STDERR "  Text: $root->{'text'}\n" if (defined($root->{'text'}));
    #print STDERR "  Special def_command: $root->{'extra'}->{'def_command'}\n"
    #  if (defined($root->{'extra'}) and $root->{'extra'}->{'def_command'});
  }

  return '' if (!($root->{'type'} and $root->{'type'} eq 'def_line')
     and (($root->{'type'} and $ignored_types{$root->{'type'}})
          or ($root->{'cmdname'} 
             and ($ignored_brace_commands{$root->{'cmdname'}} 
                 or $ignored_block_commands{$root->{'cmdname'}}
             # here ignore most of the misc commands
                 or ($root->{'args'} and $root->{'args'}->[0] 
                     and $root->{'args'}->[0]->{'type'} 
                     and ($root->{'args'}->[0]->{'type'} eq 'misc_line_arg'
                         or $root->{'args'}->[0]->{'type'} eq 'misc_arg') 
                     and !$formatting_misc_commands{$root->{'cmdname'}})))));
  my $result = '';
  if (defined($root->{'text'})) {
    $result = $root->{'text'};
    if (! defined($root->{'type'}) or $root->{'type'} ne 'raw') {
      if ($options->{'sc'}) {
        $result = uc($result);
      }
      if (!$options->{'code'}) {
        $result =~ s/``/"/g;
        $result =~ s/\'\'/"/g;
        $result =~ s/---/\x{1F}/g;
        $result =~ s/--/-/g;
        $result =~ s/\x{1F}/--/g;
      }
    }
  }
  if ($root->{'cmdname'}) {
    my $command = $root->{'cmdname'};
    if (defined($text_no_brace_commands{$root->{'cmdname'}})) {
      return $text_no_brace_commands{$root->{'cmdname'}};
    } elsif ($root->{'cmdname'} eq 'today') {
      if ($options->{'sort_string'} 
          and $sort_brace_no_arg_commands{$root->{'cmdname'}}) {
        return $sort_brace_no_arg_commands{$root->{'cmdname'}};
      } elsif ($options->{'converter'}) {
        return convert(Texinfo::Common::expand_today($options->{'converter'}),
                       $options);
      } elsif ($options->{'TEST'}) {
        return 'a sunny day';
      } else {
        my($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst)
          = localtime(time);
        $year += ($year < 70) ? 2000 : 1900;
        return "$Texinfo::Common::MONTH_NAMES[$mon] $mday, $year";
      }
    } elsif (defined($text_brace_no_arg_commands{$root->{'cmdname'}})) {
      return brace_no_arg_command($root, $options);
    # commands with braces
    } elsif ($accent_commands{$root->{'cmdname'}}) {
      my $result = text_accents ($root, $options->{'enabled_encoding'}, 
                                        $options->{'sc'});
      return $result;
    } elsif ($root->{'cmdname'} eq 'image') {
      return convert($root->{'args'}->[0], _code_options($options));
    } elsif ($root->{'cmdname'} eq 'email') {
      my $mail = _normalise_space(convert($root->{'args'}->[0], 
                                          _code_options($options)));
      my $text;
      $text = _normalise_space(convert($root->{'args'}->[1], $options)) 
         if (defined($root->{'args'}->[1]));
      return $text if (defined($text) and ($text ne ''));
      return $mail;
    } elsif ($root->{'cmdname'} eq 'uref' or $root->{'cmdname'} eq 'url') {
      my $replacement;
      $replacement = _normalise_space(convert($root->{'args'}->[2], $options))
        if (defined($root->{'args'}->[2]));
      return $replacement if (defined($replacement) and $replacement ne '');
      my $text;
      $text = convert($root->{'args'}->[1], $options)
        if (defined($root->{'args'}->[1]));
      my $url = convert($root->{'args'}->[0], _code_options($options));
      if (defined($text) and $text ne '') {
        return "$url ($text)";
      } else {
        return $url;
      }
    } elsif ($Texinfo::Common::explained_commands{$root->{'cmdname'}}
             and $root->{'args'} and $root->{'args'}->[1]) {
      my $explanation = convert($root->{'args'}->[1], $options);
      if ($explanation ne '') {
        return convert($root->{'args'}->[0], $options) ." ($explanation)";
      } else {
        return convert($root->{'args'}->[0], $options);
      }
    } elsif ($root->{'args'} and $root->{'args'}->[0] 
           and (($root->{'args'}->[0]->{'type'}
                and $root->{'args'}->[0]->{'type'} eq 'brace_command_arg')
                or $root->{'cmdname'} eq 'math')) {
      my $result;
      if ($root->{'cmdname'} eq 'sc') {
        $options = {%$options, 'sc' => 1};
      } elsif ($Texinfo::Common::code_style_commands{$root->{'cmdname'}}
               or $root->{'cmdname'} eq 'math') {
        $options = _code_options($options);
      }
      $result = convert($root->{'args'}->[0], $options);
      return $result;
    # block commands
    } elsif ($root->{'cmdname'} eq 'quotation'
             or $root->{'cmdname'} eq 'smallquotation'
             or $root->{'cmdname'} eq 'float') {
      if ($root->{'args'}) {
        foreach my $arg (@{$root->{'args'}}) {
          my $converted_arg = convert($arg, $options);
          if ($converted_arg =~ /\S/) {
            $result .= $converted_arg.", ";
          }
        }
        $result =~ s/, $//;
        chomp ($result);
        $result .= "\n";
      }
    } elsif ($formatting_misc_commands{$root->{'cmdname'}} and $root->{'args'}) {
      if ($root->{'cmdname'} eq 'sp') {
        if ($root->{'extra'} and $root->{'extra'}->{'misc_args'}
            and $root->{'extra'}->{'misc_args'}->[0]) {
          # this useless copy avoids perl changing the type to integer!
          my $sp_nr = $root->{'extra'}->{'misc_args'}->[0];
          $result = "\n" x $sp_nr;
        }
      } elsif ($root->{'cmdname'} eq 'verbatiminclude') {
        my $verbatim_include_verbatim
          = Texinfo::Common::expand_verbatiminclude($options->{'converter'},
                                                    $root);
        if (defined($verbatim_include_verbatim)) {
          $result .= convert($verbatim_include_verbatim, $options);
        }
      } elsif ($root->{'cmdname'} ne 'node') {
        $result = convert($root->{'args'}->[0], $options);
        if ($Texinfo::Common::sectioning_commands{$root->{'cmdname'}}) {
          $result = heading ($root, $result, $options->{'NUMBER_SECTIONS'});
        } else {
        # we always want an end of line even if is was eaten by a 
          chomp ($result);
          $result .= "\n";
        }
      }
    } elsif ($root->{'cmdname'} eq 'item' 
            and $root->{'parent'}->{'cmdname'} 
            and $root->{'parent'}->{'cmdname'} eq 'enumerate') {
      $result .= Texinfo::Common::enumerate_item_representation(
         $root->{'parent'}->{'extra'}->{'enumerate_specification'},
         $root->{'extra'}->{'item_number'}) . '. ';
    }
  }
  if ($root->{'type'} and $root->{'type'} eq 'def_line') {
    #print STDERR "$root->{'extra'}->{'def_command'}\n";
    if ($root->{'extra'} and $root->{'extra'}->{'def_args'}
             and @{$root->{'extra'}->{'def_args'}}) {
      my $parsed_definition_category
        = Texinfo::Common::definition_category ($options->{'converter'}, $root);
      my @contents = ($parsed_definition_category, {'text' => ': '});
      if ($root->{'extra'}->{'def_parsed_hash'}->{'type'}) {
        push @contents, ($root->{'extra'}->{'def_parsed_hash'}->{'type'},
                         {'text' => ' '});
      }
      push @contents, $root->{'extra'}->{'def_parsed_hash'}->{'name'};

      my $arguments = Texinfo::Common::definition_arguments_content($root);
      if ($arguments) {
        push @contents, {'text' => ' '};
        push @contents, @$arguments;
      }
      push @contents, {'text' => "\n"};
      $result = convert({'contents' => \@contents}, _code_options($options));
    }
    #$result = convert($root->{'args'}->[0], $options) if ($root->{'args'});
  } elsif ($root->{'type'} and $root->{'type'} eq 'menu_entry') {
    foreach my $arg (@{$root->{'args'}}) {
      if ($arg->{'type'} eq 'menu_entry_node') {
        $result .= convert($arg, _code_options($options));
      } else {
        $result .= convert($arg, $options);
      }
    }
  }
  if ($root->{'contents'}) {
    if ($root->{'cmdname'} 
        and $Texinfo::Common::preformatted_code_commands{$root->{'cmdname'}}) {
      $options = _code_options($options);
    }
    if (ref($root->{'contents'}) ne 'ARRAY') {
      cluck "contents not an array($root->{'contents'}).";
    }
    foreach my $content (@{$root->{'contents'}}) {
      $result .= convert($content, $options);
    }
  }
  $result = '{'.$result.'}' 
     if ($root->{'type'} and $root->{'type'} eq 'bracketed'
         and (!$root->{'parent'}->{'type'} or
              ($root->{'parent'}->{'type'} ne 'block_line_arg'
               and $root->{'parent'}->{'type'} ne 'misc_line_arg')));
  return $result;
}

1;
