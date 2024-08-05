type severity = Error | Warning | Hint | Info [@@deriving show]

type range = {start: int; fin: int} [@@deriving show]

let range start fin : range = {start; fin}

type source = {name: string; contents: string} [@@deriving show]
