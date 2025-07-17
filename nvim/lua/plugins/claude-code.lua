return {
  "greggh/claude-code.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("claude-code").setup({
      -- You can customize these settings
      -- window = {
      --   position = "bottom", -- "top", "bottom", "left", "right", "float"
      --   size = 0.3, -- 0.1 to 1.0 for relative size
      -- },
      -- keymaps = {
      --   toggle = "<C-,>",
      --   continue = "<leader>cC",
      --   verbose = "<leader>cV",
      -- },
    })
  end,
  keys = {
    { "<C-,>", "<cmd>ClaudeCodeToggle<cr>", desc = "Toggle Claude Code" },
    { "<leader>cC", "<cmd>ClaudeCodeContinue<cr>", desc = "Continue Claude" },
    { "<leader>cV", "<cmd>ClaudeCodeVerbose<cr>", desc = "Claude Verbose" },
  },
}
