local M = {}

function M.setup()
  vim.api.nvim_create_user_command("GhBrowse", function()
    local file_name = vim.fn.expand('%')
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

    vim.fn.jobstart({
      'gh', 'browse', file_name
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
