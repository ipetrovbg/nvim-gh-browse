# nvim gh browse

This plugin allows you to open GitHub repository from Neovim.
If your cursor is on a file path, it will try to open the file in GitHub otherwise it will open the repository.

## Installation
```lua
use {
  'nvim-gh-browse',
  config = function()
    require('gh-browse').setup()
  end
}
```

## Usage
```lua
vim.keymap.set("n", "<leader>gb", ":GhBrowse<CR>", opts)
```
