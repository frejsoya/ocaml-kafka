let () =
  print_string "hello worldAA\n";
  let open Rdkafka_ctypes in
  let f () =
    let _c = Config.make () in
    print_string "Config make\n"
  in
  f ();
  Gc.full_major ();
  print_endline "Start client";

  let _res =
    Client.with_client @@ fun client ->
    Printf.printf "Client name %s" (Client.name client);
    let conf = Client.config client in
    let pp = Fmt.(list ~sep:cut @@ pair ~sep:comma string string) in
    Fmt.pr "%a." pp conf
  in

  ()
(* Producer *)
