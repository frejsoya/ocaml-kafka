open Printf

let main () =
  Sys.getcwd () |> eprintf "%s";
  if Array.length Sys.argv < 2 then
    Printf.eprintf "Usage:\n%s <filename>\n" Sys.argv.(0)
  else
    let filename = Sys.argv.(1) in
    Gen_enums.parse_json filename

let _ = main ()
