open Types

type display_info = {msg: string; color: string; priority: int}
[@@deriving show]

type t = {range: range; loc: range; display_info: display_info}
[@@deriving show]

let sort labels =
  List.sort (fun a b -> compare a.range.start b.range.start) labels

let get_start label = label.range.start

let get_end label = label.range.fin

let create_label rng =
  {range= rng; loc= range 0 0; display_info= {msg= ""; color= ""; priority= 0}}

let with_msg msg label = {label with display_info= {label.display_info with msg}}

let with_color color label =
  {label with display_info= {label.display_info with color}}

let with_priority priority label =
  {label with display_info= {label.display_info with priority}}
