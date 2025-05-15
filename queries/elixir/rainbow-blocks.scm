;; Block delimiters WIP

(do_block
  "do"  @delimiter   
  "end" @delimiter @sentinel) @container

(call 
 target: (identifier) @name @delimiter (#eq? @name "with")
  (arguments) 
  (do_block
    "do" @delimiter 
    (else_block
      "else" @delimiter 
    )? 
    "end" @delimiter @sentinel 
  )
) @container

(anonymous_function
  "fn" @delimiter
  "end" @delimiter @sentinel
) @container

(call
  target: (identifier) @name @delimiter (#eq? @name "if")
  (arguments) 
  (do_block
    "do" @delimiter
    (else_block 
      "else" @delimiter
    )?

    "end" @delimiter @sentinel
  )
) @container



(call
  target: (identifier) @name @delimiter (#eq? @name "unless")
  (arguments) 
  (do_block
    "do" @delimiter
    (else_block 
      "else" @delimiter
    )?
    "end" @delimiter @sentinel
  )
) @container

(call
  target: (identifier) @name @delimiter (#eq? @name "case")
  (arguments) 
  (do_block
    "do" @delimiter
    (stab_clause 
      "->" @delimiter 
    )* 
    "end" @delimiter @sentinel
  )
) @container

(call
  target: (identifier) @name @delimiter (#eq? @name "cond")
  (do_block
    "do" @delimiter
    (stab_clause 
      "->" @delimiter 
    )* 
    "end" @delimiter @sentinel
  )
) @container

(call
  target: (identifier) @name @delimiter (#eq? @name "for")
  (arguments) 
  (do_block
    "do" @delimiter
    "end" @delimiter @sentinel
  )
) @container


;; Copied over from rainbow-delimiters
(call
  (arguments
    "(" @delimiter
    ")" @delimiter @sentinel) @container)

(block
  "(" @delimiter
  ")" @delimiter @sentinel) @container

(string
  (interpolation
    "#{" @delimiter
    "}" @delimiter @sentinel) @container)

(tuple
  "{" @delimiter
  "}" @delimiter @sentinel) @container

(list
  "[" @delimiter
  "]" @delimiter @sentinel) @container

(access_call
  "[" @delimiter
  "]" @delimiter @sentinel) @container

(bitstring
  "<<" @delimiter
  ">>" @delimiter @sentinel) @container

(map
  "%" @delimiter
  "{" @delimiter
  "}" @delimiter @sentinel) @container

