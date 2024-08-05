open Format
open Printf

(* type line_info = { content : string; number : int } [@@deriving show]

   type t =
     | Inline of line_info * Types.range * Label.display_info
     | MultiLineStart of line_info * Types.range * Label.display_info
     | MultiLineEnd of line_info * Types.range * Label.display_info
   [@@deriving show] *)

let header (report : Report.t) =
  let file_name = magenta report.source.name ^ ": " in
  let severity =
    match report.severity with
    | Error ->
        red "error"
    | Warning ->
        yellow "warning"
    | Info ->
        blue "info"
    | Hint ->
        green "hint"
  in
  let code =
    match report.code with
    | Some code ->
        ": " ^ bold @@ sprintf "%s" code
    | None ->
        ""
  in
  let msg = match report.msg with Some msg -> ": " ^ msg | None -> "" in
  file_name ^ severity ^ code ^ msg
