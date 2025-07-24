# nvim gh browse

This plugin allows you to open GitHub repository from Neovim.
If your cursor is on a file path, it will try to open the file in GitHub otherwise it will open the repository.

## Prerequisites
- gh CLI must be installed and configured. - https://cli.github.com/

## Installation

Lazy:
```lua
return {
  'ipetrovbg/nvim-gh-browse',
  lazy = false,
  config = function()
    require('gh-browse').setup()
  end
}
```

## Usage
```lua
vim.keymap.set("n", "<leader>gb", ":GhBrowse<CR>", opts)
```
