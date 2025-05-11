return {
  {"nat-418/boole.nvim",
    keys = {"<C-a>", "<C-x>"},
    config = function ()
      require('boole').setup({
        mappings = {
          increment = '<C-a>',
          decrement = '<C-x>'
        },
        allow_caps_additions = {
          {'enable', 'disable'},
          {'lunes', 'martes', 'miércoles', 'jueves', 'viernes', 'sábado', 'domingo'},
          {'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'},
        }
      })
    end
  }
}
