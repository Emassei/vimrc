if exists("b:current_syntax")
  finish
endif

runtime! syntax/css.vim

syn case ignore

"syn cluster lessCssAttributes contains=css.*Attr,lessComment,cssValue.*,cssColor,cssURL,lessDefault,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssRenderProp

syn match lessVariable "@[[:alnum:]_-]\+" nextgroup=lessVariableAssignment
syn match lessVariableAssignment ":" contained nextgroup=lessVariableValue
syn match lessVariableValue ".*;"me=e-1 contained contains=lessVariable,lessOperator,lessDefault,@cssColors "me=e-1 means that the last char of the pattern is not highlighted

syn match lessOperator "+" contained
syn match lessOperator "-" contained
syn match lessOperator "/" contained
syn match lessOperator "*" contained

syn match lessDefault "!default" contained

syn match lessComment "//.*$" contains=@Spell

hi def link lessVariable Special
hi def link lessVariableValue Constant
hi def link lessDefault   Special
hi def link lessComment   Comment

let b:current_syntax = "less"

