return{
	  --lsp para autocompletado
  {'neovim/nvim-lspconfig',
    dependencies = {
      -- LSP Support
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp',
        dependencies = {
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'hrsh7th/cmp-cmdline'},
          {'petertriho/cmp-git'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},
        }
      },
    },
    config = function()
      require('mason').setup()

      require('mason-lspconfig').setup{
        ensure_installed = {
          'lua_ls','ts_ls','pyright',
          'tailwindcss','jsonls','dockerls','yamlls','html',
          'rust_analyzer',
        },
        automatic_enable = { exclude = { 'jdtls' } },
      }

      local caps = require('cmp_nvim_lsp').default_capabilities()

      -- 4. Overrides específicos
      vim.lsp.config('lua_ls', {
        capabilities = caps,
        settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
      })

      vim.lsp.config('tailwindcss', {
        capabilities = caps,
        filetypes = { 'css' },
      })

      local cmp          = require('cmp')
      local cmp_select   = {behavior = cmp.SelectBehavior.Select}
      local cmp_mappings = cmp.mapping.preset.insert({
        ['<C-o>']        = cmp.mapping.select_prev_item(cmp_select),
        ['<C-e>']        = cmp.mapping.select_next_item(cmp_select),
        ['<C-a>']        = cmp.mapping.confirm({ select = true }),
        -- desactivar comportamientos indeseados
        ['<CR>']    = function(fallback) fallback() end,
        ['<Up>']    = function(fallback) fallback() end,
        ['<Down>']  = function(fallback) fallback() end,
        ['<Left>']  = function(fallback) fallback() end,
        ['<Right>'] = function(fallback) fallback() end,
      })

      cmp_mappings['<Tab>']   = nil
      cmp_mappings['<S-Tab>'] = nil

      cmp.setup({
        mapping = cmp_mappings,
        sources = {
          {name = 'nvim_lsp'},
          {name = 'luasnip'},
          {name = 'path'},
          {name = 'cmp_git'},
          {name = 'nvim_lua'},
          {name = 'buffer'},
        },
        snippet = {
          expand = function(args) require('luasnip').lsp_expand(args.body) end,
        },
      })

      -- Fix mappings for luasnip with dvorak movement keys
      _G.is_snippet_running = false -- flag to check if a snippet is running
      local utils = require('utils')
      cmp.event:on('confirm_done', function() -- when a completion is confirmed: disable rtns remap
        utils.disable_rtns_mappings()
        _G.is_snippet_running = true -- it means that a snippet is running or a completion is confirmed
      end)
      -- when ESC is pressed: enable rtns remap
      vim.keymap.set({'i', 'v'}, '<Esc>', function ()
        if _G.is_snippet_running then -- only call the function when is necessary
          _G.is_snippet_running = false
          utils.enable_rtns_mappings()
        end
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
      end, { noremap = true, silent = false })
      -- Fix mappings for luasnip with dvorak movement keys

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' },   -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
            { name = 'buffer' },
          }, {
            { name = 'luasnip' },
          })
      })

      require("cmp_git").setup() -- setup cmp-git

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      -- cmp.setup.cmdline({ '/', '?' }, {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = {
      --     { name = 'buffer' }
      --   }
      -- })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
            { name = 'cmdline' }
          })
      })

      -- on_attach + keymaps ------------
      local function my_on_attach(_, bufnr)
        local hover = "[LSP] Hover"
        local diagnostic = "[LSP] Diagnostic"
        local definition = "[LSP] Definition"
        local type_definition = "[LSP] Type Definition"
        local implementation = "[LSP] Implementation"
        local rename = "[LSP] Rename"
        local code_action = "[LSP] Code Action"

        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {buffer = 0, remap = false, desc = hover})
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {buffer = 0, remap = false, desc = definition})
        vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, {buffer = 0, remap = false, desc = type_definition})
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, {buffer = 0, remap = false, desc = implementation})
        vim.keymap.set("n", "<CR>e", function() vim.diagnostic.goto_next() end, {buffer = 0, remap = false, desc = diagnostic})
        vim.keymap.set("n", "<CR>r", function() vim.lsp.buf.rename() end, {buffer = 0, remap = false, desc = rename})
        vim.keymap.set("n", "<CR>ca", function() vim.lsp.buf.code_action() end, {buffer = 0, remap = false, desc = code_action})
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          my_on_attach(vim.lsp.get_client_by_id(args.data.client_id), args.buf)
        end,
      })

      vim.diagnostic.config({
        virtual_text = true,
        signs = {
          text = { error = 'E', warn = 'W', hint = 'H', info = 'I' },
        },
      })
    end
  },
}
