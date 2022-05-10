"---------------------------------------------------------------------------
"環境設定
"set shell=C:\Windows\System32\wsl.exe
"set shell=wsl
"---------------------------------------------------------------------------
" ウインドウに関する設定:
"
" ウインドウの幅
"set columns=80
set columns=84
" ウインドウの高さ
"set lines=25
set lines=30
" コマンドラインの高さ(GUI使用時)
set cmdheight=2
" 半透明化
autocmd GUIEnter * set transparency=215
"autocmd FocusGained * set transparency=230
"autocmd FocusLost * set transparency=128
"---------------------------------------------------------------------------
" カラー設定:
colorscheme monokai
" IME ON時のカーソルの色を設定(設定例:紫)
" カラースキーム設定の後に記述しないと反映されない
highlight CursorIM guifg=NONE guibg=Purple
"autocmd ColorScheme highlight CursorIM guifg=NONE guibg=Purple
" 選択行ハイライト設定
highlight Visual term=reverse ctermbg=235 guibg=#403D3D
"---------------------------------------------------------------------------
" フォント設定:
set guifont=Ricty_Diminished:h12:cSHIFTJIS

