open Printf
open Types
open Format

type line_range = {start_line: int; end_line: int}

let header (report : Report.t) =
  let color = color_of_severity report.severity in
  let severity = string_of_severity report.severity in
  let code = match report.code with Some code -> code | None -> -1 in
  let msg = match report.msg with Some msg -> msg | None -> "" in
  eprintf "%s" (color severity) ;
  if code <> -1 then eprintf "%s" (color @@ string_of_int code) ;
  if msg <> "" then (
    eprintf "%s" (bright_black ": ") ;
    eprintf "%s\n" msg )

let location (range : range) (lines : string list) : line_range =
  let rec find_line_index char_index lines current_line =
    match lines with
    | [] ->
        current_line
    | line :: rest ->
        let line_length = String.length line + 1 in
        if char_index < line_length then current_line
        else find_line_index (char_index - line_length) rest (current_line + 1)
  in
  let start_line = find_line_index range.start lines 0 in
  let end_line = find_line_index range.fin lines 0 in
  {start_line; end_line}

(*
   let body (report : Report.t) (charset : charset) =
      let lines = String.split_on_char '\n' report.source.contents in
      let multiline : (range, display_info) Hashtbl.t = Hashtbl.create 10 in
      let last_line = *)
