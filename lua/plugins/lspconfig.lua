return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        PATH = "prepend",
      })
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "gopls",
          "templ",
          "html",
          "cssls",
          "htmx",
          "tailwindcss",
          "ts_ls",
          "pylsp",
          "clangd",
          "prismals",
          "yamlls",
          "jsonls",
          "eslint",
          "zls",
          "marksman",
          "wgsl_analyzer",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.zls.setup({
        capabilities = capabilities,
        cmd = { "zls" },
      })
      lspconfig.hls.setup({
        capabilities = capabilities,
        -- on_attach = function()
        -- 	vim.cmd([[
        --     augroup LspFormatting
        --       autocmd! * <buffer>
        --       autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
        --     augroup END
        --   ]])
        -- end,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.wgsl_analyzer.setup({
        capabilities = capabilities,
      })
      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.prismals.setup({
        capabilities = capabilities,
      })
      lspconfig.yamlls.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
        filetypes = {
          "templ",
          "html",
          "css",
          "javascriptreact",
          "typescriptreact",
          "javascript",
          "typescript",
          "jsx",
          "tsx",
        },
      })
      lspconfig.solidity_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { "vscode-solidity-server", "--stdio" },
        --cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
        filetypes = { "solidity" },
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
      })
      lspconfig.htmx.setup({
        capabilities = capabilities,
        filetypes = { "html", "templ" },
      })
      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = {
          "templ",
          "html",
          "css",
          "javascriptreact",
          "typescriptreact",
          "javascript",
          "typescript",
          "jsx",
          "tsx",
          "markdown",
        },
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        filetypes = {
          "templ",
          "html",
          "css",
          "javascriptreact",
          "typescriptreact",
          "javascript",
          "typescript",
          "jsx",
          "tsx",
        },
        root_dir = require("lspconfig").util.root_pattern(
          "tailwind.config.js",
          "tailwind.config.cjs",
          "tailwind.config.mjs",
          "tailwind.config.ts",
          "postcss.config.js",
          "postcss.config.cjs",
          "postcss.config.mjs",
          "postcss.config.ts",
          "package.json",
          "node_modules",
          ".git"
        ),
      })
      lspconfig.templ.setup({
        capabilities = capabilities,
        filetypes = { "templ" },
      })
      lspconfig.ts_ls.setup({
        capabilties = capabilities,
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "html",
        },
      })
      lspconfig.eslint.setup({
        capabilties = capabilities,
      })

      require("lspconfig").gleam.setup({
        capabilities = capabilities,
      })

      require("lspconfig").clangd.setup({
        cmd = {
          "clangd",
          "--background-index",
          "--pch-storage=memory",
          "--all-scopes-completion",
          "--pretty",
          "--header-insertion=never",
          "-j=4",
          "--inlay-hints",
          "--header-insertion-decorators",
          "--function-arg-placeholders",
          "--completion-style=detailed",
        },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = require("lspconfig").util.root_pattern("src"),
        init_option = { fallbackFlags = { "-std=c++2a" } },
        capabilities = capabilities,
      })

      function get_python_path()
        -- Check if there's an active virtual environment
        local venv_path = os.getenv("VIRTUAL_ENV")
        if venv_path then
          return venv_path .. "/bin/python3"
        else
          -- get os name
          local os_name = require("utils").get_os()
          -- get os interpreter path
          if os_name == "windows" then
            return "C:/python312"
          elseif os_name == "linux" then
            return "/usr/bin/python3"
          else
            return nil
          end
          -- Fallback to global Python interpreter
        end
      end

      lspconfig.pylsp.setup({
        capabilties = capabilities,
        settings = {
          python = {
            pythonPath = get_python_path(),
          },
        },
      })

      lspconfig.marksman.setup({
        capabilties = capabilities,
      })

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          ["rust-analyzer"] = {
            enable = "true",
            assist = {
              importGranularity = "module",
              importPrefix = "by_self",
            },
            cargo = {
              autoreload = true,
              buildScripts = {
                enable = true,
                overrideCommand = {
                  "build",
                  "--package",
                  "--bin",
                  "--example",
                  "--all-targets",
                },
              },
              noDefaultFeatures = true,
              targetDir = "./target",
            },
            diagnostics = {
              enable = true,
            },
            procMacro = {
              enable = true,
            },
          },
        },
        -- cmd = { "rust-analyzer" },
        -- filetypes = { "rust" },
        -- root_dir = function(fname)
        --   return util.root_pattern("Cargo.toml", "rust-project.json")(fname) or util.find_git_ancestor(fname)
        -- end,
      })
      lspconfig.gleam.setup({
        capabilties = capabilities,
      })
    end,
  },
}
