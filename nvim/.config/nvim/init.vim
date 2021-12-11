source ~/.config/nvim/plugins.vim
source ~/.config/nvim/colors.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/nerdtree.vim


:lua vim.o.completeopt = "menuone,noselect,preview"
:lua require('config/telescope')
:lua require('config/tree-sitter')
:lua require('config/nvim-cmp')

