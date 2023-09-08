let () =
  print_string "hello worldAA\n";
  let open Rdkafka_bind in
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
    let pp = Fmt.Dump.(list @@ pair string string) in
    (* let pp = Fmt.(list ~sep:cut @@ pair ~sep:comma string string) in *)
    Fmt.pr "%a.\n" pp conf
  in

  ()

(* Set config *)
let () =
  Fmt.epr "Setting config value\n";
  let open Rdkafka_bind in
  let conf = Config.make () in
  let res = Rdkafka_bind.Config.set conf ~key:"foo" ~value:"bar" in
  let res_pp = Fmt.Dump.(result ~ok:Fmt.nop ~error:string) in
  Fmt.epr "conf result: %a\n" res_pp res;

  let res = Config.set conf ~key:"test.mock.num.brokers" ~value:"3" in
  Fmt.epr "conf result: %a\n" res_pp res

(* Config.set conf "foo" "bar" *)
(* Producer *)
