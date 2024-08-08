open Printf
open Types
open Format
open Charset
open Label

type loc = {start_line: int; end_line: int; span: range}

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

(* let location (range : range) (lines : string list) : loc =
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
   {start_line; end_line} *)
let location (range : range) (lines : string list) : loc =
  let rec find_line_index char_index lines current_line =
    match lines with
    | [] ->
        (current_line, char_index)
    | line :: rest ->
        let line_length = String.length line + 1 in
        if char_index < line_length then (current_line, char_index)
        else find_line_index (char_index - line_length) rest (current_line + 1)
  in
  let start_line, start_index = find_line_index range.start lines 0 in
  let end_line, end_index = find_line_index range.fin lines 0 in
  let span =
    if start_line = end_line then {start= start_index; fin= end_index}
    else {start= start_index; fin= end_index}
  in
  {start_line; end_line; span}

let check_range (range : range) (string_len : int) =
  if range.start < 0 || range.fin < 0 || range.fin > string_len then
    raise (Invalid_argument "Invalid range")

let body (report : Report.t) (charset : charset) =
  let lines = String.split_on_char '\n' report.source.contents in
  let _sorted_labels = Label.sort report.labels in
  let last_loc =
    let max_label_range =
      List.fold_left
        (fun rng label -> if get_end label > rng.fin then label.range else rng)
        (range 0 0) report.labels
    in
    check_range max_label_range (String.length report.source.contents) ;
    location max_label_range lines
  in
  let last_number_len = String.length (string_of_int (last_loc.end_line + 1)) in
  let file_info =
    String.make (last_number_len + 2) ' '
    ^ charset.tlangle ^ charset.hbar ^ " " ^ report.source.name
  in
  eprintf "%s\n" file_info ;
  eprintf
    " Start Line: %d\n\
    \ End Line: %d\n\
    \ Span Start Index: %d\n\
    \ Span End Index: %d\n"
    last_loc.start_line last_loc.end_line last_loc.span.start last_loc.span.fin
