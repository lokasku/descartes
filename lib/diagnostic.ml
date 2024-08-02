(* let diagnose_one (report : Report.t) : unit = print_endline "A" *)
(* let diagnose_many (reports : Report.t) : unit = print_endline "B" *)

type grouped_reports = {
  mutable errors : (string * Report.t list) list;
  mutable warnings : (string * Report.t list) list;
  mutable hints : (string * Report.t list) list;
  mutable infos : (string * Report.t list) list;
}

let add_report_to_group grouped_reports (report : Report.t) =
  let file_name = report.source.name in
  let update_list list =
    match List.assoc_opt file_name list with
    | Some lst -> (file_name, report :: lst) :: List.remove_assoc file_name list
    | None -> (file_name, [ report ]) :: list
  in
  match report.severity with
  | Error ->
      grouped_reports.errors <- update_list grouped_reports.errors;
      grouped_reports
  | Warning ->
      grouped_reports.warnings <- update_list grouped_reports.warnings;
      grouped_reports
  | Hint ->
      grouped_reports.hints <- update_list grouped_reports.hints;
      grouped_reports
  | Info ->
      grouped_reports.infos <- update_list grouped_reports.infos;
      grouped_reports

let arrange reports =
  let empty_grouped_reports =
    { errors = []; warnings = []; hints = []; infos = [] }
  in
  List.fold_left add_report_to_group empty_grouped_reports reports
