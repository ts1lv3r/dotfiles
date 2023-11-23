local status_ok, dashboard = pcall(require, 'dashboard')
if not status_ok then
  return
end

dashboard.setup({
  theme = 'doom', --  theme is doom and hyper default is hyper
  -- keymap_type   --  shorcut type 'letter' or 'number'
  hide = {
    statusline = true, -- hide statusline default is true
    tabline = true,       -- hide the tabline
    winbar = true,        -- hide winbar
  },
  config = {
    header = {
      '                    ..                              ',
      '                    ........                        ',
      '                  ............                      ',
      '        ............................                ',
      '          ................................          ',
      '             .............``...................     ',
      '              ............:ol;.,...............     ',
      '               ..........:`lo K.o. .............    ',
      '                .........oooo K ...  ... ........   ',
      '                 ........`cooc......`c.`........... ',
      '                  .........`;cl;`..`::l,............',
      '                   .............`,,,,........... ...',
      '                   ....:lc;`......................  ',
      '                   ....NWWWWXOxoodxO0XXX0d,.        ',
      '                  .....docoOXXNNXNNXXk:             ',
      '                  .....:WKdc;;,,;;,                 ',
      '                 . ... xWWNK00; ...                 ',
      '                  .....NWWWWNKl    .....            ',
      '                 .......oWWWNNK.   .......          ',
      '              . ........ xWWWWW0.  ........         ',
      '             ..  ....... OWWWWNWk   .......         ',
      '            .... ......  XWWWWWNX                   ',
      '           ....         `WWWWWNWK                   ',
      '         . .....      `XNWWWWNNXc ..                ',
      '       ... .......   ;xNWWWWNNX; .....              ',
      '    ...... ......... d00KOko:   ......              ',
      '    ........  .....             .....               ',
      '  ........  ....            ....                    ',
      '  ......   ......            ....                   ',
      ' ......       ...                                   ',
      '  ....                                              ',
      '    ..                                              ',
      '                                                    ',
    },
    center = {
      {
        icon = '  ',
        icon_hl = 'Title',
        -- desc = 'Find  File',
        desc = 'Explore By File Name',
        desc_hl = 'String',
        key = 'f',
        keymap = 'SPC f f',
        key_hl = 'Number',
        action = 'Telescope find_files',
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        -- desc = 'Find  File  from  Word',
        desc = 'Explore By Word',
        desc_hl = 'String',
        key = 'w',
        keymap = 'SPC f g',
        key_hl = 'Number',
        action = 'Telescope live_grep',
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Explore By Git Status',
        desc_hl = 'String',
        key = 'g',
        keymap = 'SPC g g',
        key_hl = 'Number',
        action = 'Telescope git_status',
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Filer',
        desc_hl = 'String',
        key = 'b',
        keymap = 's f',
        key_hl = 'Number',
        action = 'Fern . -reveal=% -drawer',
      },
      {
        icon = '🐅 ',
        icon_hl = 'Title',
        desc = 'Quit',
        desc_hl = 'String',
        key = 'q',
        key_hl = 'Number',
        action = 'quit',
      },
    },
    footer = {}  --your footer
  },
  -- preview = {
  --   command       -- preview command
  --   file_path     -- preview file path
  --   file_height   -- preview file height
  --   file_width    -- preview file width
  -- },
})
