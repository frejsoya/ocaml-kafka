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

let config_of t : Config.t =
  let config = C.Functions.Conf.conf_of_kafka t.handle in
  { Config.conf = config }

let with_client f =
  make ()
  |> Result.map (fun t ->
         let finally () = destroy t in
         let _res = Fun.protect ~finally (fun () -> f t) in
         ())

let destroy t = C.Functions.Kafka.kafka_destroy t.handle
