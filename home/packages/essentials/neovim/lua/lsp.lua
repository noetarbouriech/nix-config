lspconfig = require'lspconfig'

lspconfig.pyls.setup{}
lspconfig.tsserver.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.gopls.setup{}
lspconfig.gdscript.setup{}
-- lspconfig.rnix.setup{}
lspconfig.ccls.setup{
    cmd = {
        'ccls',
        '--init={"cache": {"directory": "/tmp/ccls-cache"}}'
    };
    capabilities = capabilities
} -- c language


vim.o.completeopt = "menuone,noselect"

-- Autocompletion setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;
  source = {
    path = true;
    buffer = false;
    nvim_lsp = true;
  };
}

-- Set tab to accept the autocompletion
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})

