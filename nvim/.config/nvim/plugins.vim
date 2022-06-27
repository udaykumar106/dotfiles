call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'simrat39/symbols-outline.nvim'
Plug 'ray-x/lsp_signature.nvim'

Plug 'hrsh7th/cmp-nvim-lsp', { 'branch': 'main' }
Plug 'hrsh7th/cmp-buffer', { 'branch': 'main' }
Plug 'hrsh7th/nvim-cmp', { 'branch': 'main' }
Plug 'hrsh7th/cmp-path', { 'branch': 'main' }

Plug 'hrsh7th/cmp-vsnip', { 'branch': 'main' }
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'mfussenegger/nvim-jdtls'
Plug 'vim-test/vim-test'

Plug 'golang/vscode-go'

Plug 'dbeniamine/cheat.sh-vim'

call plug#end()


