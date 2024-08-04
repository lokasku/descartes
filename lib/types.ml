type severity = Error | Warning | Hint | Info [@@deriving show]
type range = { start : int; end_ : int } [@@deriving show]

let range start end_ : range = { start; end_ }

type source = { name : string; contents : string } [@@deriving show]
