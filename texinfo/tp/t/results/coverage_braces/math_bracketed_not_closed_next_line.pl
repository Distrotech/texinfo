use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'math_bracketed_not_closed_next_line'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'aa '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '
'
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_line'
                    }
                  ],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 1,
                    'macro' => ''
                  },
                  'parent' => {},
                  'type' => 'bracketed'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'math',
          'contents' => [],
          'extra' => {
            'spaces_before_argument' => {
              'parent' => {},
              'text' => '',
              'type' => 'empty_spaces_before_argument'
            }
          },
          'line_nr' => {},
          'parent' => {}
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'math_bracketed_not_closed_next_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'math_bracketed_not_closed_next_line'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'math_bracketed_not_closed_next_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'math_bracketed_not_closed_next_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'math_bracketed_not_closed_next_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'math_bracketed_not_closed_next_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'math_bracketed_not_closed_next_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'math_bracketed_not_closed_next_line'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'math_bracketed_not_closed_next_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'math_bracketed_not_closed_next_line'}{'contents'}[0]{'contents'}[0];
$result_trees{'math_bracketed_not_closed_next_line'}{'contents'}[0]{'contents'}[0]{'extra'}{'spaces_before_argument'}{'parent'} = $result_trees{'math_bracketed_not_closed_next_line'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'math_bracketed_not_closed_next_line'}{'contents'}[0]{'contents'}[0]{'line_nr'} = $result_trees{'math_bracketed_not_closed_next_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'math_bracketed_not_closed_next_line'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'math_bracketed_not_closed_next_line'}{'contents'}[0];
$result_trees{'math_bracketed_not_closed_next_line'}{'contents'}[0]{'parent'} = $result_trees{'math_bracketed_not_closed_next_line'};

$result_texis{'math_bracketed_not_closed_next_line'} = '@math{aa {

}}';


$result_texts{'math_bracketed_not_closed_next_line'} = 'aa {

}';

$result_errors{'math_bracketed_not_closed_next_line'} = [
  {
    'error_line' => ':1: Misplaced {
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Misplaced {',
    'type' => 'error'
  },
  {
    'error_line' => ':1: @math missing close brace
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@math missing close brace',
    'type' => 'error'
  }
];


1;
