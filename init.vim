set number
set relativenumber
set nohls
set preserveindent
set softtabstop=0
set shiftwidth=0
set tabstop=4
set noexpandtab
set termguicolors
set mouse=a
set list
set listchars=tab:>>:
filetype indent on 
call plug#begin()
    Plug 'https://github.com/morhetz/gruvbox'
	Plug 'https://github.com/neovim/nvim-lspconfig'
	Plug 'williamboman/nvim-lsp-installer'
    Plug 'https://github.com/nvim-treesitter/nvim-treesitter'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'hrsh7th/cmp-nvim-lsp'
    " this is for auto completion
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    
    " For vsnip users.
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/tagbar'
    Plug 'sbdchd/neoformat'
    Plug 'tpope/vim-fugitive'
    Plug 'folke/trouble.nvim'
    Plug 'sainnhe/gruvbox-material'
	Plug 'puremourning/vimspector'
	Plug 'folke/lsp-colors.nvim'
    
    " For luasnip users.
    " Plug 'L3MON4D3/LuaSnip'
    " Plug 'saadparwaiz1/cmp_luasnip'
    
    " For ultisnips users.
    " Plug 'SirVer/ultisnips'
    " Plug 'quangnguyen30192/cmp-nvim-ultisnips'
    
    " For snippy users.
    " Plug 'dcampos/nvim-snippy'
    " Plug 'dcampos/cmp-snippy'
call plug#end()
let mapleader=" "
"set completeopt=menu,noselect,menuone

source ~/.config/nvim/lua/lsp/nvim-lsp-init.lua
source ~/.config/nvim/lua/nvim-lspinstaller.lua
source ~/.config/nvim/lua/nvimtree.lua
source ~/.config/nvim/lua/treesitter.lua
source ~/.config/nvim/lua/telescope.vim
source ~/.config/nvim/lua/complete.lua
source ~/.config/nvim/lua/map_tagbar.vim

colorscheme gruvbox


" this is for the status line
let g:airline_theme='base16_ocean'
let g:airline#extensions#tabline#formatter = 'unique_tail' " file-name.js

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.colnr = ' ㏇:'
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = ' ␊:'
let g:airline_symbols.linenr = ' ␤:'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'



" this is for prettier 
let g:neoformat_cpp_astyle8={
        \ 'exe':'astyle',
        \ 'args':['-A1', '-t', '-xn', '-xc', '-C', '-xG' ,'-S' ,'-K' ,'-N' ,'-Y' ,'-xg','-p','-k3','-W3','-xe','-xj','-M80'],
        \ 'replace':1,
        \ }
let g:neoformat_enabled_cpp=['astyle8']
let g:neoformat_try_formatprg=1
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat 
augroup END
"let g:neoformat_verbose=1


" This is for nvim tree 
" vimrc
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 1 "0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set renderer.indent_markers.enable (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': "",
    \ 'symlink': "",
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

                    

" this is for background change
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guifg=lightskyblue 
hi comment guifg=#c6a6df
"hi LineNr guibg=Black
"hi LineNr guifg=LightYellow
"nnoremap <C-t> <cmd>hi Normal guibg=NONE ctermbg=NONE<CR>
"nnoremap <C-B> <cmd> hi Normal guibg=#2c1700 <CR>

"hi Normal guibg=black ctermbg=blue

" This is viminspector
let g:vimspector_enable_mappings='HUMAN'
let g:vimspector_variables_display_mode = 'full'

nnoremap <leader>dp <Plug>VimspectorBalloonEval
nnoremap <leader>dl <Plug>VimspectorStepInto
nnoremap <leader>de <CMD>VimspectorReset<CR>
nnoremap <leader>df <Plug>VimspectorStepOut
nnoremap gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap K  <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <C-k>      <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <leader>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <leader>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <leader>D  <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>f  <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <TAB>n <cmd> bnext<CR>
nnoremap <TAB>p <cmd> bprev<CR>
nnoremap <TAB>d <cmd> bdelete<CR>

