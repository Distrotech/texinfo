use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats);

$result_trees{'empty_second_email_argument'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'parent' => {},
                  'text' => 'a'
                },
                {
                  'cmdname' => '@',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => 'b.c'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'email',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {},
                {},
                {}
              ],
              undef
            ]
          },
          'parent' => {}
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'empty_second_email_argument'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_second_email_argument'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_second_email_argument'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_second_email_argument'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_second_email_argument'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'empty_second_email_argument'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_second_email_argument'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_second_email_argument'}{'contents'}[0]{'contents'}[0];
$result_trees{'empty_second_email_argument'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'empty_second_email_argument'}{'contents'}[0]{'contents'}[0];
$result_trees{'empty_second_email_argument'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'empty_second_email_argument'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'empty_second_email_argument'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][1] = $result_trees{'empty_second_email_argument'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'empty_second_email_argument'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][2] = $result_trees{'empty_second_email_argument'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'empty_second_email_argument'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_second_email_argument'}{'contents'}[0];
$result_trees{'empty_second_email_argument'}{'contents'}[0]{'parent'} = $result_trees{'empty_second_email_argument'};

$result_texis{'empty_second_email_argument'} = '@email{ a@@b.c, }';


$result_texts{'empty_second_email_argument'} = 'a@b.c';

$result_errors{'empty_second_email_argument'} = [];


1;
