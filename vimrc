" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" Start Plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tek256/simple-dark'
" Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'simrat39/symbols-outline.nvim'
" Plug 'scrooloose/nerdtree'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'bronson/vim-trailing-whitespace'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'jlanzarotta/bufexplorer'
Plug 'bling/vim-bufferline'
Plug 'sheerun/vim-polyglot'
Plug 'szw/vim-maximizer'
Plug 'mileszs/ack.vim'
Plug 'jnurmine/Zenburn'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'arzg/vim-colors-xcode'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
Plug 'honza/vim-snippets'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
"Plug 'puremourning/vimspector'
"Plug 'github/copilot.vim'
call plug#end()
" End Plugins

" Theme Start
" colorscheme zenburn
"colorscheme tokyonight
colorscheme xcodelight
augroup vim-colors-xcode
    autocmd!
augroup END

autocmd vim-colors-xcode ColorScheme * hi Comment        cterm=italic gui=italic
autocmd vim-colors-xcode ColorScheme * hi SpecialComment cterm=italic gui=italic

" colorscheme simple-dark
set laststatus=2 "grey status bar on bottom
set t_Co=256 " 256 Color Term
set cc=80  " Show the line at 80ch
"" Theme End

"" Config Stuff Start
set nocompatible " be iMproved
syn on "turn on syntax highlighting
filetype indent on "smart indents based on filetypes
set ai "auto indents
set nu "show line numbers
set ic "case insensitive searches
set autoread " automatically reload file on changes
set smartcase "smart case searches, defaults to ic, if has caps, use it
set incsearch "incremental search
set tabstop=4 "tabs set to 4 spaces
set shiftwidth=4 "indents also 4 spaces
set shiftround "indent rount to next shiftwidth
set noexpandtab "dont change all new tabs to spaces
set backspace=indent,eol,start "smart-er backspaces
set ww=b,s,h,l,<,>,[,] "set (b)ackspace, (s)pace, and arrows to jump lines
set wildmenu " visual autocomplete for command menu
set tags=./tags;/
filetype plugin on
" w!! to save as root
cmap w!! w !sudo tee % >/dev/null
" caps are hard
:command WQ wq
:command Wq wq
:command W w
:command Q q
"" Config Stuff End

" Rainbow Parens
autocmd VimEnter * RainbowParentheses
" Rainbow Parens

"" Tagbar Start
" let g:tagbar_usearrows = 1
nnoremap <leader>l :SymbolsOutline<CR>
nnoremap <leader>t :NvimTreeToggle<CR>
" Tagbar end


" Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" Easymotion

" CtrlP
"if executable('ag')
	"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif
nnoremap <C-p> :Files<Cr>
nnoremap <leader>. :Vista finder<cr>
" CtrlP

" Ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" Ack.vim

" maximizer
nnoremap <silent><C-w>z :MaximizerToggle<CR>
vnoremap <silent><C-w>z :MaximizerToggle<CR>gv
inoremap <silent><C-w>z <C-o>:MaximizerToggle<CR>

" clang-format
map <C-K> :pyf /usr/local/Cellar/llvm/10.0.0_3/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/local/Cellar/llvm/10.0.0_3/share/clang/clang-format.py<cr>

" coc
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
set directory=.,$TEMP

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> Gd <Plug>(coc-definition)
nmap <silent> Gy <Plug>(coc-type-definition)
nmap <silent> Gi <Plug>(coc-implementation)
nmap <silent> Gr <Plug>(coc-references)

" Use L to show documentation in preview window
nnoremap <silent> L :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"

nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" persistant undo
set undodir=~/.vim/undodir

lua << EOF
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}

vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = true,
    position = 'right',
    relative_width = true,
    width = 25,
    auto_close = false,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    preview_bg_highlight = 'Pmenu',
    keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
    symbols = {
        File = {icon = "", hl = "TSURI"},
        Module = {icon = "", hl = "TSNamespace"},
        Namespace = {icon = "", hl = "TSNamespace"},
        Package = {icon = "", hl = "TSNamespace"},
        Class = {icon = "𝓒", hl = "TSType"},
        Method = {icon = "ƒ", hl = "TSMethod"},
        Property = {icon = "", hl = "TSMethod"},
        Field = {icon = "", hl = "TSField"},
        Constructor = {icon = "", hl = "TSConstructor"},
        Enum = {icon = "ℰ", hl = "TSType"},
        Interface = {icon = "ﰮ", hl = "TSType"},
        Function = {icon = "", hl = "TSFunction"},
        Variable = {icon = "", hl = "TSConstant"},
        Constant = {icon = "", hl = "TSConstant"},
        String = {icon = "𝓐", hl = "TSString"},
        Number = {icon = "#", hl = "TSNumber"},
        Boolean = {icon = "⊨", hl = "TSBoolean"},
        Array = {icon = "", hl = "TSConstant"},
        Object = {icon = "⦿", hl = "TSType"},
        Key = {icon = "🔐", hl = "TSType"},
        Null = {icon = "NULL", hl = "TSType"},
        EnumMember = {icon = "", hl = "TSField"},
        Struct = {icon = "𝓢", hl = "TSType"},
        Event = {icon = "🗲", hl = "TSType"},
        Operator = {icon = "+", hl = "TSOperator"},
        TypeParameter = {icon = "𝙏", hl = "TSParameter"}
    }
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  --ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

EOF

" what?
