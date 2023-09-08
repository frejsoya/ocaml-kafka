module Types (T : Ctypes.TYPE) = struct
  open Ctypes
  open T
  module Enums = Type_enum.Enums (T)

  let version = T.(constant "RD_KAFKA_VERSION" int)

  module RespError = struct
    include Enums.Rd_kafka_resp_err_t
  end

  (* *)
  module Conf = struct
    module Res = struct
      include Enums.Rd_kafka_conf_res_t
    end

    type t = [ `rd_kafka_conf_s ] abstract

    let t : t typ =
      typedef
        (T.abstract ~name:"rd_kafka_conf_s" ~size:0 ~alignment:0)
        "rd_kafka_conf_t"
  end

  module Handle = struct
    module Type = struct
      include Enums.Rd_kafka_type_t
    end

    (*FIXME ptr t *)
    type t = [ `rd_kafka_s ] abstract

    let t : t typ =
      typedef (T.abstract ~name:"rd_kafka_s" ~size:0 ~alignment:0) "rd_kafka_t"
  end

  module Admin = struct end

  module Topic = struct
    module Config = struct
      type rd_kafka_topic_conf_s
      type t = rd_kafka_topic_conf_s structure ptr (* rd_kafak_topic_config_s *)

      let ptr_t : t typ =
        ptr
          (typedef (structure "rd_kafka_topic_conf_s") "rd_kafka_topic_conf_t")
    end

    type t = unit ptr

    (* TODO:  fix to opauqe pointer *)
    let t : t typ = typedef (ptr void) "rd_kafka_topic_t"
  end

  module Timestamp = struct
    include Enums.Rd_kafka_timestamp_type_t
  end

  module Error = struct
    type rd_kafka_err_desc
    type err_desc = rd_kafka_err_desc structure

    let err_desc : err_desc typ = structure "rd_kafka_err_desc"
    let code = field err_desc "code" RespError.t
    let name = field err_desc "name" (ptr char)
    let desc = field err_desc "desc" (ptr char)
    let () = seal err_desc

    type t = [ `rd_kafka_error_s ] abstract

    let t : t typ =
      typedef
        (T.abstract ~name:"rd_kafka_error_s" ~size:0 ~alignment:0)
        "rd_kafka_error_t"
  end

  module Message = struct
    type rd_kafka_message_s
    type t = rd_kafka_message_s structure

    let s : t typ = structure "rd_kafka_message_s"

    (** Non-zero for error signaling *)
    let err = field s "err" RespError.t

    (** topic *)
    let topic = field s "rkt" Topic.t

    (** Partition *)
    let partition = field s "partition" int32_t

    (** payload
        Producer: the original message payload
        Consumer:  if err==0 the paload else err_string
        *)
    let payload = field s "payload" (ptr void)

    (** [len] payload or error message length in bytes *)
    let len = field s "len" size_t

    (** [key] err=0 optional message key*)
    let key = field s "len" (ptr void)

    (** [key_len] key length in bytes *)
    let key_len = field s "key_len" size_t

    (** [len] payload or error message length in bytes *)
    let offset = field s "offset" int64_t

    (**[_private]
       Consumer: rdkafka private pointer DO NOT MODIFY
       Producer:
        - dr_msg_cb: msg_opaque from produce call or
                  RD_KAFKA_V_OPAQUE from producev
      *)
    let _private = field s "_private" (ptr void)

    let () = seal s
    let t : t typ = typedef s "rd_kafka_message_t"
  end

  module Metadata = struct
    module Broker = struct
      type kafka_metadata_broker
      type t = kafka_metadata_broker structure

      let s : t typ = structure "rd_kafka_metadata_broker"

      (* TODO *)
      let id = field s "id" int32_t
      let host = field s "host" (ptr char)
      let port = field s "port" int
      let () = seal s
      let t = typedef s "rd_kafka_metadata_broker_t"
    end

    module Partition = struct
      type kafka_medatata_partition
      type t = kafka_medatata_partition structure

      let s : t typ = structure "rd_kafka_metadata_partition"
      let id = field s "id" int32_t
      let err = field s "err" RespError.t
      let leader = field s "leader" int32_t
      let replica_cnt = field s "replica_cnt" int
      let replicas = field s "replicas" int32_t
      let isr_cnt = field s "isr_cnt" int
      let isrs = field s "isrs" int
      let () = seal s
      let t = typedef s "rd_kafka_metadata_partition_t"
    end

    module Topic = struct
      type kafka_metadata_topic
      type t = kafka_metadata_topic structure

      let s : t typ = structure "rd_kafka_metadata_topic"
      let topic = field s "topic" (ptr char)
      let partition_cnt = field s "partition_cnt " int
      let partitions = field s "partitions" (ptr Partition.t)
      let err = field s "err" RespError.t
      let () = seal s
      let t = typedef s "rd_kafka_metadata_topic"
    end

    type kafka_metadata
    type t = kafka_metadata structure

    let s : t typ = structure "rd_kafka_metadata"
    let broker_cnt = field s "broker_cnt" int
    let brokers = field s "brokers" (ptr Broker.t)
    let () = seal s
    let t = typedef s "rd_kafka_metadata_t"
  end

  module Debug = struct end
  module Foo = struct end
  (* TODO *)
  (*     /* @cond NO_DOC */ *)
  (* (* /* Private types to provide ABI compatibility */ *) *)
  (* typedef struct rd_kafka_s rd_kafka_t; *)
  (* typedef struct rd_kafka_topic_s rd_kafka_topic_t; *)
  (* typedef struct rd_kafka_conf_s rd_kafka_conf_t; *)
  (* typedef struct rd_kafka_topic_conf_s rd_kafka_topic_conf_t; *)
  (* typedef struct rd_kafka_queue_s rd_kafka_queue_t; *)
  (* typedef struct rd_kafka_op_s rd_kafka_event_t; *)
  (* typedef struct rd_kafka_topic_result_s rd_kafka_topic_result_t; *)
  (* typedef struct rd_kafka_consumer_group_metadata_s *)
  (*     rd_kafka_consumer_group_metadata_t; *)
  (* typedef struct rd_kafka_error_s rd_kafka_error_t; *)
  (* typedef struct rd_kafka_headers_s rd_kafka_headers_t; *)
  (* typedef struct rd_kafka_group_result_s rd_kafka_group_result_t; *)
  (* typedef struct rd_kafka_acl_result_s rd_kafka_acl_result_t; *)
end
