-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
local options = { noremap = true }
vim.keymap.set("i", "jj", "<Esc>", options)
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

lvim.autocommands = {
	{
		{ "BufEnter", "BufWinEnter" },
		{
			pattern = {"*.sls", "*.yaml"},
			command = "setlocal ts=2 sw=2",
		},
	},
}
