let mapleader = " "

" Reload init file
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" Surround with quotation marks
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" Auto indent all file
nnoremap <leader>i gg=G<C-o>

" Capitalize or lower case current word
nnoremap <leader-u>u <esc>viw~ea

" Make Y as it should be!
nnoremap Y y$ 
" X as a i<backspace>
nnoremap X "_d

" Alternate way to save
nnoremap <leader>s :w<CR><ESC>
" Alternate way to quit and save
nnoremap <leader>q :q!<CR>

" TAB in general mode will move to next buffer
nnoremap <C-H> :bnext<CR>
" SHIFT-TAB will go to prev buffer
nnoremap <C-L> :bprev<CR>
" Close current buffer
nnoremap <leader>r :bd<CR>

" Better tabbing
vnoremap <C-<> <gv
vnoremap <C->> >gv
" Auto indent all file
nnoremap <leader>i gg=G<C-o>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
vnoremap K :move '<-2<CR>gv-gv
vnoremap J :move '>+1<CR>gv-gv

set clipboard+=unnamedplus
" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Copy all file on clipboard
" nnoremap <leader>ya gg"+yG<C-o>

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Remap convenient change between windows commands
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Capitalize or lower case current word
nnoremap <C-u> <esc>viw~ea

" Operator pending mappings
" Same as Xi(  shorted to Xp
onoremap p i(
onoremap a $
onoremap l i{
onoremap b /return<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
