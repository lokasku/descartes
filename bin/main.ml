open Descartes.Types
open Descartes.Label
open Descartes.Report
(* open Descartes.Write *)

let _ =
  create_report Error { name = "foo.lys"; contents = "def rev x f = f x" }
  |> with_code "mismatch-type"
  |> with_msg "This is an error"
  |> with_info "This is an information"
  |> with_hint "Some useful hint"
  |> add_label
       (create_label (range 8 9)
       |> Descartes.Label.with_msg "This is a label"
       |> with_color "green" |> with_priority 1)
  |> add_label
       (create_label (range 10 11)
       |> Descartes.Label.with_msg "This is another label")
