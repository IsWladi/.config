return{
  {"rust-lang/rust.vim",
  ft = {"rust"},
  config = function ()
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.rs",
        callback = function()
          vim.cmd("RustFmt")
        end,
      })
  end
  }
}
