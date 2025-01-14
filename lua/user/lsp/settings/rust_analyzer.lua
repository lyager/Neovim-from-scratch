local project_features_env = os.getenv("NVIM_RUST_FEATURES")
local project_features = {}

if project_features_env ~= nil and project_features_env ~= "" then
	local function split(str, sep)
		local result = {}
		local regex = ("([^%s]+)"):format(sep)
		for each in str:gmatch(regex) do
			table.insert(result, each)
		end
		return result
	end
	project_features = split(project_features_env, ",")
end

return {
	settings = {
		["rust-analyzer"] = {
			checkOnSave = true,
			check = {
				command = "clippy",
				features = project_features,
			},
			cargo = {
				features = project_features,
			},
		},
	},
}
