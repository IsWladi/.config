return{
  {dir = "~/workspace/Gittory/", -- for development purposes use local path instead of github
    dependencies = {
        {"j-hui/fidget.nvim"},
        {"nvim-telescope/telescope.nvim"}
      },
    opts = {
          atStartUp = true,

          notifySettings = {
            enabled = true,
            availableNotifyPlugins =  {"fidget"}
          },
          workspace_analizer = {
            enabled = true,
          }
    },
  }
  }

