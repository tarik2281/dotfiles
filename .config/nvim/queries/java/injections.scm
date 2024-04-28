(method_invocation
  name: (identifier) @name
  (argument_list
    (string_literal
      (string_fragment) @injection.content))
  (#any-of? @name
    "createQuery"
    "createNativeQuery")
  (#set! injection.language "sql"))

(method_invocation
  name: (identifier) @name
  (argument_list
    (string_literal
      (multiline_string_fragment) @injection.content))
  (#any-of? @name
    "createQuery"
    "createNativeQuery")
  (#set! injection.language "sql"))
