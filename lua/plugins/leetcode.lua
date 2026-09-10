require("leetcode").setup({
	-- arg = "leetcode.com", -- use "leetcode.cn" if you're on the China site

	lang = "java", -- default language for new problems (e.g. "python3", "javascript", "go")

	cn = {
		enabled = false,
	},

	storage = {
		home = vim.fn.stdpath("data") .. "/leetcode",
		cache = vim.fn.stdpath("cache") .. "/leetcode",
	},

	-- directory structure for storing solutions
	directories_created = { "cache" },

	-- console/result window
	console = {
		open_on_runcode = true,
	},

	description = {
		show_stats = true,
		position = "left",
		width = "40%",
	},

	-- picker used for language/question selection; you already have telescope so it'll use that automatically
	picker = { provider = "telescope" },

	keys = {
		toggle = { "q" },
		confirm = { "<CR>" },
		reset_testcases = "r",
		use_testcase = "U",
		focus_testcases = "H",
		focus_result = "L",
	},
})
