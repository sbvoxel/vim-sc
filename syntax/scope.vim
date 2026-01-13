" Vim syntax file
" Preliminary syntax file for the Scope language.
" This was adapted at some point (incompletely) from Zig

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "scope"

syn keyword scopeAccessModifier pub
syn keyword scopeStorageClass const extern packed export let var volatile align threadlocal nullable
syn keyword scopePreProc noalias inline
syn keyword scopeStructure struct class enum union
syn keyword scopeStatement break return continue yield asm defer errdefer unreachable when label goto abort assert assert_known check
syn keyword scopeConditional static if else switch orelse case default
syn keyword scopeRepeat while for

syn keyword scopeConstant null undefined
syn keyword scopeKeyword fn test use import cast reinterpret_cast unsafe_cast type this operator interface module trait
syn keyword scopeType bool f16 f32 f64 f128 never void auto float double
syn keyword scopeType i0 u0 isize usize int uint uintptr

syn keyword scopeBoolean true false
syn keyword scopeAsync async await suspend resume cancel
syn keyword scopeException try catch

syn match scopeType "\v<[iu][1-9]\d*>"

syn match scopeOperator display "\V\[-+/*=^&?|!><%~:]"
syn match scopeArrowCharacter display "\V->"

syn match scopeBuiltinFn "\v\@(memcpy|memset|minValue|mod|mulWithOverflow)>"
syn match scopeBuiltinFn "\v\@(shlWithOverflow|shrExact|sizeOf|sizeof|sqrt|byteSwap|subWithOverflow|intCast|floatCast|intToFloat|floatToInt|boolToInt|errSetCast)>"
syn match scopeBuiltinFn "\v\@(truncate|typeId|typeInfo|typeName|typeOf|typeof|atomicRmw|bytesToSlice|sliceToBytes)>"
syn match scopeBuiltinFn "\v\@(intToError|errorToInt|intToEnum|enumToInt|setAlignStack|frame|Frame|frameSize|bitReverse|Vector)>"

syn match scopeDecNumber display "\v<\d%(_?\d)*%(\.\.@!)?%(\d%(_?\d)*)?%([eE][+-]?\d%(_?\d)*)?"
syn match scopeHexNumber display "\v<0x\x%(_?\x)*%(\.\.@!)?%(\x%(_?\x)*)?%([pP][+-]?\d%(_?\d)*)?"
syn match scopeOctNumber display "\v<0o\o%(_?\o)*"
syn match scopeBinNumber display "\v<0b[01]%(_?[01])*"


syn match scopeCharacterInvalid display contained /b\?'\zs[\n\r\t']\ze'/
syn match scopeCharacterInvalidUnicode display contained /b'\zs[^[:cntrl:][:graph:][:alnum:][:space:]]\ze'/
syn match scopeCharacter /b'\([^\\]\|\\\(.\|x\x\{2}\)\)'/ contains=scopeEscape,scopeEscapeError,scopeCharacterInvalid,scopeCharacterInvalidUnicode
syn match scopeCharacter /'\([^\\]\|\\\(.\|x\x\{2}\|u\x\{4}\|U\x\{6}\)\)'/ contains=scopeEscape,scopeEscapeUnicode,scopeEscapeError,scopeCharacterInvalid

syn region scopeBlock start="{" end="}" transparent fold

syn region scopeCommentLine start="//" end="$" contains=scopeTodo,@Spell
syn region scopeCommentLineDoc start="////\@!" end="$" contains=scopeTodo,@Spell

syn match scopeMultilineStringPrefix display contained /c\?\\\\/
syn region scopeMultilineString start="c\?\\\\" end="$" contains=scopeMultilineStringPrefix

syn keyword scopeTodo contained TODO

syn match     scopeEscapeError   display contained /\\./
syn match     scopeEscape        display contained /\\\([nrt\\'"]\|x\x\{2}\)/
syn match     scopeEscapeUnicode display contained /\\\(u\x\{4}\|U\x\{6}\)/
syn region    scopeString      start=+c\?"+ skip=+\\\\\|\\"+ end=+"+ oneline contains=scopeEscape,scopeEscapeUnicode,scopeEscapeError,@Spell

hi def link scopeDecNumber scopeNumber
hi def link scopeHexNumber scopeNumber
hi def link scopeOctNumber scopeNumber
hi def link scopeBinNumber scopeNumber

hi def link scopeBuiltinFn Function
hi def link scopeKeyword Keyword
hi def link scopeType Type
hi def link scopeCommentLine Comment
hi def link scopeCommentLineDoc SpecialComment
hi def link scopeTodo Todo
hi def link scopeString String
hi def link scopeMultilineString String
hi def link scopeMultilineStringContent String
hi def link scopeMultilineStringPrefix Comment
hi def link scopeCharacterInvalid Error
hi def link scopeCharacterInvalidUnicode scopeCharacterInvalid
hi def link scopeCharacter Character
hi def link scopeEscape Special
hi def link scopeEscapeUnicode scopeEscape
hi def link scopeEscapeError Error
hi def link scopeBoolean Boolean
hi def link scopeConstant Constant
hi def link scopeNumber Number
hi def link scopeOperator Operator
hi def link scopeArrowCharacter scopeOperator
hi def link scopeAccessModifier StorageClass
hi def link scopeStorageClass StorageClass
hi def link scopeStructure Structure
hi def link scopeStatement Statement
hi def link scopeConditional Conditional
hi def link scopeRepeat Repeat
hi def link scopeAsync Keyword
hi def link scopePreProc PreProc
hi def link scopeException Exception
