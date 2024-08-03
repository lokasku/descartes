open Format
open Report
open Printf

let header (report : Report.t) : string =
  let file_name = magenta report.source.name ^ ": " in
  let severity =
    match report.severity with
    | Error -> red "error"
    | Warning -> yellow "warning"
    | Info -> blue "info"
    | Hint -> green "hint"
  in
  let code =
    match report.code with
    | Some code -> ": " ^ bold @@ sprintf "%s" code
    | None -> ""
  in
  let msg = match report.msg with Some msg -> ": " ^ msg | None -> "" in
  file_name ^ severity ^ code ^ msg
