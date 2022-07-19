require("toggleterm").setup{
  open_mapping = [[<c-\>]],
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  shade_terminals = false,
  float_opts = {
    border = 'single',
    width = 140,
    height = 35,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
