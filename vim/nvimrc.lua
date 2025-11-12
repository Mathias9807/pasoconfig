require('wincent.commandt').setup({
  -- always_show_dot_files = false,
  -- height = 15,
  -- ignore_case = nil, -- If nil, will infer from Neovim's `'ignorecase'`.
  mappings = {
    i = {
      -- ['<C-a>'] = '<Home>',
      -- ['<C-c>'] = 'close',
      -- ['<C-e>'] = '<End>',
      -- ['<C-h>'] = '<Left>',
      -- ['<C-j>'] = 'select_next',
      -- ['<C-k>'] = 'select_previous',
      -- ['<C-l>'] = '<Right>',
      -- ['<C-n>'] = 'select_next',
      -- ['<C-p>'] = 'select_previous',
      -- ['<C-s>'] = 'open_split',
      -- ['<C-t>'] = 'open_tab',
      -- ['<C-v>'] = 'open_vsplit',
      -- ['<CR>'] = 'open',
      ['<CR>'] = 'open_tab',
      -- ['<Down>'] = 'select_next',
      -- ['<Up>'] = 'select_previous',
    },
    n = {
      -- ['<C-a>'] = '<Home>',
      -- ['<C-c>'] = 'close',
      -- ['<C-e>'] = '<End>',
      -- ['<C-h>'] = '<Left>',
      -- ['<C-j>'] = 'select_next',
      -- ['<C-k>'] = 'select_previous',
      -- ['<C-l>'] = '<Right>',
      -- ['<C-n>'] = 'select_next',
      -- ['<C-p>'] = 'select_previous',
      -- ['<C-s>'] = 'open_split',
      -- ['<C-t>'] = 'open_tab',
      -- ['<C-u>'] = 'clear',
      -- ['<C-v>'] = 'open_vsplit',
      -- ['<CR>'] = 'open',
      ['<CR>'] = 'open_tab',
      -- ['<Down>'] = 'select_next',
      -- ['<Esc>'] = 'close',
      -- ['<Up>'] = 'select_previous',
      -- ['H'] = 'select_first',
      -- ['M'] = 'select_middle',
      -- ['G'] = 'select_last',
      -- ['L'] = 'select_last',
      -- ['gg'] = 'select_first',
      -- ['j'] = 'select_next',
      -- ['k'] = 'select_previous',
    },
  },
  -- margin = 10,
  -- never_show_dot_files = false,
  -- order = 'forward', -- 'forward' or 'reverse'.
  -- position = 'center', -- 'bottom', 'center' or 'top'.
  -- open = function(item, kind)
  --   commandt.open(item, kind)
  -- end,
  -- scanners = {
  --   file = {
  --     max_files = 0,
  --   },
  --   find = {
  --     max_files = 0,
  --   },
  --   git = {
  --     max_files = 0,
  --     submodules = true,
  --     untracked = false,
  --   },
  --   rg = {
  --     max_files = 0,
  --   },
  -- },
  -- selection_highlight = 'PMenuSel',
  -- smart_case = nil, -- If nil, will infer from Neovim's `'smartcase'`.
  -- threads = nil, -- Let heuristic apply.
})

vim.o.mousemoveevent = true

-- Setup language servers.
require("mason").setup()
require("mason-lspconfig").setup()
-- lspconfig.pylsp.setup {
-- 	on_attach = custom_attach,
-- 	settings = {
-- 		pylsp = {
-- 			plugins = {
-- 				-- formatter options
-- 				black = { enabled = true },
-- 				autopep8 = { enabled = true },
-- 				yapf = { enabled = false },
-- 				-- linter options
-- 				pylint = { enabled = false, executable = "pylint" },
-- 				pyflakes = { enabled = false },
-- 				pycodestyle = { enabled = false },
-- 				-- type checker
-- 				pylsp_mypy = { enabled = true },
-- 				-- auto-completion options
-- 				jedi_completion = { fuzzy = true },
-- 				-- import sorting
-- 				pyls_isort = { enabled = true },
-- 			},
-- 		},
-- 	},
-- 	flags = {
-- 	    debounce_text_changes = 200,
-- 	},
-- 	capabilities = capabilities,
-- }
vim.lsp.config('pylsp', {
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = {'W391', 'E501', 'E302', 'E305', 'E225', 'E201', 'E303', 'E722', 'E265', 'E116', 'E226', 'F405', 'W191', 'W391', 'E306', 'E741'},
					maxLineLength = 100
				}
			}
		}
	}
})

-- vim.lsp.enable('tsserver')
vim.lsp.enable('vue_ls')
vim.lsp.config('clangd', {
	cmd = {
		"clangd", "--header-insertion=never",
	},
})
vim.lsp.config('rust_analyzer', {
	-- Server-specific settings. See `:help lspconfig-setup`
	settings = {
		['rust-analyzer'] = {},
	},
})
vim.lsp.config('ts_ls', {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    plugins = { -- I think this was my breakthrough that made it work
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/language-server",
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

require("eagle").setup({
-- override the default values found in config.lua
})

require('mini.snippets').setup()
require('mini.icons').setup()
require('mini.completion').setup()
vim.cmd([[au FileType CommandTPrompt lua vim.b.minicompletion_disable = true]])

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'gruvbox',
	}
}

require('flygrep').setup()
