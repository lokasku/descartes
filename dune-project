(lang dune 3.16)

(name descartes)

(generate_opam_files true)

(source
 (github lokasku/descartes))

(authors "Lokasku")

(maintainers "Lokasku")

(license GPL-3.0)

(documentation https://url/to/documentation)

(package
 (name descartes)
 (synopsis "Refined compiler error diagnostics.")
 (description "A refined compiler error diagnostics.")
 (depends ocaml dune)
 (tags
  (diagnostics error)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
