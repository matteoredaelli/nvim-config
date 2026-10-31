return {
  -- Treesitter: parser per HCL e Terraform
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "hcl",
        "terraform",
      },
    },
  },

  -- LSP: terraform-ls con supporto OpenTofu
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terraformls = {
          init_options = {
            experimentalFeatures = { prefillRequiredFields = true },
          },
        },
      },
    },
  },

  -- Formatter: terraform fmt (funziona anche per .tofu)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        terraform = { "terraform_fmt" },
      },
    },
  },

  -- Mason: installa automaticamente terraform-ls e tflint
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "terraform-ls",
        "tflint",
      },
    },
  },

  -- Linting con tflint
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        terraform = { "tflint" },
      },
    },
  },
}
