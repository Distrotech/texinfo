use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'empty_documentencoding'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => '   
',
              'type' => 'empty_line_after_command'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'documentencoding',
      'parent' => {},
      'special' => {
        'text_arg' => ''
      }
    }
  ],
  'type' => 'text_root'
};
$result_trees{'empty_documentencoding'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_documentencoding'}{'contents'}[0]{'args'}[0];
$result_trees{'empty_documentencoding'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_documentencoding'}{'contents'}[0];
$result_trees{'empty_documentencoding'}{'contents'}[0]{'parent'} = $result_trees{'empty_documentencoding'};

$result_texis{'empty_documentencoding'} = '@documentencoding   
';


$result_texts{'empty_documentencoding'} = '';

$result_errors{'empty_documentencoding'} = [
  {
    'error_line' => ':1: warning: @documentencoding missing argument
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@documentencoding missing argument',
    'type' => 'warning'
  }
];


