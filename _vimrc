"设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set langmenu=zh_CN.UTF-8
set helplang=cn


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 隐藏GVIM菜单及设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 窗口大小
set lines=35 columns=140
" 分割出来的窗口位于当前窗口下边/右边
set splitbelow
set splitright
"不显示工具/菜单栏
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b
" 使用内置 tab 样式而不是 gui
set guioptions-=e
set nolist

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "," "定义<leader>键
set nocompatible    "设置不兼容原始vi模式
filetype on     "设置开启文件类型侦测
filetype plugin on  "加载对应文件类型插件
set noeb        "关闭错误提示
syntax enable       "开启语法高亮功能
syntax on       "自动语法高亮
set t_Co=256        "开启256色支持
set cmdheight=2     "设置命令行高度
set showcmd     "select模式下显示选中的行数
set ruler       "总是显示光标的位置
set laststatus=2    "总是显示状态栏
set number      "开启行号显示
set cursorline      "高亮显示当前行
set whichwrap+=<,>,h,l  "设置光标键跨行
set virtualedit=block,onemore   "允许光标出现在最后一个字符的后面


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进与排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent      "设置自动缩进
set cindent     "设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0 "设置使用C/C++语言的具体缩进方式
set smartindent     "智能选择对齐方式
filetype indent on  "自适应不同语言的智能缩进
set expandtab       "将制表符扩展为空格
set tabstop=4       "设置编辑时制表符所占的空格数
set shiftwidth=4    "设置格式化时制表符占用的空格数
set softtabstop=4       "设置4个空格为制表符
set smarttab        "在行和段开始处使用制表符
"set nowrap     "禁止折行
set backspace=2     "使用回车键正常处理indent.eol,start等


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu        "vim自身命令行模式智能补全
set completeopt-=preview    "补全时不显示窗口，只显示补全列表

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"代码折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=syntax       "设置基于语法进行代码折叠
set nofoldenable            "关闭代码折叠


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup        "设置不备份
set noswapfile      "禁止生成临时文件
set autoread        "文件在vim之外修改过，自动重新载入
set autowrite       "设置自动保存
set confirm         "在处理未保存或只读文件时，弹出确认


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 优化设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"映射 esc 键为 jj
inoremap jj <Esc>
"快速打开vim配置文件：_vimrc
nnoremap <leader>e :e ~/_vimrc<cr>
"刷新配置
nnoremap <leader>r :source $MYVIMRC<cr>
" 插入模式、正常模式按 Ctrl+u 快速转换为大写
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwUe
"Ctrl+d 复制本行并粘贴到一下行
nnoremap <c-d> yyp

" <leader>+q 快速退出vim
nnoremap <leader>q :q<cr>
inoremap <leader>q <Esc>:q<cr>

"插入模式快速到另一个字符右边，对于配对的符号（如括号）很有用
imap <c-a> <Esc>la
"插入模式移动到下一行
imap <c-d> <Esc>o
"移动到末尾
imap <c-e> <Esc>A

" 添加空格键为代码折叠
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"若打开分割窗口，可快速切换窗口
"快捷键提示：Ctrl+w w 切换窗口; Ctrl+w s 水平分割; Ctrl+w v 竖直分割
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"buffer change
nnoremap <c-n> :bn<cr>
nnoremap <c-p> :bp<cr>
nnoremap <leader>d :bd<cr>

" vim-plug
" ******************************BEGIN******************************
" Specify a directory for plugins
" - For Neovim: stdpath("data") . "/plugged"
" - Avoid using standard Vim directory names like "plugin"
call plug#begin("~/.vim/plugged")

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug "junegunn/vim-easy-align"

" Any valid git URL is allowed
Plug "https://github.com/junegunn/vim-github-dashboard.git"

" Multiple Plug commands can be written in a single line using | separators
Plug "SirVer/ultisnips" | Plug "honza/vim-snippets"

" On-demand loading
Plug "scrooloose/nerdtree"
Plug "tpope/vim-fireplace"

" Using a non-master branch
Plug "rdnetto/YCM-Generator"

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug "fatih/vim-go"

" Plugin options
Plug "nsf/gocode"

" Plugin outside ~/.vim/plugged with post-update hook
Plug "junegunn/fzf"

" Unmanaged plugin (manually installed and updated)
Plug "~/my-prototype-plugin"

"vimproc
Plug "Shougo/vimproc.vim"

"YouCompleteMe

Plug "ycm-core/YouCompleteMe"
"colors
Plug "altercation/vim-colors-solarized"


"中文vim入门，不需要可注释掉
Plug 'yianwillis/vimcdoc'
"vim-colorschemes
Plug 'flazz/vim-colorschemes'
"change scheme
Plug 'chxuan/change-colorscheme'

"incsearch
Plug 'haya14busa/incsearch.vim'
"强化f/t
Plug 'rhysd/clever-f.vim'

"vim-airline
Plug 'vim-airline/vim-airline'
"vim-airline themes
Plug 'vim-airline/vim-airline-themes'

" nerdtree
Plug 'scrooloose/nerdtree',{'on':'NERDTreeToggle'}
"nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

"vim-easymotion
Plug 'easymotion/vim-easymotion'

"vim auto pair
Plug 'jiangmiao/auto-pairs'

"vim-smooth_scroll
Plug 'terryma/vim-smooth-scroll'

"vim-surround
Plug 'tpope/vim-surround'

"vim-commentary
Plug 'tpope/vim-commentary'

" multiple-cursors
Plug 'terryma/vim-multiple-cursors'

"vim expand region
Plug 'terryma/vim-expand-region'

"tarbar
Plug 'majutsushi/tagbar'

"vim-endwise
Plug 'tpope/vim-endwise'

"vim start page
Plug 'mhinz/vim-startify'

"fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf'}

"根据缩进折叠代码
Plug 'tmhedberg/SimpylFold'

"文本搜索rg
Plug 'mileszs/ack.vim'

"彩虹括号增强
Plug 'luochen1990/rainbow'

"对齐插件
Plug 'godlygeek/tabular'

"语法检查
Plug 'vim-syntastic/syntastic'

"复制增强
Plug 'machakann/vim-highlightedyank'

"快速打开大文件
Plug 'vim-scripts/LargeFile'


" Initialize plugin system
call plug#end()
" ******************************END******************************

" VimPlug快捷键：安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>


"vim-colorschemes
"默认主题
"colorscheme 3dglasses
colorscheme solarized

"change-colorscheme
nnoremap <silent> <F9> :PreviousColorScheme<cr>
inoremap <silent> <F9> <esc> :PreviousColorScheme<cr>
nnoremap <silent> <F10> :NextColorScheme<cr>
inoremap <silent> <F10> <esc> :NextColorScheme<cr>
nnoremap <silent> <F11> :RandomColorScheme<cr>
inoremap <silent> <F11> <esc> :RandomColorScheme<cr>
nnoremap <silent> <F12> :ShowColorScheme<cr>
inoremap <silent> <F12> <esc> :ShowColorScheme<cr>


"incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
"使用<Esc><Esc>暂时关闭高亮功能
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
"使用Ctrl+k统计匹配个数
nnoremap <silent> <C-c> :%s///gn<CR>


"f/t增强
let g:clever_f_ignore_case=1
let g:clever_f_smart_case=1
map ; <Plug>(clever-f-repeat-forward)
map ' <Plug>(clever-f-repeat-back)


"vim-airline
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '   
" let g:airline#extensions#tabline#left_alt_sep = '|' "tabline中未激活buffer两端的分隔字符      
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.linenr = 'Îõ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = 'Îõ'
let g:airline_section_b='%{strftime("%c")}'   "使用时显示当前时间
" let g:airline_section_y='BN:%{bufnr("%")}'  "右下角显示bffer序号
" let g:airline_mode_map = {
  " \ '__' : '-',
  " \ 'c'  : 'C',
  " \ 'i'  : 'I',
  " \ 'ic' : 'I',
  " \ 'ix' : 'I',
  " \ 'n'  : 'N',
  " \ 'ni' : 'N',
  " \ 'no' : 'N',
  " \ 'R'  : 'R',
  " \ 'Rv' : 'R',
  " \ 's'  : 'S',
  " \ 'S'  : 'S',
  " \ '' : 'S',
  " \ 't'  : 'T',
  " \ 'v'  : 'V',
  " \ 'V'  : 'V',
  " \ '' : 'V',
  " \ }

"nerdtree
"close vim if only nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"open nerdtree automatically when vim starts with a dictory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"快捷键
map <leader>n :NERDTreeToggle<cr>
let g:NERDTreeDirArrowExpandable = 'Îõ'
let g:NERDTreeDirArrowCollapsible = 'Îõ'

"nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "Îõ",
            \ "Staged"    : "Îõ",
            \ "Untracked" : "Îõ",
            \ "Renamed"   : "Îõ",
            \ "Unmerged"  : "",
            \ "Deleted"   : "Îõ",
            \ "Dirty"     : "Îõ",
            \ "Clean"     : "ÎõÎõ",
            \ 'Ignored'   : 'Îõ',
            \ "Unknown"   : "?"
            \ }

"vim-easymotion
let g:EasyMotion_smartcase=1
map <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)
map <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)
nmap <leader>s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>j <Plug>(easymotion-bd-jk)
nmap <Leader>j <Plug>(easymotion-overwin-line)

" vim-smooth-scroll
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Multip Cursor
" Default key mapping
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-y>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"expand region expand
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)
let g:expand_region_text_objects = {
            \ 'iw'  :0,
            \ 'iW'  :0,
            \ 'i"'  :0,
            \ 'i''' :0,
            \ 'i]'  :1,
            \ 'ib'  :1,
            \ 'iB'  :1,
            \ 'il'  :0,
            \ 'ip'  :1,
            \ 'ie'  :0,
            \ }"

"tarbar
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
nnoremap <silent> <leader>t :TagbarToggle<cr>
inoremap <silent> <leader>t <esc> :TagbarToggle<cr>

"fzf settings
nnoremap <Tab> :FZF <cr>
function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val  }'))
    copen
    cc
endfunction
let g:fzf_action = {
            \ 'ctrl-q': function('s:build_quickfix_list'),
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }
"Default fzf layout
let g:fzf_layout = { 'down': '~40%'  }
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }
"代码折叠
set foldmethod=indent
let g:SimpylFold_docstring_preview=1

"Ack和rg
let g:ackprg = 'rg '
nnoremap <C-s> :Ack<space>

"彩虹括号增强
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" tabular
nnoremap <leader>l :Tab /\|<cr>
nnoremap <leader>= :Tab /=<cr>

" 复制增强
let g:highlightedyank_highlight_duration = 1000
let g:highlightedyank_highlight_duration = -1


"设置字体 fonts
set guifont=Source_Code_Pro_for_Powerline:h12:cANSI



"启用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key  
"显示括号匹配
set showmatch
"设置缩进
"设置Tab长度为4空格
set tabstop=4
"设置自动缩进长度为4空格
set shiftwidth=4
"继承前一行的缩进方式，适用于多行注释
set autoindent
"设置粘贴模式
set paste
"显示空格和tab键
set listchars=tab:>-,trail:-
"显示状态栏和光标当前位置
"总是显示状态栏
set laststatus=2
"显示光标当前位置
set ruler
"打开文件类型检测
filetype plugin indent on
"Vim配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"设置颜色
syntax enable
set  background=dark
 
colorscheme solarized


