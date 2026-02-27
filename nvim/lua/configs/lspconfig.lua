require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "ts_ls",           -- TypeScript / JavaScript
  "rust_analyzer",   -- Rust (your core engine!)
  "tailwindcss",     -- Tailwind CSS
  "eslint",          -- ESLint
  "lua_ls",          -- Lua (nvim config)
}

vim.lsp.enable(servers)
