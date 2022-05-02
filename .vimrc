" ================================================================================
" .vimrc
" ================================================================================
"
" 文字コードを UFT-8 に設定する
set enc=utf-8
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるようにする
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
"
" ------------------------------------------------------------
"
" 画面表示の設定:
"
syntax on
set t_Co=256
set cursorline
set cursorcolumn
"hi CursorLine   term=reverse cterm=none ctermbg=242
"hi CursorLine   term=reverse cterm=none ctermbg=236
"hi CursorLine   term=reverse cterm=none ctermbg=5
"hi CursorLine   term=reverse cterm=none ctermbg=253
colorscheme molokai
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を非表示 (list:表示)
set list
" 不可視文字を可視化 (タブが「▸-」と表示される)
"set list listchars=tab:\▸\-
" どの文字でタブや改行を表示するかを設定
set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" 行末の1文字先までカーソルを移動できるようにする
set virtualedit=onemore
" スマートインデントにする
set smartindent
"set visualbell
" コマンドライン補完を有効にする
set wildmode=list:longest
" 折り返し時に表示行単位での移動をできるようにする
"nnoremap j gj
"nnoremap k gk
" Tab 文字を半角スペースにする
set expandtab
" タブをスペースに展開しない (expandtab:展開する)
"set noexpandtab
" 行頭以外の Tab 文字の表示幅 (スペースの数)
""set tabstop=2
set tabstop=4
" 行頭での Tab 文字の表示幅
"set shiftwidth=2
set shiftwidth=4
" ターミナルの設定に合わせて半透明を維持する
if !has('gui_running')
  augroup seiya
    autocmd!
    autocmd VimEnter,ColorScheme * highlight Normal ctermbg=none
    autocmd VimEnter,ColorScheme * highlight LineNr ctermbg=none
    autocmd VimEnter,ColorScheme * highlight SignColumn ctermbg=none
    autocmd VimEnter,ColorScheme * highlight VertSplit ctermbg=none
    autocmd VimEnter,ColorScheme * highlight NonText ctermbg=none
  augroup END
endif
hi CursorLine   term=reverse cterm=none ctermbg=236
" ------------------------------------------------------------
"
" 編集に関する設定:
"
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" クリップボード連携を有効にする (MacOS の場合は unnamedplus ではなく unnamed で有効にできた・vi ではなく vim を使うこと)
"set clipboard&
"set clipboard^=unnamed
" クリップボード連携を有効にした時に BackSpace (Delete) が効かなくなるので設定する
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" 括弧の補完
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<ESC>i
inoremap [<Enter> []<Left><CR><ESC><S-o>
" ------------------------------------------------------------
"
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
set incsearch
set hlsearch
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set nowrapscan
hi Search term=reverse ctermfg=230 ctermbg=3 guifg=Black
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" マッチした数を表示
set shortmess-=S
" ------------------------------------------------------------
if &term =~ "xterm"

  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")

endif

"
" プラグイン管理
"

if has('vim_starting')
   " 初回起動時のみruntimepathにneobundleのパスを指定する
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするプラグインをここに記述
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'scrooloose/nerdtree'


call neobundle#end()

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'
"phpの辞書ファイルを作って指定する
NeoBundleCheck
