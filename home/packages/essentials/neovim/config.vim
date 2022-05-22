colorscheme nord
set background=dark
set t_Co=256
syntax on
set nu
set noerrorbells
set relativenumber
set noshowmode
set nowrap

set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set nobackup
set nowritebackup
set undodir=~/.config/nvim/undodir
set undofile
set hidden

set mouse=a
set incsearch
set nohlsearch
set updatetime=300
set clipboard=unnamedplus
set guifont=FantasqueSansMono\ Nerd\ Font:h14

if $TERM =~# '256color' && ( $TERM =~# '^screen'  || $TERM =~# '^tmux' )
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif


lua <<EOF
vim.defer_fn(function()
  vim.cmd [[
    luafile /home/noe/nix/home/packages/essentials/neovim/init.lua
  ]]
end, 70)

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "nix", "python", "java", "go", "css", "html", "gdscript", "c", "javascript", "yaml" }, 
  highlight = {
    enable = true,
  },
}
EOF
