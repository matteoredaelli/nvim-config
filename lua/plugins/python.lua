return {
  -- Formatter: ruff per formatting e import sorting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- python = { "ruff_format", "ruff_organize_imports" },
      },
    },
  },

  -- LSP: basedpyright con rilevamento dinamico del venv di uv.
  -- Struttura: piu' repo git, ognuno con pyproject.toml in root
  -- e altri pyproject.toml in sottocartelle indipendenti (ognuna col proprio .venv).
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          -- Ancora l'LSP al pyproject.toml PIU' VICINO al file aperto.
          -- vim.fs.root risale dal file e si ferma alla prima dir che contiene
          -- un marker: siccome sia la root del repo sia le sottocartelle hanno
          -- un pyproject.toml, prende sempre la sottocartella corretta.
          -- .git resta solo come fallback (repo senza pyproject in quel ramo).
          root_dir = function(bufnr, on_dir)
            local fname = vim.api.nvim_buf_get_name(bufnr)
            local root = vim.fs.root(fname, { "pyproject.toml", "uv.lock", ".git" })
            on_dir(root or vim.fs.dirname(fname))
          end,
          settings = {
            basedpyright = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
              },
            },
          },
          -- Cerca il .venv partendo dalla root rilevata e, se assente,
          -- risale verso l'alto (utile se il sottoprogetto non ha un .venv
          -- proprio ma condivide quello del repo).
          on_init = function(client)
            local root = client.root_dir
            if not root then
              return
            end

            local function find_venv_python(start)
              local found = vim.fs.find(".venv", {
                upward = true,
                path = start,
                type = "directory",
                limit = 1,
              })[1]
              if found then
                local py = found .. "/bin/python"
                if vim.fn.executable(py) == 1 then
                  return py
                end
              end
              return nil
            end

            local py = find_venv_python(root)
            if py then
              client.settings = vim.tbl_deep_extend("force", client.settings or {}, {
                python = { pythonPath = py },
              })
              client:notify("workspace/didChangeConfiguration", { settings = client.settings })
              vim.notify(
                "basedpyright -> " .. vim.fn.fnamemodify(py, ":~"),
                vim.log.levels.INFO,
                { title = "Python venv" }
              )
            else
              vim.notify(
                "basedpyright: nessun .venv trovato da " .. vim.fn.fnamemodify(root, ":~") .. " (uso Python di sistema)",
                vim.log.levels.WARN,
                { title = "Python venv" }
              )
            end
          end,
        },
      },
    },
  },
}
