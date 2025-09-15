return {
  'MagicDuck/grug-far.nvim',
  -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
  -- additional lazy config to defer loading is not really needed...
  config = function()
    -- optional setup call to override plugin options
    -- alternatively you can set options with vim.g.grug_far = { ... }
    require('grug-far').setup({
      -- options, see Configuration section below
      -- there are no required options atm
    });

    vim.keymap.set('n', '<leader>sr', function()
      require('grug-far').open()
    end, { desc = 'Search and Replace' })
    
    vim.keymap.set('x', '<leader>sr', function()
      require('grug-far').with_visual_selection()
    end, { desc = 'Search and Replace (visual selection)' })

  end
};
