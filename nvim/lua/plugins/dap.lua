return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "anuvyklack/hydra.nvim",
    "mfussenegger/nvim-dap-python",
    "nvim-neotest/nvim-nio",
  },
  -- keys = { { "<leader>d"}},

  config = function()
    require "wladi.dap"
    dap, dapui = require "dap", require "dapui"

    vim.keymap.set('n', '<F1>', dapui.toggle, { desc = 'Debug: See last session result.' })

    -- dap python config
    require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

    -- dap java config

    dap.configurations.java = {
      {
        name = "Debug Attach MedMath (5005)";
        type = 'java';
        request = 'attach';
        hostName = "127.0.0.1";
        port = 5005;
        mainClass = 'com.iswladi.apimedmath.apimedmath.ApimedmathApplication';
      },
      {
        name = "Debug Launch (2GB)";
        type = 'java';
        request = 'launch';
        vmArgs = "" ..
          "-Xmx2g "
      },
      {
        name = "Debug Attach (8000)";
        type = 'java';
        request = 'attach';
        hostName = "127.0.0.1";
        port = 8000;
      },
      {
        name = "My Custom Java Run Configuration",
        type = "java",
        request = "launch",
        -- You need to extend the classPath to list your dependencies.
        -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
        -- classPaths = {},

        -- If using multi-module projects, remove otherwise.
        -- projectName = "yourProjectName",

        -- javaExec = "java",
        mainClass = "replace.with.your.fully.qualified.MainClass",

        -- If using the JDK9+ module system, this needs to be extended
        -- `nvim-jdtls` would automatically populate this property
        -- modulePaths = {},
        vmArgs = "" ..
          "-Xmx2g "
      },
    }
  end,
}
