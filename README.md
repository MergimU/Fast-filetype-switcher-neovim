# Fast-filetype-switcher-neovim

![Preview Filetype Switcher](preview.png)

Add `fast-filetype.lua` to folder 'lua/plugins/fast-filetype.lua'

Set the keybindings
```
-- Fast Filetype switcher
vim.keymap.set("n", "<leader>sf", function()
  require("plugins.fast-filetype").pick_filetype()
end, { desc = "Pick and set filetype" })

```
