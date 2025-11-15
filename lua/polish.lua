-- Disable diagnostics
-- Matches buffers like: conjure-log-34234.cljc (and .clj/.cljs)
vim.api.nvim_create_autocmd({ "BufReadPost", "BufWinEnter", "BufEnter" }, {
  pattern = { "conjure-log-*.clj", "conjure-log-*.cljs", "conjure-log-*.cljc" },
  callback = function(ev)
    -- Turn off diagnostics display for this buffer
    vim.diagnostic.enable(false, { bufnr = ev.buf })
    -- Detach any LSP clients (clojure_lsp, null-ls) from this buffer
    for _, client in pairs(vim.lsp.get_clients({ bufnr = ev.buf })) do
      if client.name == "clojure_lsp" or client.name == "null-ls" then
        pcall(vim.lsp.buf_detach_client, ev.buf, client.id)
      end
    end
  end,
})
