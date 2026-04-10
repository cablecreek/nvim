return {
  "mfussenegger/nvim-dap",
  dependencies = {
    -- UI
    "rcarriga/nvim-dap-ui",

    -- Required dependency for nvim-dap-ui
    "nvim-neotest/nvim-nio",

    -- Installs the debug adapters for you
    "mason-org/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",

    -- Add language debuggers here
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
  },

  -- stylua: ignore
  keys = {
    -- Session Control
    { "<leader>dc", function() require("dap").continue() end, desc = "Debug: Start/Continue" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Debug: Terminate" },
    { "<leader>dr", function() require("dap").restart() end, desc = "Debug: Restart" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Debug: Pause" },
    { "<leader>dg", function() require("dap").run_last() end, desc = "Debug: Run Last" },
    -- Stepping
    { "<leader>di", function() require("dap").step_into() end, desc = "Debug: Step Into" },
    { "<leader>do", function() require("dap").step_over() end, desc = "Debug: Step Over" },
    { "<leader>du", function() require("dap").step_out() end, desc = "Debug: Step Out" },
    { "<leader>db", function() require("dap").step_back() end, desc = "Debug: Step Back" },
    -- Breakpoints
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ") end, desc = "Debug: Breakpoint Condition" },
    { "<leader>dx", function() require("dap").clear_breakpoints() end, desc = "Debug: Clear All Breakpoints" },
    -- UI & Inspection
    { "<leader>dui", function() require("dapui").toggle() end, desc = "Debug: Toggle UI" },

  },

  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    require("mason-nvim-dap").setup {
      automatic_installation = true,

      -- NOTE: check that you have the required things installed online
      ensure_installed = {
        "delve",
        "python",
      },
    }

    -- UI setup
    dapui.setup {}

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    -- golang specific
    require("dap-go").setup {
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has "win32" == 0,
      },
    }

    -- python specifics, i.e. detect venv when using uv
    require("dap-python").setup "uv"
  end,
}
