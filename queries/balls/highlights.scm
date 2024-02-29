(comment) @comment

(number) @number
(decimal_number) @number
(hex_number) @number

[
  ","
  "->"
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
  "<"
  ">"
] @punctuation.bracket

[
  "const"
  "dependency"
] @type

[
 "reads"
 "writes"
 "stack"
] @type


(huff_const . (identifier) @constant)
(abstract_dependency . (identifier) @constant)

[
 "fn"
 "extern"
] @keyword.function

(function_definition . (identifier) @function)

(extern_macro . (identifier) @function)


(std_evm_op) @function.builtin

(invocation . (identifier) @function.call)

(reads
  (ident_list
    (identifier) @constant))

(writes
  (ident_list
    (identifier) @constant))
