" Vim syntax file
" This is clearly adapted (incompletely) from Zig

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "sc"

syn keyword scHtml html body p div
syn keyword scStorage const extern packed export pub file_private noalias inline compt let var nakedcc stdcallcc volatile allowzero align linksection threadlocal
syn keyword scStructure struct enum union error alias
syn keyword scStatement break return continue asm defer errdefer unreachable try catch async await suspend resume cancel when label goto
syn keyword scConditional static ef annars if else switch and or orelse case default
syn keyword scRepeat while for

syn keyword scConstant null nullptr undefined
syn keyword scKeyword fn usingnamespace test import cimport use cast reinterpret_cast unsafe_cast cast_unsafe type
syn keyword scType bool f16 f32 f64 f128 void noreturn auto float double
syn keyword scType i0 u0 isize  usize

syn keyword scBoolean true false

syn match scType "\v<[iu][1-9]\d*>"

syn match scOperator display "\%(+%\?\|-%\?\|/\|*%\?\|=\|\^\|&\|?\||\|!\|>\|<\|%\|<<%\?\|>>\)=\?"
syn match scArrowCharacter display "->"

syn match scBuiltinFn "\v\@(addWithOverflow|ArgType|atomicLoad|bitCast|breakpoint)>"
syn match scBuiltinFn "\v\@(alignCast|alignOf|cDefine|cImport|cInclude)>"
syn match scBuiltinFn "\v\@(cUndef|canImplicitCast|clz|cmpxchgWeak|cmpxchgStrong|compileError)>"
syn match scBuiltinFn "\v\@(compileLog|ctz|popCount|divExact|divFloor|divTrunc)>"
syn match scBuiltinFn "\v\@(embedFile|export|tagName|TagType|errorName)>"
syn match scBuiltinFn "\v\@(errorReturnTrace|fence|fieldParentPtr|field|unionInit)>"
syn match scBuiltinFn "\v\@(frameAddress|import|inlineCall|newStackCall|intToPtr|IntType)>"
syn match scBuiltinFn "\v\@(maxValue|memberCount|memberName|memberType)>"
syn match scBuiltinFn "\v\@(memcpy|memset|minValue|mod|mulWithOverflow)>"
syn match scBuiltinFn "\v\@(noInlineCall|bitOffsetOf|byteOffsetOf|OpaqueType|panic|ptrCast)>"
syn match scBuiltinFn "\v\@(ptrToInt|rem|returnAddress|setCold)>"
syn match scBuiltinFn "\v\@(setRuntimeSafety|setEvalBranchQuota|setFloatMode)>"
syn match scBuiltinFn "\v\@(setGlobalLinkage|setGlobalSection|shlExact|This|hasDecl|hasField)>"
syn match scBuiltinFn "\v\@(shlWithOverflow|shrExact|sizeOf|sizeof|sqrt|byteSwap|subWithOverflow|intCast|floatCast|intToFloat|floatToInt|boolToInt|errSetCast)>"
syn match scBuiltinFn "\v\@(truncate|typeId|typeInfo|typeName|typeOf|typeof|atomicRmw|bytesToSlice|sliceToBytes)>"
syn match scBuiltinFn "\v\@(intToError|errorToInt|intToEnum|enumToInt|setAlignStack|frame|Frame|frameSize|bitReverse|Vector)>"

syn match scDecNumber display "\<[0-9]\+\%(.[0-9_]\+\)\=\%([eE][+-]\?[0-9]\+\)\="
syn match scHexNumber display "\<0x[a-fA-F0-9]\+\%([a-fA-F0-9]\+\%([pP][+-]\?[0-9]\+\)\?\)\="
syn match scOctNumber display "\<0o[0-7]\+"
syn match scBinNumber display "\<0b[01]\+\%(.[01]\+\%([eE][+-]\?[0-9]\+\)\?\)\="


syn match scCharacterInvalid display contained /b\?'\zs[\n\r\t']\ze'/
syn match scCharacterInvalidUnicode display contained /b'\zs[^[:cntrl:][:graph:][:alnum:][:space:]]\ze'/
syn match scCharacter /b'\([^\\]\|\\\(.\|x\x\{2}\)\)'/ contains=scEscape,scEscapeError,scCharacterInvalid,scCharacterInvalidUnicode
syn match scCharacter /'\([^\\]\|\\\(.\|x\x\{2}\|u\x\{4}\|U\x\{6}\)\)'/ contains=scEscape,scEscapeUnicode,scEscapeError,scCharacterInvalid

syn region scCommentLine start="//" end="$" contains=scTodo,@Spell
syn region scCommentLineDoc start="////\@!" end="$" contains=scTodo,@Spell

" TODO: match only the first '\\' within the scMultilineString as scMultilineStringPrefix
syn match scMultilineStringPrefix display contained /c\?\\\\/
syn region scMultilineString start="c\?\\\\" end="$" contains=scMultilineStringPrefix

syn keyword scTodo contained TODO

syn match     scEscapeError   display contained /\\./
syn match     scEscape        display contained /\\\([nrt\\'"]\|x\x\{2}\)/
syn match     scEscapeUnicode display contained /\\\(u\x\{4}\|U\x\{6}\)/
syn region    scString      start=+c\?"+ skip=+\\\\\|\\"+ end=+"+ oneline contains=scEscape,scEscapeUnicode,scEscapeError,@Spell

hi def link scDecNumber scNumber
hi def link scHexNumber scNumber
hi def link scOctNumber scNumber
hi def link scBinNumber scNumber

hi def link scBuiltinFn Function
hi def link scKeyword Keyword
hi def link scType Type
hi def link scCommentLine Comment
hi def link scCommentLineDoc SpecialComment
hi def link scTodo Todo
hi def link scString String
hi def link scMultilineString String
hi def link scMultilineStringContent String
hi def link scMultilineStringPrefix Comment
hi def link scCharacterInvalid Error
hi def link scCharacterInvalidUnicode scCharacterInvalid
hi def link scCharacter Character
hi def link scEscape Special
hi def link scEscapeUnicode scEscape
hi def link scEscapeError Error
hi def link scBoolean Boolean
hi def link scConstant Constant
hi def link scNumber Number
hi def link scArrowCharacter scOperator
hi def link scOperator Operator
hi def link scHtml StorageClass
hi def link scStorage StorageClass
hi def link scStructure Structure
hi def link scStatement Statement
hi def link scConditional Conditional
hi def link scRepeat Repeat