return {
  {
    "nanozuki/tabby.nvim",
    event = "VeryLazy",
    dependencies = { 
      "nvim-tree/nvim-web-devicons",
      "tiagovla/scope.nvim",
    },
    config = function()
      local util = require("tabby.util")
      local hl_tabline = util.extract_nvim_hl("TabLine")
      local hl_normal = util.extract_nvim_hl("Normal")
      local active_tab_hl = { fg = hl_normal.fg, bg = hl_normal.bg, style = "bold" }
      local inactive_tab_hl = { fg = hl_tabline.fg, bg = hl_tabline.bg }

      local components = function()
        local coms = {}
        
        -- Add tabs
        local tabs = vim.api.nvim_list_tabpages()
        local current_tab = vim.api.nvim_get_current_tabpage()
        for _, tabid in ipairs(tabs) do
          local hl = (tabid == current_tab) and active_tab_hl or inactive_tab_hl
          table.insert(coms, {
            type = "tab",
            tabid = tabid,
            label = {
              string.format(" %d ", vim.api.nvim_tabpage_get_number(tabid)),
              hl = hl,
            },
          })
        end
        
        -- Add spacer to push buffers to the right
        table.insert(coms, { type = "spring" })
        
        -- Add ALL buffers (not just ones in current tab)
        local cur_bufid = vim.api.nvim_get_current_buf()
        for _, bufid in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_valid(bufid) and vim.bo[bufid].buflisted then
            local hl = (bufid == cur_bufid) and active_tab_hl or inactive_tab_hl
            local buf_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufid), ":t")
            if buf_name == "" then
              buf_name = "[No Name]"
            end
            -- Truncate long names
            if #buf_name > 20 then
              buf_name = buf_name:sub(1, 17) .. "..."
            end
            table.insert(coms, {
              type = "text",
              text = {
                string.format(" %s ", buf_name),
                hl = hl,
              },
            })
          end
        end
        
        return coms
      end

      require("tabby").setup({
        components = components,
      })
    end,
  },
}
