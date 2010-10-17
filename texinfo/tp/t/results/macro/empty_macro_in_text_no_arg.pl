use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'empty_macro_in_text_no_arg'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'texnl',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [],
      'parent' => {},
      'special' => {
        'arg_line' => ' texnl{}
',
        'macrobody' => ''
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'parent' => {},
      'text' => ' '
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'This.  It.
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
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'texnl2',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [],
      'parent' => {},
      'special' => {
        'arg_line' => ' texnl2
',
        'macrobody' => ''
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
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
          'text' => 'This 2 see.  A.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'empty_macro_in_text_no_arg'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_macro_in_text_no_arg'}{'contents'}[0];
$result_trees{'empty_macro_in_text_no_arg'}{'contents'}[0]{'parent'} = $result_trees{'empty_macro_in_text_no_arg'};
$result_trees{'empty_macro_in_text_no_arg'}{'contents'}[1]{'parent'} = $result_trees{'empty_macro_in_text_no_arg'};
$result_trees{'empty_macro_in_text_no_arg'}{'contents'}[2]{'parent'} = $result_trees{'empty_macro_in_text_no_arg'};
$result_trees{'empty_macro_in_text_no_arg'}{'contents'}[3]{'parent'} = $result_trees{'empty_macro_in_text_no_arg'};
$result_trees{'empty_macro_in_text_no_arg'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'empty_macro_in_text_no_arg'}{'contents'}[4];
$result_trees{'empty_macro_in_text_no_arg'}{'contents'}[4]{'parent'} = $result_trees{'empty_macro_in_text_no_arg'};
$result_trees{'empty_macro_in_text_no_arg'}{'contents'}[5]{'parent'} = $result_trees{'empty_macro_in_text_no_arg'};
$result_trees{'empty_macro_in_text_no_arg'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'empty_macro_in_text_no_arg'}{'contents'}[6];
$result_trees{'empty_macro_in_text_no_arg'}{'contents'}[6]{'parent'} = $result_trees{'empty_macro_in_text_no_arg'};
$result_trees{'empty_macro_in_text_no_arg'}{'contents'}[7]{'parent'} = $result_trees{'empty_macro_in_text_no_arg'};
$result_trees{'empty_macro_in_text_no_arg'}{'contents'}[8]{'parent'} = $result_trees{'empty_macro_in_text_no_arg'};
$result_trees{'empty_macro_in_text_no_arg'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'empty_macro_in_text_no_arg'}{'contents'}[9];
$result_trees{'empty_macro_in_text_no_arg'}{'contents'}[9]{'parent'} = $result_trees{'empty_macro_in_text_no_arg'};

$result_texis{'empty_macro_in_text_no_arg'} = '@macro texnl{}
@end macro

 This.  It.

@macro texnl2
@end macro

This 2 see.  A.
';


$result_texts{'empty_macro_in_text_no_arg'} = '
 This.  It.


This 2 see.  A.
';

$result_errors{'empty_macro_in_text_no_arg'} = [
  {
    'error_line' => ':4: warning: @texnl defined with zero or more than one argument should be invoked with {}
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => '@texnl defined with zero or more than one argument should be invoked with {}',
    'type' => 'warning'
  },
  {
    'error_line' => ':9: warning: @texnl2 defined with zero or more than one argument should be invoked with {}
',
    'file_name' => '',
    'line_nr' => 9,
    'macro' => '',
    'text' => '@texnl2 defined with zero or more than one argument should be invoked with {}',
    'type' => 'warning'
  }
];


