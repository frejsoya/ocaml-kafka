open Helpers

(*
Client connects to a kafka bokers
*)
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

let get { conf; _ } ~key =
  let open Ctypes in
  let size = 128 in
  let size_out = allocate Ctypes.size_t (Unsigned.Size_t.of_int size) in
  let arr = CArray.make char ~initial:'\x00' size in
  let value_out = CArray.start arr in
  let res = C.Functions.Conf.get conf key value_out size_out in
  match res with
  | `CONF_OK ->
      let length = Unsigned.Size_t.to_int !@size_out in
      let length = length - 1 in
      let ptr = CArray.start arr in
      let str = Ctypes.string_from_ptr ptr ~length in
      Ok str
  | `CONF_INVALID | `CONF_UNKNOWN ->
      Error (Format.sprintf "invalid/unknown setting %s" key)

let set { conf } ~key ~value =
  let errstr, size = allocate_c_string () in
  let res = C.Functions.Conf.set conf key value errstr size in
  match res with
  | `CONF_OK -> Result.ok value
  | `CONF_INVALID | `CONF_UNKNOWN ->
      Error (Ctypes_std_views.string_of_char_ptr errstr)

let to_list t : (string * string) list =
  let init = Unsigned.Size_t.of_int 0 in
  let count = Ctypes.allocate Ctypes.size_t init in
  let dump = C.Functions.Conf.dump t.conf count in
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
  let res = loop 0 [] in
  C.Functions.Conf.dump_free dump Ctypes.(!@count);
  res

let%expect_test "to_assoc_list" =
  let conf = make () in
  let assoc_list =
    to_list conf
    |> List.filter (fun (_k, v) -> not @@ String.starts_with ~prefix:"0x" v)
  in
  let pp = Fmt.(list ~sep:(any "@.") (pair ~sep:(any " = ") string string)) in
  Format.printf "%a@." pp assoc_list;
  [%expect
    {|
    client.dns.lookup = use_all_dns_ips
    sticky.partitioning.linger.ms = 10
    delivery.report.only.error = false
    batch.size = 1000000
    batch.num.messages = 10000
    compression.codec = none
    queue.buffering.backpressure.threshold = 1
    retry.backoff.ms = 100
    message.send.max.retries = 2147483647
    queue.buffering.max.ms = 5
    queue.buffering.max.kbytes = 1048576
    queue.buffering.max.messages = 100000
    enable.gapless.guarantee = false
    enable.idempotence = false
    transaction.timeout.ms = 60000
    client.rack =
    check.crcs = false
    enable.partition.eof = false
    isolation.level = read_committed
    offset.store.method = broker
    fetch.error.backoff.ms = 500
    fetch.min.bytes = 1
    fetch.max.bytes = 52428800
    fetch.message.max.bytes = 1048576
    fetch.queue.backoff.ms = 1000
    fetch.wait.max.ms = 500
    queued.max.messages.kbytes = 65536
    queued.min.messages = 100000
    enable.auto.offset.store = true
    auto.commit.interval.ms = 5000
    enable.auto.commit = true
    max.poll.interval.ms = 300000
    coordinator.query.interval.ms = 600000
    group.protocol.type = consumer
    heartbeat.interval.ms = 3000
    session.timeout.ms = 45000
    partition.assignment.strategy = range,roundrobin
    test.mock.broker.rtt = 0
    test.mock.num.brokers = 0
    sasl.oauthbearer.method = default
    enable_sasl_queue = false
    enable.sasl.oauthbearer.unsecure.jwt = false
    sasl.kerberos.min.time.before.relogin = 60000
    sasl.kerberos.kinit.cmd = kinit -R -t "%{sasl.kerberos.keytab}" -k %{sasl.kerberos.principal} || kinit -t "%{sasl.kerberos.keytab}" -k %{sasl.kerberos.principal}
    sasl.kerberos.principal = kafkaclient
    sasl.kerberos.service.name = kafka
    sasl.mechanisms = GSSAPI
    ssl.endpoint.identification.algorithm = https
    enable.ssl.certificate.verification = true
    ssl.engine.id = dynamic
    ssl.ca.certificate.stores = Root
    security.protocol = plaintext
    allow.auto.create.topics = false
    broker.version.fallback = 0.10.0
    api.version.fallback.ms = 0
    api.version.request.timeout.ms = 10000
    api.version.request = true
    internal.termination.signal = 0
    log.connection.close = true
    enable.random.seed = true
    log.thread.name = true
    log.queue = false
    log_level = 6
    enabled_events = 0
    statistics.interval.ms = 0
    reconnect.backoff.max.ms = 10000
    reconnect.backoff.ms = 100
    reconnect.backoff.jitter.ms = 0
    enable.sparse.connections = true
    connections.max.idle.ms = 0
    socket.connection.setup.timeout.ms = 30000
    broker.address.family = any
    broker.address.ttl = 1000
    socket.max.fails = 1
    socket.nagle.disable = false
    socket.keepalive.enable = false
    socket.receive.buffer.bytes = 0
    socket.send.buffer.bytes = 0
    socket.blocking.max.ms = 1000
    socket.timeout.ms = 60000
    debug =
    topic.metadata.propagation.max.ms = 30000
    topic.metadata.refresh.sparse = true
    topic.metadata.refresh.fast.cnt = 10
    topic.metadata.refresh.fast.interval.ms = 250
    metadata.max.age.ms = 900000
    topic.metadata.refresh.interval.ms = 300000
    metadata.request.timeout.ms = 10
    max.in.flight.requests.per.connection = 1000000
    receive.message.max.bytes = 100000000
    message.copy.max.bytes = 65535
    message.max.bytes = 1000000
    client.software.name = librdkafka
    client.id = rdkafka
    builtin.features = gzip,snappy,ssl,sasl,regex,lz4,sasl_gssapi,sasl_plain,sasl_scram,plugins,zstd,sasl_oauthbearer,http,oidc |}]

let%expect_test "config_test" =
  let res_pp =
    Format.(pp_print_result ~ok:pp_print_string ~error:pp_print_string)
  in
  Format.printf "Setting incorrect existing config value 'foo'\n";
  let conf = make () in
  let res = set conf ~key:"foo" ~value:"bar" in

  Format.printf "conf result: %a\n" res_pp res;
  (* Get test..num.brokers *)
  let key = "test.mock.num.brokers" in
  let res = get conf ~key in
  Format.printf "get %s=%a\n" key res_pp res;

  let res = set conf ~key ~value:"3" in
  Format.printf "set %s <- %a\n" key res_pp res;

  let res = get conf ~key in
  Format.printf "get %s=%a\n" key res_pp res;
  [%expect
    {|
    Setting incorrect existing config value 'foo'
    conf result: No such configuration property: "foo"
    get test.mock.num.brokers=0 
    set test.mock.num.brokers <- 3
    get test.mock.num.brokers=3 |}]
