open Ctypes

(* This Types_generated module is an instantiation of the Types
   functor defined in the type_description.ml file. It's generated by
   a C program that Dune creates and runs behind the scenes. *)

module Types = Types_generated

module Functions (F : Ctypes.FOREIGN) = struct
  open F

  module Conf = struct
    let conf_new = foreign "rd_kafka_conf_new" (void @-> returning (ptr Types.Conf.t))
    let destroy = foreign "rd_kafka_conf_destroy" (ptr Types.Conf.t @-> returning void)
    let dup = foreign "rd_kafka_conf_dup" (ptr Types.Conf.t @-> returning (ptr Types.Conf.t))

    (* TODO filter *)
    let conf_of_kafka = foreign "rd_kafka_conf" (ptr Types.Handle.t @-> returning (ptr Types.Conf.t))

    (** change conf -> name -> value -> &err -> err_result *)
    let set =
      foreign "rd_kafka_conf_set"
        (ptr Types.Conf.t @-> string @-> string @-> ptr char @-> size_t
       @-> returning Types.Conf.Res.t)

    let get =
      foreign "rd_kafka_conf_get"
        (ptr Types.Conf.t @-> string @-> ptr char @-> ptr size_t @-> returning Types.Conf.Res.t)

    (* TODO
       conf_{get,set,dump}_topic
    *)

    (* Create view of return value to get a sized array from size_t, char**  to array["key","value"] *)
    let dump =
      foreign "rd_kafka_conf_dump" (ptr Types.Conf.t @-> ptr size_t @-> returning (ptr (ptr char)))

    let dump_free = foreign "rd_kafka_conf_dump_free" (ptr (ptr char) @-> size_t @-> returning void)

    (* FIXME, events bitmask set eventsourcing *)
    let set_events = foreign "rd_kafka_conf_set_events" (ptr Types.Conf.t @-> int @-> returning void)

    module View = struct end
    (* TODO
       rd_kakfa_conf_set_background_event_cb --
       rd_kafka_conf_set_consume_cb - set consume callback for use with consumer_poll
       rd_kafka_conf_set_dr_msg_cb  -- delievery report callback for producers
       rd_kafka_conf_set_rebalance_cb -- set kafka rebalance callback
    *)
    (* LOgging set_logger

      *)
  end

  module Logger =
  (* set_log_level
     log_print
     log_syslog
  *)
  struct end

  module Kafka = struct
    let version = foreign "rd_kafka_version" (void @-> returning int)
    let version_str = foreign "rd_kafka_version_str" (void @-> returning string)
    let debug_contexts = foreign "rd_kafka_get_debug_contexts" (void @-> returning string)

    (** [kafka_new] Creates new kafka Creates a new Kafka handle and starts its operation
        
        Arguments:
          -[Kind]  [`RD_KAFKA_CONSUMER | `RD_KAFAK_CONSUMER] the mode of of the client handle.
         - [Config] Optional pointer to conf, defaults are used if [None]
         []
         - []

        [conf is a ]
        *)

    let kafka_new =
      foreign "rd_kafka_new"
        (Types.Handle.Type.t @-> ptr_opt Types.Conf.t @-> ptr char @-> size_t
        @-> returning (ptr_opt Types.Handle.t))

    let kafka_destroy = foreign "rd_kafka_destroy" (ptr Types.Handle.t @-> returning void)
    let name = foreign "rd_kafka_name" (ptr Types.Handle.t @-> returning string)
    let type_ = foreign "rd_kafka_type" (ptr Types.Handle.t @-> returning Types.Handle.Type.t)
    (*
              TOOD:
         rd_kafka_memberid //requires highlevel kafkaconsumer??
         rd_kafka_clusterid //returns the cluster id as reported in metadata
       rd_kafka_controllerid //-----""-----
    *)
  end

  module Topic = struct
    (* legacy api are using errno to propogate error value
       rd_kafka_topic_new
       =>
       use rd_kafka_last_error
    *)
    let new_ =
      foreign "rd_kafka_topic_new"
        (ptr Types.Handle.t @-> string @-> Types.Topic.Config.ptr_t @-> returning
       @@ ptr_opt Types.Topic.t)

    let name = foreign "rd_kafka_topic_name" (ptr Types.Topic.t @-> returning string)
    let destroy = foreign "rd_kafka_topic_destroy" (ptr Types.Topic.t @-> returning void)
    (*
    TODO:
    let 
      *)
  end

  module Metadata = struct
    (*  topic is optional *)
    (* what is optional here?
       FIXME: improve second parameter (all_topics) is actually [zero,nonzero]. non-Zero all topics in cluster. If zero locally known only
       FIXME: metadata ptr is an out param.
    *)
    let get =
      foreign "rd_kafka_metadata"
        (ptr Types.Handle.t @-> int @-> ptr_opt Types.Topic.t
        @-> ptr (ptr Types.Metadata.t)
        @-> int @-> returning Types.RespError.t)

    let destroy = foreign "rd_kafka_metadata_destroy" (ptr Types.Metadata.t @-> returning void)
  end

  module Error = struct
    let descriptions =
      foreign "rd_kafka_get_err_descs"
        (ptr (ptr Types.Error.err_desc) @-> ptr size_t @-> returning void)

    let err2str = foreign "rd_kafka_err2str" (Types.RespError.t @-> returning string)
    let err2name = foreign "rd_kafka_err2name" (Types.RespError.t @-> returning string)
    let destroy = foreign "rd_kafka_error_destroy" (ptr_opt Types.Error.t @-> returning void)

    (**)
    (* error is per thread only for legacy API calls
       topic_new
       consume_start
       consume_stop
        (seee header)
    *)
    let last_error = foreign "rd_kafka_last_error" (void @-> returning Types.RespError.t)
    (* let fatal_error = foreign "rd_kafka_fatal_error" *)
  end

  module Message = struct end

  (* Must not be used with producer *)
  (* let errstr = foreign "rd_kafka_message_errstr" (ptr Types.Message.t @-> returning (ptr_opt char) *)
  let destroy = foreign "rd_kafka_message_destroy" (ptr Types.Message.t @-> returning void)
end
