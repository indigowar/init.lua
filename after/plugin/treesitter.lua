local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp", "rust", "go", "javascript", "html" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
})
