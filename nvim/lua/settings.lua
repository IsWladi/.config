local opt = vim.o

--Configuración general

-- opt.statuscolumn = "%@SignCb@%s%=%T%@NumCb@%l %r│%T "
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.ignorecase = true
opt.smartcase = true
opt.breakindent = true
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.autoindent = true
opt.encoding = "utf-8"
opt.clipboard = "unnamedplus"
opt.swapfile = false
opt.termguicolors = true
opt.hlsearch = true --resaltado de busqueda con /palabra
opt.incsearch = true --resaltado de busqueda mientras se escribe con h1search false
opt.colorcolumn = "120" --columna de marco para no exceder largo de linea
opt.undofile = true
local home = os.getenv("HOME") or os.getenv("USERPROFILE")
opt.undodir = home .. "/.vim/undodir"
vim.opt.laststatus = 3 -- recomendacion plugin Avante.nvim

--auto comandos
vim.cmd("autocmd BufReadPost * lua require('wrap').set_wrap()") -- auto wrap

-- auto delete whitespaces at the end of line, end of file, beginning of file and preserv cursor
function delete_blank_lines()
	local first_line = vim.fn.getline(1)
	if first_line == "" then
		vim.cmd([[1;/\S/-d]])
	end
end

vim.cmd([[
  function! PreserveCursor()
    let l:save = winsaveview()
    %s/\v\s+$//e
    %s/\(\n\n\)\+\%$//e
    lua delete_blank_lines()
    call winrestview(l:save)
  endfunction

  autocmd BufWritePre * silent! call PreserveCursor()
]])

-- Restaurar la posición del cursor y centrar pantalla
vim.cmd('autocmd BufReadPost * silent! normal! g`"zvzz')
