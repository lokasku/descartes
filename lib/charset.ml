type charset =
  { hbar: string
  ; vbar: string
  ; blangle: string
  ; tlangle: string
  ; uarrow: string
  ; darrow: string }
[@@deriving show]

let ascii =
  {hbar= "-"; vbar= "|"; blangle= "+"; tlangle= "+"; uarrow= "^"; darrow= "v"}

let unicode =
  {hbar= "─"; vbar= "│"; blangle= "╰"; tlangle= "╭"; uarrow= "▲"; darrow= "▼"}
