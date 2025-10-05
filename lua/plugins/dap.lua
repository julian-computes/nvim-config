---@type LazySpec
return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    config = function()
      local dap = require("dap")

      -- Configure vscode-js-debug adapter for Node/TypeScript debugging
      if not dap.adapters["pwa-node"] then
        -- Use standard mason path - mason-nvim-dap will install js-debug-adapter here
        local adapter_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"

        dap.adapters["pwa-node"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            args = { adapter_path, "${port}" },
          },
        }
      end

      -- Vitest configurations
      if not dap.configurations.typescript then
        dap.configurations.typescript = {}
      end

      table.insert(dap.configurations.typescript, {
        type = "pwa-node",
        request = "launch",
        name = "Debug Vitest Tests (Current File)",
        cwd = "${workspaceFolder}",
        runtimeExecutable = "node",
        runtimeArgs = {
          "./node_modules/vitest/vitest.mjs",
          "run",
          "${file}",
        },
        smartStep = true,
        console = "integratedTerminal",
        skipFiles = { "<node_internals>/**", "node_modules/**" },
      })

      table.insert(dap.configurations.typescript, {
        type = "pwa-node",
        request = "launch",
        name = "Debug Vitest Tests (All)",
        cwd = "${workspaceFolder}",
        runtimeExecutable = "node",
        runtimeArgs = {
          "./node_modules/vitest/vitest.mjs",
          "run",
        },
        smartStep = true,
        console = "integratedTerminal",
        skipFiles = { "<node_internals>/**", "node_modules/**" },
      })

      -- Also add for javascript and typescriptreact
      dap.configurations.javascript = dap.configurations.typescript
      dap.configurations.typescriptreact = dap.configurations.typescript
      dap.configurations.javascriptreact = dap.configurations.typescript
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    opts = function(_, opts)
      if not opts.ensure_installed then opts.ensure_installed = {} end
      table.insert(opts.ensure_installed, "js-debug-adapter")
      return opts
    end,
  },
}
