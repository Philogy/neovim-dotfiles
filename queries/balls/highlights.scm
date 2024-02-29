(comment) @comment

(number) @number

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
  "extern"
  "dependency"
] @type


"fn" @keyword.function

(function_definition . (identifier) @function)

(std_evm_op) @function.builtin

(invocation . (identifier) @function.call)

(identifier) @variable
