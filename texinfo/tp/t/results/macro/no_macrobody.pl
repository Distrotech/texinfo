use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'no_macrobody'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'no_macrobody',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => 'arg',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [],
      'parent' => {},
      'special' => {
        'args_index' => {
          'arg' => 0
        },
        'macro_line' => ' no_macrobody {arg}
',
        'macrobody' => ''
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => '.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'no_macrobody'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'no_macrobody'}{'contents'}[0];
$result_trees{'no_macrobody'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'no_macrobody'}{'contents'}[0];
$result_trees{'no_macrobody'}{'contents'}[0]{'parent'} = $result_trees{'no_macrobody'};
$result_trees{'no_macrobody'}{'contents'}[1]{'parent'} = $result_trees{'no_macrobody'};
$result_trees{'no_macrobody'}{'contents'}[2]{'parent'} = $result_trees{'no_macrobody'};
$result_trees{'no_macrobody'}{'contents'}[3]{'parent'} = $result_trees{'no_macrobody'};
$result_trees{'no_macrobody'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'no_macrobody'}{'contents'}[4];
$result_trees{'no_macrobody'}{'contents'}[4]{'parent'} = $result_trees{'no_macrobody'};

$result_texts{'no_macrobody'} = '@macro no_macrobody {arg}
@end macro



.
';

$result_errors{'no_macrobody'} = [];


