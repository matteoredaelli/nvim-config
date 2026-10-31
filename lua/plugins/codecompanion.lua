return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      strategies = {
        chat = {
          adapter = "kiro",
        },
        inline = {
          adapter = "kiro",
        },
        cmd = {
          adapter = "kiro",
        },
      },
      adapters = {
        kiro = function()
          return require("codecompanion.adapters").extend("acp/kiro", {})
        end,
      },
      display = {
        chat = {
          window = {
            layout = "vertical",
            width = 0.4,
          },
        },
      },
    },
    keys = {
      { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle Chat" },
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "Actions" },
      { "<leader>ai", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add to Chat" },
      { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add to Chat" },
    },
  },
}
