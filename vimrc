syntax on
set nocompatible
"set cursorline
set cursorcolumn
set noswapfile
set nu
set guifont=Consolas:h12:cANSI
set background=dark
set diffexpr=MyDiff()
function MyDiff()
   let opt = '-a --binary '
   if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
   if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
   let arg1 = v:fname_in
   if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
   let arg2 = v:fname_new
   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
   let arg3 = v:fname_out
   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
   if $VIMRUNTIME =~ ' '
     if &sh =~ '\<cmd'
       if empty(&shellxquote)
         let l:shxq_sav = ''
         set shellxquote&
       endif
       let cmd = '"' . $VIMRUNTIME . '\diff"'
     else
       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
     endif
   else
     let cmd = $VIMRUNTIME . '\diff'
   endif
   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
   if exists('l:shxq_sav')
     let &shellxquote=l:shxq_sav
   endif
 endfunction

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
let &termencoding=&encoding
 set foldmethod=marker
set completeopt=preview,menu
set nobackup
"setup vim based on the file type
filetype plugin on
filetype on
set noswapfile
set nobackup
set ruler
"python flod
autocmd FileType python setlocal foldmethod=indent

set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
filetype plugin indent on 
" high line current line
set hlsearch

set incsearch
"set ignorecase
"set wildmenu

set laststatus=2
"set statusline=%F%m%r%h%w\ [POS=%4l,%3v]\ [%p%%]\ [LEN=%L] 
set statusline=%<[%n]\ %F\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}][%{&ff}][ASCII=\%03.3b]\ %-10.(%l,%c%V%)\ %P

set foldmethod=indent
set nofoldenable
map <F12> :NERDTreeToggle<CR>
map <F8> :mksession vim.session<CR> 
map <F5> :vertical res+10<CR>
map <F4> :vertical res-10<CR>
map <F3> <C-w><C-w>
map <F2> :q<CR>
set pastetoggle=<F6>

let NERDTreeShowLineNumbers=1 
let NERDChristmasTree=1 
let NERDTreeAutoCenter=1 
let NERDTreeWinSize=45
set foldlevelstart=99

"Ithogen 自身也置于独立目录中，需指定其路径 
runtime bundle/pathogen/autoload/pathogen.vim
" 运行 pathogen
execute pathogen#infect()

let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v  --fields=+iaSl --extra=+q"



let g:SignatureMarkTextHL = "StatusLine"
"let g:SignatureMarkTextHLDynamic=1
let g:SignatureMarkerLineHL='Underlined'

map <F9> :TagbarToggle<CR>
let tagbar_right=1 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码元素生成标签
let g:tagbar_type_cpp = {
\ 'kinds' : [
        \ 'd:macros:1',
        \ 'g:enums',
        \ 't:typedefs:0:0',
        \ 'e:enumerators:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:global:0:0',
        \ 'x:external:0:0'
     \ ],
\ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }


"jdivim
let g:jedi#show_call_signatures=0


"" YCM 补全菜单配色
"" 菜单
""highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
"" 选中项
""highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
"" 补全功能在注释中同样有效
"let g:ycm_complete_in_comments=1
"" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
"let g:ycm_confirm_extra_conf=0
"" 开启 YCM 标签补全引擎
"let g:ycm_collect_identifiers_from_tags_files=1
"" 引入 C++ 标准库tags
"set tags+=/data/misc/software/misc./vim/stdcpp.tags
"" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
"inoremap <leader>; <C-x><C-o>
"" 补全内容不以分割子窗口形式出现，只显示补全列表
"set completeopt-=preview
"" 从第一个键入字符就开始罗列匹配项
"let g:ycm_min_num_of_chars_for_completion=2
"" 禁止缓存匹配项，每次都重新生成匹配项
"let g:ycm_cache_omnifunc=0
"" 语法关键字补全         
"let g:ycm_seed_identifiers_with_syntax=1
"let g:ycm_python_binary_path = 'python'
"let g:ycm_global_ycm_extra_cong='~/.ycm_confirm_extra_conf'
"let g:ycm_register_as_syntastic_checker = 1 "default 1
"let g:Show_diagnostics_ui = 1 "default 1
"
"
"
"let g:ycm_log_level = 'error' "default info


"let g:ycm_filter_diagnostics = {
"  \ "cpp": {
"  \      "regex": [ "-fopenmp-smid", "-Wa,--compress-debug-sections", "-Wno-literal-suffix" ],
"  \      "level": "warning", 
"  \    }
"
"  \ }

autocmd FileType cuda set ft=c
"****************************************
        "ag settings:
"****************************************
let g:ag_working_path_mode="r"
nmap <F7> :Ag! --noaffinity<space>
""****************************************
"        "airline settings
""****************************************
""let g:airline_theme="hybridline"
""let g:airline_theme="dracula"
"let g:airline_theme="dracula"
"set laststatus=2
"set t_Co=256
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#buffer_nr_show = 1
"" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols_branch = '⎇'
"*****************************************
"            Zoom window
"*****************************************
let mapleader = "\<Space>"
function! Zoom ()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose

        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction

nmap <leader>z :call Zoom()<CR>
