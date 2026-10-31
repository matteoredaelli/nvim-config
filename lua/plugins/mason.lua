return {
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonUninstall", "MasonLog" },
    opts = {
      ensure_installed = {
        -- Python
        "ruff",
        "basedpyright",
        "debugpy",
        -- Shell
        "stylua",
        "shellcheck",
        "shfmt",
      },
    },
  },
}
