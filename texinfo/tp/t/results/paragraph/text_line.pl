use vars qw(%result_texis %result_trees %result_errors);

$result_trees{'text_line'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'text
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    }
  ]
};
$result_trees{'text_line'}{'contents'}[0]{'parent'} = $result_trees{'text_line'};
$result_trees{'text_line'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'text_line'}{'contents'}[1];
$result_trees{'text_line'}{'contents'}[1]{'parent'} = $result_trees{'text_line'};
$result_trees{'text_line'}{'contents'}[2]{'parent'} = $result_trees{'text_line'};

$result_texis{'text_line'} = '
text

';

$result_errors{'text_line'} = [];


