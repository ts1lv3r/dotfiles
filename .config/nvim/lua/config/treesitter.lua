local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter.setup {
    ensure_installed = {
      "c",
      "cpp",
      "vue",
      "sql",
      "lua",
      "vim",
      "diff",
      "rust",
      "bash",
      "json",
      "html",
      "make",
      "yaml",
      "markdown",
      "gitignore",
      "javascript",
      "typescript",
      "dockerfile",
    },
    highlight = { enable = true },
}

