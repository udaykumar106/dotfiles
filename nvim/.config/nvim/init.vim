source ~/.config/nvim/plugins.vim
source ~/.config/nvim/colors.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/nerdtree.vim


:lua vim.o.completeopt = "menuone,noselect"
:lua require('config/telescope')
:lua require('config/golsp')
:lua require('config/tree-sitter')
:lua require('config/nvim-cmp')


augroup jdtls_lsp
    autocmd!
    autocmd FileType java lua require'config/java'.setup()
augroup end

