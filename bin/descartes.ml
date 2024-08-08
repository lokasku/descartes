open Descartes.Types
open Descartes.Label
open Descartes.Report
open Descartes.Write
open Descartes.Charset

let report =
  create_report Error
    {name= "foo.ml"; contents= "let x = 1\nlet y = 2\nlet z = 3"}
  |> with_code 0205
  |> with_msg "This is an error"
  |> with_info "This is an information"
  |> with_hint "Some useful hint"
  |> add_label
       ( create_label (range 8 9)
       |> Descartes.Label.with_msg "This is a label"
       |> with_color "green" |> with_priority 1 )
  |> add_label
       ( create_label (range 2 24)
       |> Descartes.Label.with_msg "This is another label" )

let () = header report ; body report unicode

(* let () =
   let msg =
     "Hello my name is Lucas\n\
      I am 17 years old\n\
      and I really enjoy\n\n\n\n\n\
      programming,\n\
      linguistic and\n\
      geopolitic"
   in
   let lines = String.split_on_char '\n' msg in
   let range = range 2 64 in
   let {start_line; end_line} : loc = location range lines in
   Printf.printf "%d %d\n" start_line end_line ;
   Printf.printf "%s\n" @@ string_of_int (String.length msg) ;
   Printf.printf "%d | %s\n" (start_line + 1) (List.nth lines start_line) ;
   Printf.printf "%d | %s\n" (end_line + 1) (List.nth lines end_line) *)
