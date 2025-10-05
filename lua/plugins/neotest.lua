---@type LazySpec
return {
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "marilari88/neotest-vitest",
    },
    opts = function(_, opts)
      if not opts.adapters then
        opts.adapters = {}
      end
      table.insert(
        opts.adapters,
        require("neotest-vitest")({
          -- Filter directories when searching for test files
          filter_dir = function(name, rel_path, root)
            return name ~= "node_modules"
          end,
        })
      )
    end,
  },
  {
    "marilari88/neotest-vitest",
    lazy = true,
  },
  {
    "AstroNvim/astrocore",
    optional = true,
    opts = function(_, opts)
      local maps = opts.mappings
      local prefix = "<Leader>T"

      maps.n[prefix] = { desc = "󰗇 Tests" }

      -- Running tests
      maps.n[prefix .. "t"] = {
        function()
          require("neotest").run.run()
        end,
        desc = "Run nearest test",
      }
      maps.n[prefix .. "f"] = {
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run current file",
      }
      maps.n[prefix .. "a"] = {
        function()
          require("neotest").run.run(vim.uv.cwd())
        end,
        desc = "Run all tests",
      }
      maps.n[prefix .. "l"] = {
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run last test",
      }

      -- Debugging tests (integrates with DAP)
      maps.n[prefix .. "d"] = {
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Debug nearest test",
      }

      -- UI controls
      maps.n[prefix .. "s"] = {
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle summary",
      }
      maps.n[prefix .. "o"] = {
        function()
          require("neotest").output.open({ enter = true })
        end,
        desc = "Open output",
      }
      maps.n[prefix .. "O"] = {
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle output panel",
      }

      -- Navigation
      maps.n["]t"] = {
        function()
          require("neotest").jump.next({ status = "failed" })
        end,
        desc = "Next failed test",
      }
      maps.n["[t"] = {
        function()
          require("neotest").jump.prev({ status = "failed" })
        end,
        desc = "Prev failed test",
      }

      -- Stop tests
      maps.n[prefix .. "x"] = {
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop test",
      }
      maps.n[prefix .. "w"] = {
        function()
          require("neotest").watch.toggle()
        end,
        desc = "Toggle watch mode",
      }
    end,
  },
}
