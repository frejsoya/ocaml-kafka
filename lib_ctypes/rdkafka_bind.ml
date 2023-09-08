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

  let config (t : t) : (string * string) list =
    let config = C.Functions.Conf.conf_of_kafka t.handle in
    let init = Unsigned.Size_t.of_int 0 in
    let count = Ctypes.allocate Ctypes.size_t init in
    let dump = C.Functions.Conf.dump config count in
    let elements = Ctypes.(!@count) |> Unsigned.Size_t.to_int in
    let carr = Ctypes.CArray.from_ptr dump elements in
    let get_string idx =
      Ctypes.CArray.get carr idx |> Ctypes_std_views.string_of_char_ptr
    in
    let rec loop idx acc =
      if idx == elements then acc
      else
        let key = get_string idx in
        let value = get_string (idx + 1) in
        let t = (key, value) in
        loop (idx + 2) (t :: acc)
    in
    loop 0 []

  let with_client f =
    make ()
    |> Result.map (fun t ->
           let finally () = destroy t in
           let _res = Fun.protect ~finally (fun () -> f t) in
           ())

  let destroy t = C.Functions.Kafka.kafka_destroy t.handle
end

module Config = Rdkafka_config

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

module Producer = struct
  type t = { handle : C.Types.Handle.t }
end
