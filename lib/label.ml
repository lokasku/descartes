open Types

type display_info = {
  msg : string;
  color : string;
  order : int;
  priority : int;
}

type t = { range : range; display_info : display_info }

let create_label range =
  { range; display_info = { msg = ""; color = ""; order = 0; priority = 0 } }

let with_msg msg label =
  { label with display_info = { label.display_info with msg } }

let with_color color label =
  { label with display_info = { label.display_info with color } }

let with_order order label =
  { label with display_info = { label.display_info with order } }

let with_priority priority label =
  { label with display_info = { label.display_info with priority } }
