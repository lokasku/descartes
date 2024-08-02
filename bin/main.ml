open Descartes.Types
open Descartes.Label
open Descartes.Report

let _ =
  create_report Error { name = "foo.lys"; contents = open_in "test.hs" }
  |> with_code "E0001"
  |> with_info "This is an information"
  |> with_hint "Some useful hint"
  |> add_label
       (create_label (range 8 9)
       |> with_msg "This is a label" |> with_color "green" |> with_order 1
       |> with_priority 1)
  |> add_label (create_label (range 10 11) |> with_msg "This is another label")

let _ : in_channel = open_in "dune"
