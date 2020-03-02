""" 레퍼런스
" http://vim-ko.github.io/doc/quickref.html
" http://wujek2.ia.pw.edu.pl/wujek/wa/prog/vim/options.html
" http://vimdoc.sourceforge.net/

" vundle
set nocompatible " nocp; 오리지널 Vi 와의 호환성을 없애고, Vim 만의 기능들을 쓸 수 있게 함. vundle 쓰려면 필수
filetype plugin on " required
"filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=/home/onesider/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic' "여기 참고 https://github.com/vim-syntastic/syntastic
Plugin 'klen/python-mode'
"Plugin 'davidhalter/jedi-vim' "신텍스 자동완성으로는 좋은듯 함.
Plugin 'ervandew/supertab' "변수명 자동 완성
Plugin 'jiangmiao/auto-pairs'
Plugin 'Yggdroot/indentLine' "display the indention levels with thin vertical lines
Plugin 'kshenoy/vim-signature' "Plugin to toggle, display and navigate marks
Plugin 'tpope/vim-fugitive' "git plugin
Plugin 'tpope/vim-surround' "문자열 수정 https://github.com/tpope/vim-surround
"Plugin 'taglist-plus'
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'SrcExpl'
Plugin 'cscope.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"

""" vim
set history=999   " hi; 명령어 히스토리 수
set noswapfile " noswf; swap 파일을 만들지 않음
set nobackup " nobk; 백업파일을 만들지 않음. 백업파일은 편집하는 파일 앞에 ~로 시작하는 파일
"set backupdir=~/tmp " 백업 파일을 만들 경우, 백업 파일의 경로를 지정. 미리 tmp 폴더를 만들어 두어야 함.
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.DS_Store,*.db " wig; 자동 완성시키지 않을 파일들 패턴
set wildignorecase " wic; 파일명 자동 완성 시 대소문자를 무시
"set lazyredraw "lz; 매크로 실행중에 화면을 다시 그리지 않음
set showcmd "sc; 상태 표시줄에 (입력중인) 명령을 표시. 근데 무슨 차이인지 모르겠음.
set laststatus=2 " ls; 상태 표시줄을 항상 보이도록
set wildmenu
set wildmode:list:longest,full " wmnu; 명령줄 자동 완성 시 메뉴를 사용
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set termencoding=utf-8 " tenc; 터미널의 문자 인코딩
set clipboard=unnamed " use OS clipboard"
"set lines=100 "화면에 표시되는 줄 수
set magic " magic 기능 사용

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END

""" font
set guifont=Monaco:h13 " gfn
set guifont=BitstreamVeraSansMono\ Nerd:h12


" ffs; 자동으로 인식할 'fileformat' 값
set ffs=unix,mac,dos

""" key mapping
" xmllint

" leader 키 설정(기본키는 \)
let mapleader=','
" scroll
map <C-j> <C-e> " 위로 스크롤
map <C-k> <C-y> " 아래로 스크롤
" 영역이 지정된 상태에서 Tab 과 Shift-Tab 으로 들여쓰기/내어쓰기를 할 수 있도록 함.
vmap <Tab> >gv
vmap <S-Tab> <gv

nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
nmap <F4> :SrcExplToggle<CR>
"파일 타입별로 실행해줌..이거 괜찮은듯..
au FileType python map <F5> : !python3 %
au FileType c map <F5>: !gcc -o %< %

" 더블 탭으로 분할된 창끼리 쉽게 이동
"nmap <TAB><TAB> <C-w><C-w>

""" ime
"set noimd "no imdisable 이라는 의미로 한글입력기 등을 사용하게 하는 설정이라고 하는데, 이거 설정하면 한글 입력시 개판됨
set iminsert=1 " imi; 편집(insert)모드를 빠져나갈 때 (즉 ESC를 눌렀을 때) IME(한글입력기)를 off상태로 만든다.
set imsearch=-1 " ims; 찾기 패턴을 입력할 때 :lmap 이나 IM을 사용. 근데 뭔 말인지 모르겠다.

""" encoding
set encoding=utf-8 "  enc; 'encoding' 옵션은 Vim에게 당신이 사용할 문자의 인코딩을 알려줍니다.
set fileencoding=utf-8
set fileencodings=utf-8,cp949,ucs-bom "파일을 읽어 들일때 앞에 것부터 차례로 시도 합니다.
" 관련글: https://kldp.org/node/32987

""" theme
set background=dark " bg; 배경색을 어두운 걸로
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" gui
"set lines=999 columns=999 " 윈도우가 항상 최대 크기로 나오도록.

if has("win32")
    " 인코딩을 UTF-8로 한 경우, 메뉴가 깨지는 문제 방지
    let $LANG = 'ko_KR.UTF-8'
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif

if has("gui_macvim")
        set guifont=Monaco:h13
        set guifont=Bitstream\ Vera\ Sans\ Mono\ Nerd\ Font\ Complete\ Mono:h13
        set transparency=5 "불투명도
        set antialias " anti; 맥 OS X에서 부드럽고 에일리어싱 제거된 글꼴을 사용
endif

" gVim 을 사용중일 경우 클립보드를 unnamed 레지스터로 매핑
if has("gui_running") || has("xterm_clipboard")
    set cb=unnamed
endif

""" editor
syntax on " 자동 문법 강조
set t_Co=256
set numberwidth=2 " nuw; 줄 번호 표시에 사용할 최소한의 열의 수.
set number " nu; 줄번호
set showmatch " sm; 괄호 입력 시 짝이 되는 괄호로 잠시 갔다가 돌아옴.
set visualbell " vb; 오류음 대신 비주얼벨 사용. 무슨 차이인지 모르겠음
set ruler " ru; 상태표시줄 오른쪽에 커서의 위치를 보여줌.
set backspace=2 " bs; indent,eol,start. Backspace 키 동작 방식
set hlsearch " hls; 검색어 하이라이팅
set linespace=1 " lsp; 줄간격
set ignorecase " ic; 찾기할 때 대소문자 구분하지 않음
set tabstop=4 " ts; <TAB> 간격
set shiftwidth=4 " sw; 자동 들여쓰기 간격
set softtabstop=4 " sts; 편집 시 <Tab>을 누르면 들어가는 공백의 수
set autoindent " 새로운 줄의 들여쓰기를 이전 줄에서 가져옴
set cindent " C 언어 스타일 자동 들여쓰기
set smartindent "cindent 와 비슷 하지만 #if, #ifdef, #define 등과 #으로 시작하는 전처리기 명령어에 대해서는 자동 들여쓰 기를 무시하고 다음 라인의 첫번째 열로 이동한다.
set scrolloff=5 "so; 커서 위나 밑에 표시할 최소 줄 수. 정확히 뭔지 모르겠음.
"set paste " 외부 텍스트를 붙여넣기 할 때 자동 들여쓰기 막기 이거 활성화되면 자동완성기능 못씀
"set textwidth=120 " tw; 한 줄에 입력할 수 있는 글자 수. 띄어쓰기가 없으면 초과되도 계속 한 줄로 입력됨.
set wrap "긴 줄을 다음 줄로 넘겨가며 모두 표시
set cursorline " cul; 현재 커서가 있는 줄을 강조
"set cursorcolumn " cuc; 현재 커서가 있는 열을 강조
"set list lcs=tab:\┆\ ,trail:~ " <TAB> 부분을 ┆ (공백)으로 표시하고 줄끝 공백을 ~로 표시. 이 옵션은 vim-indent-guides로 대체.
set expandtab " et; <Tab>이 입력되면 스페이스 공백들을 삽입
set wrapscan " 찾기에서 파일의 맨 끝에 이르면 문서 처음으로 이동해서 계속 찾음
set incsearch " 찾기 패턴을 입력하는 중에도 일치하는 곳을 강조


"https://github.com/python-mode/python-mode/blob/develop/doc/pymode.txt
"Python-mode
"Activate rope
"Keys:
"K             Show python docs
"<Ctrl-Space>  Rope autocomplete
"<Ctrl-c>g     Rope goto definition
"<Ctrl-c>d     Rope show documentation
"<Ctrl-c>f     Rope find occurrences
"<Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
"[[            Jump on previous class or function (normal, visual, operator modes)
"]]            Jump on next class or function (normal, visual, operator modes)
"[M            Jump on previous class or method (normal, visual, operator modes)
"]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1
"let g:pymode_rope_completion = 0
"let g:pymode_rope_complete_on_dot = 0
let g:pymode_folding = 0
"let g:pymode_rope_guess_project = 0

let g:pymode_python = 'python3'
let g:pymode_run = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_unmodified = 1
let g:pymode_lint_mccabe_complexity = 8
let g:pymode_lint_checker = 'pyflakes,pep8'
let g:pymode_lint_cwindow = 1
let g:pymode_lint_message = 1

" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_options_max_line_length = 0
let g:pymode_indent = 1
"파이썬 에러를 무시하고싶을때 에러코드를 아래와같이 삽입해주면 됨..
let g:pymode_lint_ignore = "E265,E501,W"
" Don't autofold code
let g:pymode_folding = 0

" airline 버퍼 목록 켜기
let g:airline#extensions#tabline#enabled = 1
" airline  파일명만 출력
let g:airline#extensions#tabline#fnamemod = ':t'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_javascript_checkers = ['eslint'] " eslint가 설치되어 있어야 함. npm install eslint
let g:syntastic_check_on_open = 1 " 파일 열 때 체크
let g:syntastic_enable_signs = 1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"] " ng-로 시작하는 속성은 무시
let g:syntastic_python_checkers = ['pylint'] " pylint가 설치되어 있어야 함. sudo pip install pylint

"========================================================================
" Tag list가 사용하는 ctags의 경로 설정
"let Tlist_Ctags_Cmd = ''/usr/local/bin/ctags'
"let Tlist_Inc_Winwidth = 0
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Auto_Open = 1
"let Tlist_Display_Tag_Scope = 1
"let Tlist_Display_Prototype = 1
"let Tlist_Sort_Type = ''name'
"let Tlist_Auto_Update = 1
" " Tag list 창을 오른쪽으로 생성
"let Tlist_Use_Right_Window = 1

"========================================================================
"Source explorer
let g:SrcExpl_winHeight = 8
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_searchLocalDef = 1
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
let g:SrcExpl_updateTagsKey = "<F11>"
let g:SrcExpl_prevDefKey = "<F9>"
let g:SrcExpl_nextDefKey = "<F10>"
let g:SrcExpl_pluginList = [ "__Tag_List__", "_NERD_tree_", "Source_Explorer"]

"========================================================================
"" python 에서 ctags 활용위한 설정
"python << EOF
"import os
"import sys
"import vim
"for p in sys.path:
"        if os.path.isdir(p):
"            vim.command(r"set path+=%s" %(p.replace(" ", r"\ ")))
"EOF
"set tags+=$HOME/.vim/tags/python.ctags

"========================================================================
"" python 에서 ctags 활용위한 설정
set tags=./tags
let g:easytags_auto_highlight = 1
let g:easytags_cmd = '/usr/bin/ctags'
let g:easytags_syntax_keyword = 'always'
let g:easytags_always_enabled = 1
let g:easytags_auto_update = 1
let g:easytags_python_script = 1
let g:easytags_python_enabled = 1
let g:tagbar_usearrows = 1

"let g:ycm_path_to_python_interpreter = '/usr/local/Cellar/python/2.7.12/bin/python'
