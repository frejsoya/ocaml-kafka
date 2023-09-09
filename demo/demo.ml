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
  let res_pp = Fmt.(result ~ok:Fmt.string ~error:string) in
  Fmt.epr "Setting incorrect existing config value\n";
  let open Rdkafka_bind in
  let conf = Config.make () in
  let res = Rdkafka_bind.Config.set conf ~key:"foo" ~value:"bar" in
  Fmt.epr "conf result: %a\n" res_pp res;
  (* Get test..num.brokers *)
  let key = "test.mock.num.brokers" in
  let res = Rdkafka_bind.Config.get conf ~key in
  Fmt.epr "conf get %s=%a\n" key res_pp res;

  let res = Rdkafka_bind.Config.set conf ~key ~value:"3" in
  Fmt.epr "conf set %s <- %a\n" key res_pp res;

  let res = Rdkafka_bind.Config.get conf ~key in
  Fmt.epr "conf get %s=%a\n" key res_pp res

(* Config.set conf "foo" "bar" *)
(* Producer *)
