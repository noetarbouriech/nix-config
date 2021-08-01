colorscheme nord
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

lua <<EOF
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'nord',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'}
}
EOF
