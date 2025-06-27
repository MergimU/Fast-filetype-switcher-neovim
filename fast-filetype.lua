local M = {}

local filetypes = {
  "javascript",
  "typescript",
  "go",
  "lua",
  "python",
  "html",
  "css",
  "json",
  "markdown",
  "bash",
  "rust",
  "cpp",
  "c",
  "java",
  "yaml",
  "toml",
  "sql",
  "sh",
  "vue",
  "astro",
}

function M.pick_filetype()
  local pickers = require "telescope.pickers"
  local finders = require "telescope.finders"
  local actions = require "telescope.actions"
  local action_state = require "telescope.actions.state"
  local conf = require("telescope.config").values

  -- Wrap strings into Telescope-compatible entries
  local entries = vim.tbl_map(function(ft)
    return { value = ft, display = ft, ordinal = ft }
  end, filetypes)

  pickers
      .new({}, {
        prompt_title = "Set Filetype",
        finder = finders.new_table {
          results = entries,
          entry_maker = function(entry)
            return entry
          end,
        },
        sorter = conf.generic_sorter {},
        attach_mappings = function(_, _)
          actions.select_default:replace(function(prompt_bufnr)
            local entry = action_state.get_selected_entry()
            actions.close(prompt_bufnr)

            if entry and entry.value then
              vim.schedule(function()
                vim.bo.filetype = entry.value
                print("Filetype set to: " .. entry.value)
              end)
            else
              print "No filetype selected."
            end
          end)
          return true
        end,
      })
      :find()
end

return M
