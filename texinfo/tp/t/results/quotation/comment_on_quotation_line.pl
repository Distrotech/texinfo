use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'comment_on_quotation_line'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'truc'
            },
            {
              'cmdname' => ' ',
              'parent' => {}
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' quotation 
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'quotation',
      'contents' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'In quotation
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'quotation'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'quotation',
            'text_arg' => 'quotation'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {},
            {}
          ]
        ],
        'end_command' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'comment_on_quotation_line'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment_on_quotation_line'}{'contents'}[0]{'args'}[0];
$result_trees{'comment_on_quotation_line'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'comment_on_quotation_line'}{'contents'}[0]{'args'}[0];
$result_trees{'comment_on_quotation_line'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'comment_on_quotation_line'}{'contents'}[0]{'args'}[0];
$result_trees{'comment_on_quotation_line'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'comment_on_quotation_line'}{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'comment_on_quotation_line'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'comment_on_quotation_line'}{'contents'}[0]{'args'}[0];
$result_trees{'comment_on_quotation_line'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'comment_on_quotation_line'}{'contents'}[0];
$result_trees{'comment_on_quotation_line'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment_on_quotation_line'}{'contents'}[0]{'contents'}[0];
$result_trees{'comment_on_quotation_line'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment_on_quotation_line'}{'contents'}[0];
$result_trees{'comment_on_quotation_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment_on_quotation_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'comment_on_quotation_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'comment_on_quotation_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'comment_on_quotation_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'comment_on_quotation_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'comment_on_quotation_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comment_on_quotation_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'comment_on_quotation_line'}{'contents'}[0]{'contents'}[1]{'extra'}{'command'} = $result_trees{'comment_on_quotation_line'}{'contents'}[0];
$result_trees{'comment_on_quotation_line'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'comment_on_quotation_line'}{'contents'}[0];
$result_trees{'comment_on_quotation_line'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'comment_on_quotation_line'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'comment_on_quotation_line'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][1] = $result_trees{'comment_on_quotation_line'}{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'comment_on_quotation_line'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'comment_on_quotation_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'comment_on_quotation_line'}{'contents'}[0]{'parent'} = $result_trees{'comment_on_quotation_line'};

$result_texis{'comment_on_quotation_line'} = '@quotation truc@ @c quotation 
In quotation
@end quotation
';


$result_texts{'comment_on_quotation_line'} = 'truc 
In quotation
';

$result_errors{'comment_on_quotation_line'} = [];



$result_converted{'plaintext'}->{'comment_on_quotation_line'} = '     truc : In quotation
';

1;
