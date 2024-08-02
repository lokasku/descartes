open Types

type t = {
  severity : severity;
  source : source;
  code : string option;
  info : string option;
  hint : string option;
  labels : Label.t list;
}

let create_diagnostic severity source =
  { severity; source; code = None; info = None; hint = None; labels = [] }

let with_code code diagnostic = { diagnostic with code = Some code }
let with_info info diagnostic = { diagnostic with info = Some info }
let with_hint hint diagnostic = { diagnostic with hint = Some hint }

let add_label label diagnostic =
  { diagnostic with labels = label :: diagnostic.labels }
