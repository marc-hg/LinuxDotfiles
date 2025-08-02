return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	config = true,
	keys = {
		{ "<leader>cc", nil, desc = "Claude Code" },
		{ "<leader>cct", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
		{ "<leader>ccf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude Code" },
		{ "<leader>ccr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude Code" },
		{ "<leader>ccc", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude Code" },
		{ "<leader>ccb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer to Claude Code" },
		{ "<leader>ccs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude Code" },
		{
			"<leader>ccs",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Add file from tree",
			ft = { "NvimTree", "neo-tree", "oil" },
		},
		{ "<leader>cca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude Code diff" },
		{ "<leader>ccd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny Claude Code diff" },
	},
}
