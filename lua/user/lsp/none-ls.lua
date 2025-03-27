local none_ls_status_ok, non_ls = pcall(require, "none-ls")
if not none_ls_status_ok then
	return
end

local formatting = none_ls.builtins.formatting
local diagnostics = none_ls.builtins.diagnostics

none_ls.setup({
	debug = false,
	sources = {
		formatting.prettier,
		--diagnostics.eslint,
		-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		-- diagnostics.phpcs.with({ extra_args = { "--standard=PSR2" } }),
		-- diagnostics.flake8
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
					--vim.lsp.buf.formatting_sync()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
