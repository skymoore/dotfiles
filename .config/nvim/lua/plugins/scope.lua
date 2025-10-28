return {
  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("scope").setup({
        hooks = {
          pre_tab_leave = function()
            -- Optional: Add any custom logic before leaving a tab
          end,
          post_tab_enter = function()
            -- Optional: Add any custom logic after entering a tab
          end,
        },
      })
      
      -- Load telescope extension for viewing all buffers across all tabs
      require("telescope").load_extension("scope")
    end,
  },
}
