local M = {}

function M.setup()
  vim.api.nvim_create_user_command("GhBrowse", function()
    local file_name = vim.fn.expand('%:.') -- Get the current file path relative to the repository root
    if file_name == '' then
      vim.fn.jobstart({
        'gh', 'browse'
      }, {
        on_exit = function(job, code)
          if code ~= 0 then
            vim.notify("Failed to open GitHub repository", vim.log.levels.ERROR)
          end
        end
      })
      return
    end

    local current_row = vim.api.nvim_win_get_cursor(vim.api.nvim_get_current_win())[1]
    if current_row > 0 then
      file_name = file_name .. ":" .. tostring(current_row)
    end

    vim.fn.jobstart({
      'gh', 'browse', file_name,
    }, {
      on_exit = function(job, code)
        if code ~= 0 then
          vim.notify("Failed to open GitHub repository", vim.log.levels.ERROR)
        end
      end
    })
  end, {})
end

return M
