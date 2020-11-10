" -------------------------------------------------
" Name:    violet.vim
" Author:  github.com/stillwwater
" Version: 1.0
" License: The MIT License (MIT)
" --------------------------------------------------

hi clear

let g:colors_name = 'violet'

if exists('syntax_on')
  syntax reset
endif

if !exists('g:violet_blue')
  let g:violet_blue = 0
endif

if !exists('g:violet_accent')
  let g:violet_accent = 'purple'
endif

let s:none     = ['NONE',   'NONE']
let s:blue     = ['#458588',  '66']
let s:red      = ['#d65e76', '168']
let s:purple   = ['#b3aaee', '147']
let s:pink     = ['#faa0b9', '217']
let s:yellow   = ['#ffff87', '228']
let s:green    = ['#99e8c9', '122']
let s:cyan     = ['#87d7d7', '116']

if g:violet_blue
  let s:color0 = ['#0a1a26', '233']
  let s:color1 = ['#132631', '234']
  let s:color2 = ['#243b4a', '236']
  let s:color3 = ['#3b5266', '239']
else
  let s:color0 = ['#121213', '233']
  let s:color1 = ['#222223', '234']
  let s:color2 = ['#323233', '236']
  let s:color3 = ['#525253', '239']
endif

if g:violet_accent == 'pink'
  let s:accent = s:pink
elseif g:violet_accent == 'green'
  let s:accent = s:green
else
  let s:accent = s:purple
endif

let s:comment  = ['#65737a', '243']
let s:normal   = ['#bfbbbe', '250']
let s:keyword  = ['#fffbec', '231']
let s:string   = ['#e0ebe9', '253']
let s:constant = ['#87d7d7', '116']
let s:preproc  = ['#767678', '243']

let s:b  = 'bold'
let s:i  = 'italic'
let s:u  = 'underline'
let s:uc = 'undercurl'

function! s:h(group, fg, bg, ...)
  execute 'highlight' a:group
    \ 'guifg=' . a:fg[0]
    \ 'guibg=' . a:bg[0]
    \ 'ctermfg=' . a:fg[1]
    \ 'ctermbg=' . a:bg[1]
    \ 'gui=' . (a:0 >= 1 ? a:1 : 'NONE')
    \ 'cterm=' . (a:0 >= 1 ? a:1 : 'NONE')
endfunction

call s:h('Normal', s:normal, s:color0)
hi! link Identifier     Normal
hi! link Function       Normal
hi! link Delimiter      Normal
hi! link Operator       Normal

call s:h('Comment', s:comment, s:none)
call s:h('String', s:string, s:none)

call s:h('Type', s:accent, s:none)
hi! link StorageClass   Type
hi! link Structure      Type
hi! link Typedef        Type

call s:h('Keyword', s:keyword, s:none)
hi! link Conditional    Keyword
hi! link Repeat         Keyword
hi! link Label          Keyword
hi! link Statement      Keyword
hi! link Exception      Keyword

call s:h('Constant', s:constant, s:none)
hi! link Character      Constant
hi! link Number         Constant
hi! link Boolean        Constant
hi! link Float          Constant

call s:h('PreProc', s:preproc, s:none)
hi! link Include        PreProc
hi! link Define         PreProc
hi! link Macro          PreProc
hi! link PreCondit      PreProc

call s:h('Special', s:keyword, s:none)
hi! link SpecialChar    Special
hi! link Tag            Special
hi! link SpecialComment Special
hi! link Debug          Special

call s:h('Underlined',   s:normal,   s:none, s:u)
call s:h('Todo',         s:pink,     s:none, s:u)
call s:h('Error',        s:red,      s:none)
call s:h('IncSearch',    s:color0,   s:yellow)
call s:h('Search',       s:color0,   s:yellow)
call s:h('NonText',      s:color2,   s:none)
call s:h('Visual',       s:color0,   s:accent)
call s:h('MatchParen',   s:color0,   s:accent)
call s:h('StatusLine',   s:normal,   s:color1, s:b)
call s:h('StatusLineNC', s:color3,   s:color1)
call s:h('Directory',    s:blue,     s:none)
call s:h('VertSplit',    s:color3,   s:none)
call s:h('CursorLineNR', s:color3,   s:color1)
call s:h('CursorLine',   s:none,     s:color1)
call s:h('CursorColumn', s:none,     s:color1)
call s:h('LineNR',       s:color2,   s:none)
call s:h('SignColumn',   s:normal,   s:none)
call s:h('Folded',       s:accent,   s:color1)
call s:h('FoldColumn',   s:accent,   s:color1)
call s:h('Title',        s:preproc,  s:none)
call s:h('WarningMsg',   s:yellow,   s:none)
call s:h('ErrorMsg',     s:red,      s:none)
call s:h('MoreMsg',      s:blue,     s:none)
call s:h('ModeMsg',      s:normal,   s:none, s:b)
call s:h('Question',     s:blue,     s:none)
call s:h('DiffAdd',      s:green,    s:none)
call s:h('DiffChange',   s:blue,     s:none)
call s:h('DiffDelete',   s:red,      s:none)
call s:h('DiffText',     s:preproc,  s:none)
call s:h('WildMenu',     s:color0,   s:normal)
call s:h('TabLine',      s:normal,   s:color1)
call s:h('TabLineFill',  s:normal,   s:color1)
call s:h('TabLineSel',   s:color0,   s:accent)
call s:h('Pmenu',        s:normal,   s:color1)
call s:h('PmenuSel',     s:color1,   s:accent)
call s:h('PmenuSBar',    s:normal,   s:color1)
call s:h('PmenuThumb',   s:normal,   s:color3)
call s:h('SpellBad',     s:red,      s:none, s:u)
call s:h('SpellCap',     s:blue,     s:none, s:u)
call s:h('SpellRare',    s:yellow,   s:none, s:u)
call s:h('SpellLocal',   s:green,    s:none, s:u)

" Terminal
if has('terminal')
  let g:terminal_ansi_colors = [
    \ s:color0[0], s:red[0],  s:comment[0], s:preproc[0],
    \ s:purple[0], s:blue[0], s:cyan[0],    s:comment[0],
    \ s:color3[0], s:red[0],  s:green[0],   s:preproc[0],
    \ s:purple[0], s:blue[0], s:cyan[0],    s:normal[0]]
endif
hi! link StatusLineTerm   StatusLine
hi! link StatusLineTermNC StatusLineNC

" Markdown
call s:h('markdownH1',         s:green,    s:none)
call s:h('markdownH2',         s:accent,   s:none, s:b)
call s:h('markdownH3',         s:accent,   s:none)
call s:h('markdownLinkText',   s:constant, s:none)
call s:h('markdownUrl',        s:comment,  s:none, s:u)
call s:h('markdownBold',       s:preproc,  s:none, s:b)
call s:h('markdownBoldItalic', s:preproc,  s:none, s:b)
call s:h('markdownItalic',     s:preproc,  s:none, s:i)
call s:h('markdownCode',       s:comment,  s:none)
call s:h('markdownBlockQuote', s:comment,  s:none)

" coc-nvim
hi! link CocErrorSign   ErrorMsg
hi! link CocWarningSign WarningMsg
hi! link CocInfoSign    Question
hi! link CocHintSign    Comment

" ALE
hi! link ALEErrorSign   CocErrorSign
hi! link ALEWarningSign CocWarningSign

" Syntastic
hi! link SyntasticErrorSign   CocErrorSign
hi! link SyntasticError       CocErrorSign
hi! link SyntasticWarningSign CocWarningSign
hi! link SyntasticWarning     CocWarningSign

" git-gutter
call s:h('GitGutterAdd',    s:green,  s:none)
call s:h('GitGutterChange', s:accent, s:none)
call s:h('GitGutterDelete', s:red,    s:none)
hi! link SignifySignAdd     GitGutterAdd
hi! link SignifySignChange  GitGutterChange
hi! link SignifySignDelete  GitGutterDelete

" Make / Cmake
hi! link makeCommands  Type
hi! link cmakeCommand  Type

" HTML
hi! link htmlTagName  Keyword
hi! link htmlTag      PreProc
hi! link htmlEndTag   PreProc

" Python
hi! link pythonBuiltin       Type
hi! link pythonOperator      Keyword
hi! link pythonTripleQuotes  Comment
hi! link pythonDecoratorName PreProc

" Lua
hi! link luaFunction Type

" json
hi! link jsonKeyword PreProc

" css
hi! link cssProp PreProc
hi! link cssAttr Type

" Go
hi! link goConstants   Constant
hi! link goBuiltins    Type
hi! link goDeclaration Type
hi! link goDeclType    Type
hi! link goDirective   PreProc

" javascript
hi! link javaScriptGlobal    Type
hi! link javaScriptMember    Type
hi! link javaScriptReserved  Type
hi! link javaScriptFunction  Type
hi! link javaScriptNumber    Constant
hi! link javaScriptNull      Constant
hi! link javaScriptEmbed     PreProc

" vim-typescript
hi! link typescriptReserved      Type
hi! link typescriptFuncKeyword   Type
hi! link typescriptGlobalObjects Type
hi! link typescriptOperator      Keyword
hi! link typescriptLogicSymbols  Normal
hi! link typescriptGlobal        Type
hi! link typescriptEndColons     PreProc
hi! link typescriptStorageClass  Type
hi! link typescriptStatement     Statement
hi! link typescriptStringS       String

" vim: fdm=marker:sw=2:sts=2:et
