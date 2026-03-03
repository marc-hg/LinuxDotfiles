-- Wire up AstroNvim LSP keybindings for roslyn, which attaches outside of astrolsp
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client or client.name ~= "roslyn" then return end
    local buf = args.buf
    local map = function(key, fn, desc) vim.keymap.set("n", key, fn, { buffer = buf, desc = desc }) end

    map("<leader>la", vim.lsp.buf.code_action,                           "LSP code action")
    map("<leader>ld", vim.diagnostic.open_float,                         "Hover diagnostics")
    map("<leader>lD", function() vim.diagnostic.setloclist() end,        "Diagnostics list")
    map("<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")
    map("<leader>lh", vim.lsp.buf.signature_help,                        "Signature help")
    map("<leader>lr", vim.lsp.buf.rename,                                "Rename current symbol")
    map("<leader>lR", vim.lsp.buf.references,                            "Search references")
    map("K",          vim.lsp.buf.hover,                                  "Hover symbol details")
    map("gd",         vim.lsp.buf.definition,                            "Go to definition")
    map("gI",         vim.lsp.buf.implementation,                        "Go to implementation")
    map("]d",         vim.diagnostic.goto_next,                          "Next diagnostic")
    map("[d",         vim.diagnostic.goto_prev,                          "Previous diagnostic")
  end,
})
