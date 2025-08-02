-- Formatting configuration for large files
local M = {}

-- Function to format with extended timeout
function M.format_with_timeout(timeout_ms)
	timeout_ms = timeout_ms or 30000 -- Default 30 seconds

	local params = vim.lsp.util.make_formatting_params()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	
	for _, client in ipairs(clients) do
		if client.server_capabilities.documentFormattingProvider then
			local result = client.request_sync("textDocument/formatting", params, timeout_ms)
			if result and result.result then
				vim.lsp.util.apply_text_edits(result.result, 0, client.offset_encoding)
				return true
			end
		end
	end
	
	return false
end

-- Keymapping for manual formatting with extended timeout
vim.keymap.set("n", "<leader>cF", function()
	if not M.format_with_timeout(60000) then -- 60 seconds for manual formatting
		vim.notify("Formatting failed or timed out", vim.log.levels.WARN)
	end
end, { desc = "Format document (extended timeout)" })

return M