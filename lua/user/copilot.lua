local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
	return
end

copilot.setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
	filetypes = {
		yaml = true,
		markdown = true,
	},
	--server_opts_overrides = {
	--	trace = "verbose",
	--	settings = {
	--		advanced = {
	--			listCount = 10, -- #completions for panel
	--			inlineSuggestCount = 3, -- #completions for getCompletions
	--		},
	--	},
	--},
})
