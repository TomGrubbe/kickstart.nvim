return {
  {
    -- BUGGY: DiffviewOpen errors out with "Not a repo (or any parent), or no supported VCS adapter!"
    "sindrets/diffview.nvim",

    dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },

    keys = {
      {
        "dv",
        function()
          if next(require("diffview.lib").views) == nil then
            vim.cmd("DiffviewOpen")
          else
            vim.cmd("DiffviewClose")
          end
        end,
        desc = "Toggle Diffview window",
      },
    },
  },

}
