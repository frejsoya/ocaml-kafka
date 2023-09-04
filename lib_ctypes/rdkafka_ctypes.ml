(* let () = Printf.printf "rd kafka version %d\n" C.Types.version C.Types.version *)

module Client : sig
  type t
  (* Exceptions *)

  val make : unit -> (t, string) Result.t
  val with_client : (t -> unit) -> (unit, string) Result.t
  val destroy : t -> unit
  val name : t -> string
  val config : t -> (string * string) list
end = struct
  module CKafka = C.Functions.Kafka

  type t = { handle : C.Types.Handle.t Ctypes.ptr }
  type res = (t, string) Result.t

  let make () : res =
    let kind = `PRODUCER in
    let count = 1024 in
    let size = Unsigned.Size_t.of_int count in
    let errstr = Ctypes.allocate_n Ctypes.char ~count in
    (* dont provide a conf *)
    match CKafka.kafka_new kind None errstr size with
    | Some handle -> Ok { handle }
    | None ->
        let err = Ctypes.string_from_ptr errstr ~length:count in
        Error err

  let destroy t = CKafka.kafka_destroy t.handle
  let name t = CKafka.name t.handle

  let config t =
    let config = C.Functions.Conf.conf_of_kafka t.handle in
    let init = Unsigned.Size_t.of_int 0 in
    let count = Ctypes.allocate Ctypes.size_t init in
    let dump = C.Functions.Conf.dump config count in
    []

  let with_client f =
    make ()
    |> Result.map (fun t ->
           let finally () = destroy t in
           let _res = Fun.protect ~finally (fun () -> f t) in
           ())

  let destroy t = C.Functions.Kafka.kafka_destroy t.handle
end

(*
Client connects to a kafka bokers
*)
module type Config = sig
  type t

  val set : t -> unit
end

module type Topic = sig
  type t
end

module type ProducerS = sig
  type t

  (* type message *)
  (* type err *)
  (* type delivery_callback *)
  (**)
  (* val make : unit -> t *)
  (* val send : t -> message -> (unit, err) Result.t *)
end

module Config = struct
  type t = { conf : C.Types.Conf.t Ctypes.ptr }

  (* let make_opaque : type a. finalise:(a ptr -> unit) -> a typ -> a ptr = *)
  (*  fun finalise reftyp -> *)
  (*   let package p = *)
  (*     CPointer (Fat.make ~managed:(Some (Obj.repr p)) ~reftyp (Stubs.block_address p)) *)
  (*   in *)
  (*   (* Gc.finalise (fun p -> f package p) *) *)
  (*   (* Stubs.allocate count (sizeof reftyp) i *) *)
  (*   finalise p; *)
  (*   package p *)

  let make () =
    let conf = C.Functions.Conf.conf_new () in
    let value : t = { conf } in
    let finalise t =
      print_endline "Cleaning\n";
      C.Functions.Conf.destroy t.conf
    in
    Gc.finalise finalise value;
    value

  let dump { conf } =
    let size_out = Ctypes.allocate Ctypes.size_t Unsigned.Size_t.zero in
    let data = C.Functions.Conf.dump conf size_out in

    (* let destroy { handle } = C.Functions.Conf.destroy handle in *)
    data
end

module Producer = struct
  type t = { handle : C.Types.Handle.t }
end
