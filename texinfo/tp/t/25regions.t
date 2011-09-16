use strict;

require 't/test_utils.pl';

my @test_cases = (
['copying_not_closed',
'@copying

This is a copyright notice
'],
['double_copying',
'@copying

This is a copyright notice

@copying
And a second one (?)
@end copying
@end copying
'],
['double_titlepage_not_closed',
'@titlepage

This is in title page


@titlepage

And still in title page
']
);

my @test_formatted = (
['anchor_in_copying',
'
@copying

Copying.
@anchor{Copying information}

@end copying

@node Top

@insertcopying

@insertcopying

@xref{Copying information}.

'],
['anchor_in_copying_in_footnote',
'@copying

Copying@footnote{
In footnote.
@anchor{Copying footnote}
}.

@end copying

@node Top

@insertcopying

@insertcopying

@xref{Copying footnote}.

'],
['format_in_titlepage',
'@titlepage

@format
Published
@end format

@end titlepage

@node Top

'],
['anchor_in_titlepage',
'@titlepage

@anchor{in titlepage}
@end titlepage

@top top
@node Top

@xref{in titlepage}.
'],
['ref_in_copying',
'@copying
@ref{GFDL}
@end copying

@node Top
@top top

@insertcopying

@menu
* GFDL::
@end menu

@node GFDL
@chapter GFDL

'],
);

foreach my $test (@test_formatted) {
  push @{$test->[2]->{'test_formats'}}, 'info';
  push @{$test->[2]->{'test_formats'}}, 'html';
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('regions', [@test_cases, @test_formatted], $arg_test_case,
   $arg_generate, $arg_debug);

