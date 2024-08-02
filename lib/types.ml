type severity = Error | Warning | Hint | Info
type range = { start : int; end_ : int }

let range start end_ : range = { start; end_ }

type source = { name : string; contents : in_channel }
