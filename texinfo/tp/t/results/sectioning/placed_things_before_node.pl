use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'placed_things_before_node'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'An anchor'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'anchor',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ]
            ],
            'node_content' => [
              {}
            ],
            'normalized' => 'An-anchor'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 1,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'text' => '
',
          'type' => 'empty_spaces_after_close_brace'
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
              'text' => 'Ref to the anchor:
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'An anchor'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'ref',
              'contents' => [],
              'extra' => {
                'brace_command_contents' => [
                  [
                    {}
                  ]
                ],
                'label' => {},
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'An-anchor'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 4,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'Ref to the anchor in footnote:
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Anchor in footnote'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'ref',
              'contents' => [],
              'extra' => {
                'brace_command_contents' => [
                  [
                    {}
                  ]
                ],
                'label' => {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'Anchor in footnote'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'anchor',
                  'contents' => [],
                  'extra' => {
                    'brace_command_contents' => [
                      [
                        {}
                      ]
                    ],
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'Anchor-in-footnote'
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 11,
                    'macro' => ''
                  },
                  'parent' => {
                    'contents' => [
                      {
                        'contents' => [
                          {
                            'parent' => {},
                            'text' => 'In footnote.
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
                      {},
                      {
                        'text' => '
',
                        'type' => 'empty_spaces_after_close_brace'
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
                            'text' => 'Ref to main text anchor
'
                          },
                          {
                            'args' => [
                              {
                                'contents' => [
                                  {
                                    'parent' => {},
                                    'text' => 'An anchor'
                                  }
                                ],
                                'parent' => {},
                                'type' => 'brace_command_arg'
                              }
                            ],
                            'cmdname' => 'ref',
                            'contents' => [],
                            'extra' => {
                              'brace_command_contents' => [
                                [
                                  {}
                                ]
                              ],
                              'label' => {},
                              'node_argument' => {
                                'node_content' => [
                                  {}
                                ],
                                'normalized' => 'An-anchor'
                              }
                            },
                            'line_nr' => {
                              'file_name' => '',
                              'line_nr' => 14,
                              'macro' => ''
                            },
                            'parent' => {}
                          },
                          {
                            'parent' => {},
                            'text' => '
'
                          }
                        ],
                        'parent' => {},
                        'type' => 'paragraph'
                      }
                    ],
                    'parent' => {
                      'args' => [
                        {}
                      ],
                      'cmdname' => 'footnote',
                      'contents' => [],
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 9,
                        'macro' => ''
                      },
                      'parent' => {
                        'contents' => [
                          {},
                          {
                            'parent' => {},
                            'text' => '
'
                          }
                        ],
                        'parent' => {},
                        'type' => 'paragraph'
                      }
                    },
                    'type' => 'brace_command_context'
                  }
                },
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'Anchor-in-footnote'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 7,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '.
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
        {},
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            },
            {
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'parent' => {},
                  'text' => 'float anchor'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'space_at_end_block_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'In float
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
                      'extra' => {
                        'command' => {}
                      },
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => 'float'
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
                'command_argument' => 'float',
                'text_arg' => 'float'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 19,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'extra' => {
            'block_command_line_contents' => [
              undef,
              [
                {}
              ]
            ],
            'end_command' => {},
            'node_content' => [
              {}
            ],
            'normalized' => 'float-anchor',
            'type' => {
              'normalized' => ''
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 17,
            'macro' => ''
          },
          'number' => 1,
          'parent' => {}
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
              'text' => 'Ref to float
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'float anchor'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'ref',
              'contents' => [],
              'extra' => {
                'brace_command_contents' => [
                  [
                    {}
                  ]
                ],
                'label' => {},
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'float-anchor'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 22,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '.
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
          'cmdname' => 'menu',
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'An anchor'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::                ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'menu entry pointing to the anchor.
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_description'
                }
              ],
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'An-anchor'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 25,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'menu_entry'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'extra' => {
                        'command' => {}
                      },
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => 'menu'
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
                'command_argument' => 'menu',
                'text_arg' => 'menu'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 26,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'extra' => {
            'end_command' => {}
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 24,
            'macro' => ''
          },
          'parent' => {}
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
              'contents' => [
                {
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'index entry'
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
          'cmdname' => 'cindex',
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'content_normalized' => [],
              'in_code' => 0,
              'index_at_command' => 'cindex',
              'index_name' => 'cp',
              'index_prefix' => 'c',
              'index_type_command' => 'cindex',
              'key' => 'index entry',
              'number' => 1
            },
            'misc_content' => []
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 28,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'index_entry_command'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'parent' => {},
      'type' => 'text_root'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'Top'
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
      'cmdname' => 'node',
      'contents' => [],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'Top'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 30,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'top section'
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
      'cmdname' => 'top',
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
              'text' => 'Ref to anchor
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'An anchor'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'ref',
              'contents' => [],
              'extra' => {
                'brace_command_contents' => [
                  [
                    {}
                  ]
                ],
                'label' => {},
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'An-anchor'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 34,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'Ref to footnote anchor
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Anchor in footnote'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'ref',
              'contents' => [],
              'extra' => {
                'brace_command_contents' => [
                  [
                    {}
                  ]
                ],
                'label' => {},
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'Anchor-in-footnote'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 37,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'misc_content' => [
          {}
        ]
      },
      'level' => 0,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 31,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[0]{'extra'}{'node_content'}[0] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[3];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[3]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'extra'}{'label'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[3];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[3];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'args'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'};
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'extra'}{'node_content'}[0] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'};
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'};
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[2] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'};
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[4]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'};
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'extra'}{'label'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'};
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'}{'args'}[0] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'};
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'}{'parent'}{'contents'}[0] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'};
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'}{'parent'}{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'}{'parent'};
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'}{'parent'}{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[7] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'}{'parent'};
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[8]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'args'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'args'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'args'}[1]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'extra'}{'command'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'args'}[1]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'extra'}{'end_command'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'extra'}{'node_content'}[0] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'args'}[1]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[10]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[11]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[11];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[11]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[11]{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[11]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[11]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[11]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[11]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[11]{'contents'}[1]{'extra'}{'label'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[9];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[11]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[11]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[11]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[11];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[11]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[11];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[11]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[12]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[0]{'extra'}{'command'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[3];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[3];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[2];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[2];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'extra'}{'command'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'extra'}{'end_command'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'contents'}[2];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[13]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[14]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[15]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[15];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[15]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[15]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[15]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[15]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[15]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[15]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[15];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[15]{'extra'}{'index_entry'}{'command'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[15];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[15]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[15]{'args'}[0]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[15]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[15]{'extra'}{'index_entry'}{'content'};
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[15]{'extra'}{'misc_content'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[15]{'extra'}{'index_entry'}{'content'};
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[15]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[16]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'};
$result_trees{'placed_things_before_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'placed_things_before_node'}{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'placed_things_before_node'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'placed_things_before_node'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'placed_things_before_node'}{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_node'};
$result_trees{'placed_things_before_node'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'placed_things_before_node'}{'contents'}[2];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[2]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[2]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[2]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[2];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[2];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'label'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[2];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[2];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[3];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[3]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'extra'}{'label'} = $result_trees{'placed_things_before_node'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'};
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[3];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[3];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'placed_things_before_node'}{'contents'}[2];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'placed_things_before_node'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'placed_things_before_node'}{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_node'};

$result_texis{'placed_things_before_node'} = '@anchor{An anchor}

Ref to the anchor:
@ref{An anchor}

Ref to the anchor in footnote:
@ref{Anchor in footnote}.

@footnote{In footnote.

@anchor{Anchor in footnote}

Ref to main text anchor
@ref{An anchor}
}

@float , float anchor
In float
@end float

Ref to float
@ref{float anchor}.

@menu
* An anchor::                menu entry pointing to the anchor.
@end menu

@cindex index entry

@node Top
@top top section

Ref to anchor
@ref{An anchor}

Ref to footnote anchor
@ref{Anchor in footnote}
';


$result_texts{'placed_things_before_node'} = '
Ref to the anchor:


Ref to the anchor in footnote:
.



float anchor
In float

Ref to float
.

* An anchor::                menu entry pointing to the anchor.


top section
***********

Ref to anchor


Ref to footnote anchor

';

$result_sectioning{'placed_things_before_node'} = {
  'level' => -1,
  'section_childs' => [
    {
      'cmdname' => 'top',
      'extra' => {
        'associated_node' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'Top'
          }
        }
      },
      'level' => 0,
      'section_up' => {}
    }
  ]
};
$result_sectioning{'placed_things_before_node'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'placed_things_before_node'};

$result_nodes{'placed_things_before_node'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {},
      'level' => 0
    },
    'normalized' => 'Top'
  },
  'node_up' => {
    'extra' => {
      'manual_content' => [
        {
          'text' => 'dir'
        }
      ],
      'top_node_up' => {}
    },
    'type' => 'top_node_up'
  }
};
$result_nodes{'placed_things_before_node'}{'node_up'}{'extra'}{'top_node_up'} = $result_nodes{'placed_things_before_node'};

$result_menus{'placed_things_before_node'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'placed_things_before_node'} = [
  {
    'error_line' => ':24: @menu seen before first @node
',
    'file_name' => '',
    'line_nr' => 24,
    'macro' => '',
    'text' => '@menu seen before first @node',
    'type' => 'error'
  },
  {
    'error_line' => ':24: perhaps your @top node should be wrapped in @ifnottex rather than @ifinfo?
',
    'file_name' => '',
    'line_nr' => 24,
    'macro' => '',
    'text' => 'perhaps your @top node should be wrapped in @ifnottex rather than @ifinfo?',
    'type' => 'error continuation'
  },
  {
    'error_line' => ':28: warning: Entry for index `cp\' outside of any node
',
    'file_name' => '',
    'line_nr' => 28,
    'macro' => '',
    'text' => 'Entry for index `cp\' outside of any node',
    'type' => 'warning'
  }
];


$result_floats{'placed_things_before_node'} = {
  '' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'end_command' => {
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'float',
            'text_arg' => 'float'
          }
        },
        'normalized' => 'float-anchor',
        'type' => {
          'normalized' => ''
        }
      },
      'number' => 1
    }
  ]
};
$result_floats{'placed_things_before_node'}{''}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_floats{'placed_things_before_node'}{''}[0];



$result_converted{'info'}->{'placed_things_before_node'} = 'This is , produced by tp version from .

Ref to the anchor: *note An anchor::

   Ref to the anchor in footnote: *note Anchor in footnote::.

   (1)

In float

1

   Ref to float *note 1: float anchor.

* Menu:

* An anchor::                menu entry pointing to the anchor.


File: ,  Node: Top,  Up: (dir)

top section
***********

Ref to anchor *note An anchor::

   Ref to footnote anchor *note Anchor in footnote::

   ---------- Footnotes ----------

   (1) In footnote.

   Ref to main text anchor *note An anchor::



Tag Table:
Ref: An anchor41
Ref: float anchor150
Node: Top277
Ref: Top-Footnote-1459
Ref: Anchor in footnote480

End Tag Table
';

$result_converted_errors{'info'}->{'placed_things_before_node'} = [
  {
    'file_name' => '',
    'error_line' => ':1: warning: @anchor outside of any node
',
    'text' => '@anchor outside of any node',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 1
  },
  {
    'file_name' => '',
    'error_line' => ':9: warning: @footnote outside of any node
',
    'text' => '@footnote outside of any node',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 9
  },
  {
    'file_name' => '',
    'error_line' => ':17: warning: @float outside of any node
',
    'text' => '@float outside of any node',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 17
  }
];



$result_converted{'html'}->{'placed_things_before_node'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Created by texinfo, http://www.gnu.org/software/texinfo/ -->
<head>
<title>top section</title>

<meta name="description" content="top section">
<meta name="keywords" content="top section">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="Generator" content="tp">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="#Top" rel="start" title="Top">
<style type="text/css">
<!--
a.summary-letter {text-decoration: none}
blockquote.smallquotation {font-size: smaller}
div.display {margin-left: 3.2em}
div.example {margin-left: 3.2em}
div.lisp {margin-left: 3.2em}
div.smalldisplay {margin-left: 3.2em}
div.smallexample {margin-left: 3.2em}
div.smalllisp {margin-left: 3.2em}
kbd {font-style:oblique}
pre.display {font-family: serif}
pre.format {font-family: serif}
pre.menu-comment {font-family: serif}
pre.menu-preformatted {font-family: serif}
pre.smalldisplay {font-family: serif; font-size: smaller}
pre.smallexample {font-size: smaller}
pre.smallformat {font-family: serif; font-size: smaller}
pre.smalllisp {font-size: smaller}
span.nocodebreak {white-space:pre}
span.nolinebreak {white-space:pre}
span.roman {font-family:serif; font-weight:normal}
span.sansserif {font-family:sans-serif; font-weight:normal}
ul.no-bullet {list-style: none}
-->
</style>


</head>

<body lang="en" bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#800080" alink="#FF0000">
<a name="An-anchor"></a>
<p>Ref to the anchor:
<a href="#An-anchor">An anchor</a>
</p>
<p>Ref to the anchor in footnote:
<a href="#Anchor-in-footnote">Anchor in footnote</a>.
</p>
<p><a name="DOCF1" href="#FOOT1">(1)</a>
</p>
<div class="float"><a name="float-anchor"></a>
<p>In float
</p><div class="float-caption"><p><strong>1
</strong></p></div></div>
<p>Ref to float
<a href="#float-anchor">float anchor</a>.
</p>
<table class="menu" border="0" cellspacing="0">
<tr><td align="left" valign="top">&bull; <a href="#An-anchor" accesskey="1">An anchor</a>:</td><td>&nbsp;&nbsp;</td><td align="left" valign="top">menu entry pointing to the anchor.
</td></tr>
</table>

<a name="index-index-entry"></a>

<a name="Top"></a>
<a name="top-section"></a>
<h1 class="top">top section</h1>

<p>Ref to anchor
<a href="#An-anchor">An anchor</a>
</p>
<p>Ref to footnote anchor
<a href="#Anchor-in-footnote">Anchor in footnote</a>
</p><div class="footnote">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h3><a name="FOOT1" href="#DOCF1">(1)</a></h3>
<p>In footnote.
</p>
<a name="Anchor-in-footnote"></a>
<p>Ref to main text anchor
<a href="#An-anchor">An anchor</a>
</p>
</div>
<hr>



</body>
</html>
';

1;
