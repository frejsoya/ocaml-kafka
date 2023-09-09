module Enums (T : Ctypes.TYPE) = struct
  open T

  module Rd_kafka_AclOperation_t = struct
    let acl_operation_unknown =
      constant "RD_KAFKA_ACL_OPERATION_UNKNOWN" int64_t

    let acl_operation_any = constant "RD_KAFKA_ACL_OPERATION_ANY" int64_t
    let acl_operation_all = constant "RD_KAFKA_ACL_OPERATION_ALL" int64_t
    let acl_operation_read = constant "RD_KAFKA_ACL_OPERATION_READ" int64_t
    let acl_operation_write = constant "RD_KAFKA_ACL_OPERATION_WRITE" int64_t
    let acl_operation_create = constant "RD_KAFKA_ACL_OPERATION_CREATE" int64_t
    let acl_operation_delete = constant "RD_KAFKA_ACL_OPERATION_DELETE" int64_t
    let acl_operation_alter = constant "RD_KAFKA_ACL_OPERATION_ALTER" int64_t

    let acl_operation_describe =
      constant "RD_KAFKA_ACL_OPERATION_DESCRIBE" int64_t

    let acl_operation_cluster_action =
      constant "RD_KAFKA_ACL_OPERATION_CLUSTER_ACTION" int64_t

    let acl_operation_describe_configs =
      constant "RD_KAFKA_ACL_OPERATION_DESCRIBE_CONFIGS" int64_t

    let acl_operation_alter_configs =
      constant "RD_KAFKA_ACL_OPERATION_ALTER_CONFIGS" int64_t

    let acl_operation_idempotent_write =
      constant "RD_KAFKA_ACL_OPERATION_IDEMPOTENT_WRITE" int64_t

    let acl_operation__cnt = constant "RD_KAFKA_ACL_OPERATION__CNT" int64_t

    type t =
      [ `ACL_OPERATION_UNKNOWN
      | `ACL_OPERATION_ANY
      | `ACL_OPERATION_ALL
      | `ACL_OPERATION_READ
      | `ACL_OPERATION_WRITE
      | `ACL_OPERATION_CREATE
      | `ACL_OPERATION_DELETE
      | `ACL_OPERATION_ALTER
      | `ACL_OPERATION_DESCRIBE
      | `ACL_OPERATION_CLUSTER_ACTION
      | `ACL_OPERATION_DESCRIBE_CONFIGS
      | `ACL_OPERATION_ALTER_CONFIGS
      | `ACL_OPERATION_IDEMPOTENT_WRITE
      | `ACL_OPERATION__CNT ]

    let t : t typ =
      T.enum "rd_kafka_AclOperation_t" ~typedef:true
        [
          (`ACL_OPERATION_UNKNOWN, acl_operation_unknown);
          (`ACL_OPERATION_ANY, acl_operation_any);
          (`ACL_OPERATION_ALL, acl_operation_all);
          (`ACL_OPERATION_READ, acl_operation_read);
          (`ACL_OPERATION_WRITE, acl_operation_write);
          (`ACL_OPERATION_CREATE, acl_operation_create);
          (`ACL_OPERATION_DELETE, acl_operation_delete);
          (`ACL_OPERATION_ALTER, acl_operation_alter);
          (`ACL_OPERATION_DESCRIBE, acl_operation_describe);
          (`ACL_OPERATION_CLUSTER_ACTION, acl_operation_cluster_action);
          (`ACL_OPERATION_DESCRIBE_CONFIGS, acl_operation_describe_configs);
          (`ACL_OPERATION_ALTER_CONFIGS, acl_operation_alter_configs);
          (`ACL_OPERATION_IDEMPOTENT_WRITE, acl_operation_idempotent_write);
          (`ACL_OPERATION__CNT, acl_operation__cnt);
        ]
  end

  module Rd_kafka_AclPermissionType_t = struct
    let acl_permission_type_unknown =
      constant "RD_KAFKA_ACL_PERMISSION_TYPE_UNKNOWN" int64_t

    let acl_permission_type_any =
      constant "RD_KAFKA_ACL_PERMISSION_TYPE_ANY" int64_t

    let acl_permission_type_deny =
      constant "RD_KAFKA_ACL_PERMISSION_TYPE_DENY" int64_t

    let acl_permission_type_allow =
      constant "RD_KAFKA_ACL_PERMISSION_TYPE_ALLOW" int64_t

    let acl_permission_type__cnt =
      constant "RD_KAFKA_ACL_PERMISSION_TYPE__CNT" int64_t

    type t =
      [ `ACL_PERMISSION_TYPE_UNKNOWN
      | `ACL_PERMISSION_TYPE_ANY
      | `ACL_PERMISSION_TYPE_DENY
      | `ACL_PERMISSION_TYPE_ALLOW
      | `ACL_PERMISSION_TYPE__CNT ]

    let t : t typ =
      T.enum "rd_kafka_AclPermissionType_t" ~typedef:true
        [
          (`ACL_PERMISSION_TYPE_UNKNOWN, acl_permission_type_unknown);
          (`ACL_PERMISSION_TYPE_ANY, acl_permission_type_any);
          (`ACL_PERMISSION_TYPE_DENY, acl_permission_type_deny);
          (`ACL_PERMISSION_TYPE_ALLOW, acl_permission_type_allow);
          (`ACL_PERMISSION_TYPE__CNT, acl_permission_type__cnt);
        ]
  end

  module Rd_kafka_AlterConfigOpType_t = struct
    let alter_config_op_type_set =
      constant "RD_KAFKA_ALTER_CONFIG_OP_TYPE_SET" int64_t

    let alter_config_op_type_delete =
      constant "RD_KAFKA_ALTER_CONFIG_OP_TYPE_DELETE" int64_t

    let alter_config_op_type_append =
      constant "RD_KAFKA_ALTER_CONFIG_OP_TYPE_APPEND" int64_t

    let alter_config_op_type_subtract =
      constant "RD_KAFKA_ALTER_CONFIG_OP_TYPE_SUBTRACT" int64_t

    let alter_config_op_type__cnt =
      constant "RD_KAFKA_ALTER_CONFIG_OP_TYPE__CNT" int64_t

    type t =
      [ `ALTER_CONFIG_OP_TYPE_SET
      | `ALTER_CONFIG_OP_TYPE_DELETE
      | `ALTER_CONFIG_OP_TYPE_APPEND
      | `ALTER_CONFIG_OP_TYPE_SUBTRACT
      | `ALTER_CONFIG_OP_TYPE__CNT ]

    let t : t typ =
      T.enum "rd_kafka_AlterConfigOpType_t" ~typedef:true
        [
          (`ALTER_CONFIG_OP_TYPE_SET, alter_config_op_type_set);
          (`ALTER_CONFIG_OP_TYPE_DELETE, alter_config_op_type_delete);
          (`ALTER_CONFIG_OP_TYPE_APPEND, alter_config_op_type_append);
          (`ALTER_CONFIG_OP_TYPE_SUBTRACT, alter_config_op_type_subtract);
          (`ALTER_CONFIG_OP_TYPE__CNT, alter_config_op_type__cnt);
        ]
  end

  module Rd_kafka_ConfigSource_t = struct
    let config_source_unknown_config =
      constant "RD_KAFKA_CONFIG_SOURCE_UNKNOWN_CONFIG" int64_t

    let config_source_dynamic_topic_config =
      constant "RD_KAFKA_CONFIG_SOURCE_DYNAMIC_TOPIC_CONFIG" int64_t

    let config_source_dynamic_broker_config =
      constant "RD_KAFKA_CONFIG_SOURCE_DYNAMIC_BROKER_CONFIG" int64_t

    let config_source_dynamic_default_broker_config =
      constant "RD_KAFKA_CONFIG_SOURCE_DYNAMIC_DEFAULT_BROKER_CONFIG" int64_t

    let config_source_static_broker_config =
      constant "RD_KAFKA_CONFIG_SOURCE_STATIC_BROKER_CONFIG" int64_t

    let config_source_default_config =
      constant "RD_KAFKA_CONFIG_SOURCE_DEFAULT_CONFIG" int64_t

    let config_source__cnt = constant "RD_KAFKA_CONFIG_SOURCE__CNT" int64_t

    type t =
      [ `CONFIG_SOURCE_UNKNOWN_CONFIG
      | `CONFIG_SOURCE_DYNAMIC_TOPIC_CONFIG
      | `CONFIG_SOURCE_DYNAMIC_BROKER_CONFIG
      | `CONFIG_SOURCE_DYNAMIC_DEFAULT_BROKER_CONFIG
      | `CONFIG_SOURCE_STATIC_BROKER_CONFIG
      | `CONFIG_SOURCE_DEFAULT_CONFIG
      | `CONFIG_SOURCE__CNT ]

    let t : t typ =
      T.enum "rd_kafka_ConfigSource_t" ~typedef:true
        [
          (`CONFIG_SOURCE_UNKNOWN_CONFIG, config_source_unknown_config);
          ( `CONFIG_SOURCE_DYNAMIC_TOPIC_CONFIG,
            config_source_dynamic_topic_config );
          ( `CONFIG_SOURCE_DYNAMIC_BROKER_CONFIG,
            config_source_dynamic_broker_config );
          ( `CONFIG_SOURCE_DYNAMIC_DEFAULT_BROKER_CONFIG,
            config_source_dynamic_default_broker_config );
          ( `CONFIG_SOURCE_STATIC_BROKER_CONFIG,
            config_source_static_broker_config );
          (`CONFIG_SOURCE_DEFAULT_CONFIG, config_source_default_config);
          (`CONFIG_SOURCE__CNT, config_source__cnt);
        ]
  end

  module Rd_kafka_ResourcePatternType_t = struct
    let resource_pattern_unknown =
      constant "RD_KAFKA_RESOURCE_PATTERN_UNKNOWN" int64_t

    let resource_pattern_any = constant "RD_KAFKA_RESOURCE_PATTERN_ANY" int64_t

    let resource_pattern_match =
      constant "RD_KAFKA_RESOURCE_PATTERN_MATCH" int64_t

    let resource_pattern_literal =
      constant "RD_KAFKA_RESOURCE_PATTERN_LITERAL" int64_t

    let resource_pattern_prefixed =
      constant "RD_KAFKA_RESOURCE_PATTERN_PREFIXED" int64_t

    let resource_pattern_type__cnt =
      constant "RD_KAFKA_RESOURCE_PATTERN_TYPE__CNT" int64_t

    type t =
      [ `RESOURCE_PATTERN_UNKNOWN
      | `RESOURCE_PATTERN_ANY
      | `RESOURCE_PATTERN_MATCH
      | `RESOURCE_PATTERN_LITERAL
      | `RESOURCE_PATTERN_PREFIXED
      | `RESOURCE_PATTERN_TYPE__CNT ]

    let t : t typ =
      T.enum "rd_kafka_ResourcePatternType_t" ~typedef:true
        [
          (`RESOURCE_PATTERN_UNKNOWN, resource_pattern_unknown);
          (`RESOURCE_PATTERN_ANY, resource_pattern_any);
          (`RESOURCE_PATTERN_MATCH, resource_pattern_match);
          (`RESOURCE_PATTERN_LITERAL, resource_pattern_literal);
          (`RESOURCE_PATTERN_PREFIXED, resource_pattern_prefixed);
          (`RESOURCE_PATTERN_TYPE__CNT, resource_pattern_type__cnt);
        ]
  end

  module Rd_kafka_ResourceType_t = struct
    let resource_unknown = constant "RD_KAFKA_RESOURCE_UNKNOWN" int64_t
    let resource_any = constant "RD_KAFKA_RESOURCE_ANY" int64_t
    let resource_topic = constant "RD_KAFKA_RESOURCE_TOPIC" int64_t
    let resource_group = constant "RD_KAFKA_RESOURCE_GROUP" int64_t
    let resource_broker = constant "RD_KAFKA_RESOURCE_BROKER" int64_t
    let resource__cnt = constant "RD_KAFKA_RESOURCE__CNT" int64_t

    type t =
      [ `RESOURCE_UNKNOWN
      | `RESOURCE_ANY
      | `RESOURCE_TOPIC
      | `RESOURCE_GROUP
      | `RESOURCE_BROKER
      | `RESOURCE__CNT ]

    let t : t typ =
      T.enum "rd_kafka_ResourceType_t" ~typedef:true
        [
          (`RESOURCE_UNKNOWN, resource_unknown);
          (`RESOURCE_ANY, resource_any);
          (`RESOURCE_TOPIC, resource_topic);
          (`RESOURCE_GROUP, resource_group);
          (`RESOURCE_BROKER, resource_broker);
          (`RESOURCE__CNT, resource__cnt);
        ]
  end

  module Rd_kafka_ScramMechanism_t = struct
    let scram_mechanism_unknown =
      constant "RD_KAFKA_SCRAM_MECHANISM_UNKNOWN" int64_t

    let scram_mechanism_sha_256 =
      constant "RD_KAFKA_SCRAM_MECHANISM_SHA_256" int64_t

    let scram_mechanism_sha_512 =
      constant "RD_KAFKA_SCRAM_MECHANISM_SHA_512" int64_t

    let scram_mechanism__cnt = constant "RD_KAFKA_SCRAM_MECHANISM__CNT" int64_t

    type t =
      [ `SCRAM_MECHANISM_UNKNOWN
      | `SCRAM_MECHANISM_SHA_256
      | `SCRAM_MECHANISM_SHA_512
      | `SCRAM_MECHANISM__CNT ]

    let t : t typ =
      T.enum "rd_kafka_ScramMechanism_t" ~typedef:true
        [
          (`SCRAM_MECHANISM_UNKNOWN, scram_mechanism_unknown);
          (`SCRAM_MECHANISM_SHA_256, scram_mechanism_sha_256);
          (`SCRAM_MECHANISM_SHA_512, scram_mechanism_sha_512);
          (`SCRAM_MECHANISM__CNT, scram_mechanism__cnt);
        ]
  end

  module Rd_kafka_admin_op_t = struct
    let admin_op_any = constant "RD_KAFKA_ADMIN_OP_ANY" int64_t

    let admin_op_createtopics =
      constant "RD_KAFKA_ADMIN_OP_CREATETOPICS" int64_t

    let admin_op_deletetopics =
      constant "RD_KAFKA_ADMIN_OP_DELETETOPICS" int64_t

    let admin_op_createpartitions =
      constant "RD_KAFKA_ADMIN_OP_CREATEPARTITIONS" int64_t

    let admin_op_alterconfigs =
      constant "RD_KAFKA_ADMIN_OP_ALTERCONFIGS" int64_t

    let admin_op_describeconfigs =
      constant "RD_KAFKA_ADMIN_OP_DESCRIBECONFIGS" int64_t

    let admin_op_deleterecords =
      constant "RD_KAFKA_ADMIN_OP_DELETERECORDS" int64_t

    let admin_op_deletegroups =
      constant "RD_KAFKA_ADMIN_OP_DELETEGROUPS" int64_t

    let admin_op_deleteconsumergroupoffsets =
      constant "RD_KAFKA_ADMIN_OP_DELETECONSUMERGROUPOFFSETS" int64_t

    let admin_op_createacls = constant "RD_KAFKA_ADMIN_OP_CREATEACLS" int64_t

    let admin_op_describeacls =
      constant "RD_KAFKA_ADMIN_OP_DESCRIBEACLS" int64_t

    let admin_op_deleteacls = constant "RD_KAFKA_ADMIN_OP_DELETEACLS" int64_t

    let admin_op_listconsumergroups =
      constant "RD_KAFKA_ADMIN_OP_LISTCONSUMERGROUPS" int64_t

    let admin_op_describeconsumergroups =
      constant "RD_KAFKA_ADMIN_OP_DESCRIBECONSUMERGROUPS" int64_t

    let admin_op_listconsumergroupoffsets =
      constant "RD_KAFKA_ADMIN_OP_LISTCONSUMERGROUPOFFSETS" int64_t

    let admin_op_alterconsumergroupoffsets =
      constant "RD_KAFKA_ADMIN_OP_ALTERCONSUMERGROUPOFFSETS" int64_t

    let admin_op_incrementalalterconfigs =
      constant "RD_KAFKA_ADMIN_OP_INCREMENTALALTERCONFIGS" int64_t

    let admin_op_describeuserscramcredentials =
      constant "RD_KAFKA_ADMIN_OP_DESCRIBEUSERSCRAMCREDENTIALS" int64_t

    let admin_op_alteruserscramcredentials =
      constant "RD_KAFKA_ADMIN_OP_ALTERUSERSCRAMCREDENTIALS" int64_t

    let admin_op__cnt = constant "RD_KAFKA_ADMIN_OP__CNT" int64_t

    type t =
      [ `ADMIN_OP_ANY
      | `ADMIN_OP_CREATETOPICS
      | `ADMIN_OP_DELETETOPICS
      | `ADMIN_OP_CREATEPARTITIONS
      | `ADMIN_OP_ALTERCONFIGS
      | `ADMIN_OP_DESCRIBECONFIGS
      | `ADMIN_OP_DELETERECORDS
      | `ADMIN_OP_DELETEGROUPS
      | `ADMIN_OP_DELETECONSUMERGROUPOFFSETS
      | `ADMIN_OP_CREATEACLS
      | `ADMIN_OP_DESCRIBEACLS
      | `ADMIN_OP_DELETEACLS
      | `ADMIN_OP_LISTCONSUMERGROUPS
      | `ADMIN_OP_DESCRIBECONSUMERGROUPS
      | `ADMIN_OP_LISTCONSUMERGROUPOFFSETS
      | `ADMIN_OP_ALTERCONSUMERGROUPOFFSETS
      | `ADMIN_OP_INCREMENTALALTERCONFIGS
      | `ADMIN_OP_DESCRIBEUSERSCRAMCREDENTIALS
      | `ADMIN_OP_ALTERUSERSCRAMCREDENTIALS
      | `ADMIN_OP__CNT ]

    let t : t typ =
      T.enum "rd_kafka_admin_op_t" ~typedef:true
        [
          (`ADMIN_OP_ANY, admin_op_any);
          (`ADMIN_OP_CREATETOPICS, admin_op_createtopics);
          (`ADMIN_OP_DELETETOPICS, admin_op_deletetopics);
          (`ADMIN_OP_CREATEPARTITIONS, admin_op_createpartitions);
          (`ADMIN_OP_ALTERCONFIGS, admin_op_alterconfigs);
          (`ADMIN_OP_DESCRIBECONFIGS, admin_op_describeconfigs);
          (`ADMIN_OP_DELETERECORDS, admin_op_deleterecords);
          (`ADMIN_OP_DELETEGROUPS, admin_op_deletegroups);
          ( `ADMIN_OP_DELETECONSUMERGROUPOFFSETS,
            admin_op_deleteconsumergroupoffsets );
          (`ADMIN_OP_CREATEACLS, admin_op_createacls);
          (`ADMIN_OP_DESCRIBEACLS, admin_op_describeacls);
          (`ADMIN_OP_DELETEACLS, admin_op_deleteacls);
          (`ADMIN_OP_LISTCONSUMERGROUPS, admin_op_listconsumergroups);
          (`ADMIN_OP_DESCRIBECONSUMERGROUPS, admin_op_describeconsumergroups);
          (`ADMIN_OP_LISTCONSUMERGROUPOFFSETS, admin_op_listconsumergroupoffsets);
          ( `ADMIN_OP_ALTERCONSUMERGROUPOFFSETS,
            admin_op_alterconsumergroupoffsets );
          (`ADMIN_OP_INCREMENTALALTERCONFIGS, admin_op_incrementalalterconfigs);
          ( `ADMIN_OP_DESCRIBEUSERSCRAMCREDENTIALS,
            admin_op_describeuserscramcredentials );
          ( `ADMIN_OP_ALTERUSERSCRAMCREDENTIALS,
            admin_op_alteruserscramcredentials );
          (`ADMIN_OP__CNT, admin_op__cnt);
        ]
  end

  module Rd_kafka_cert_enc_t = struct
    let cert_enc_pkcs12 = constant "RD_KAFKA_CERT_ENC_PKCS12" int64_t
    let cert_enc_der = constant "RD_KAFKA_CERT_ENC_DER" int64_t
    let cert_enc_pem = constant "RD_KAFKA_CERT_ENC_PEM" int64_t
    let cert_enc__cnt = constant "RD_KAFKA_CERT_ENC__CNT" int64_t

    type t =
      [ `CERT_ENC_PKCS12 | `CERT_ENC_DER | `CERT_ENC_PEM | `CERT_ENC__CNT ]

    let t : t typ =
      T.enum "rd_kafka_cert_enc_t" ~typedef:true
        [
          (`CERT_ENC_PKCS12, cert_enc_pkcs12);
          (`CERT_ENC_DER, cert_enc_der);
          (`CERT_ENC_PEM, cert_enc_pem);
          (`CERT_ENC__CNT, cert_enc__cnt);
        ]
  end

  module Rd_kafka_cert_type_t = struct
    let cert_public_key = constant "RD_KAFKA_CERT_PUBLIC_KEY" int64_t
    let cert_private_key = constant "RD_KAFKA_CERT_PRIVATE_KEY" int64_t
    let cert_ca = constant "RD_KAFKA_CERT_CA" int64_t
    let cert__cnt = constant "RD_KAFKA_CERT__CNT" int64_t

    type t = [ `CERT_PUBLIC_KEY | `CERT_PRIVATE_KEY | `CERT_CA | `CERT__CNT ]

    let t : t typ =
      T.enum "rd_kafka_cert_type_t" ~typedef:true
        [
          (`CERT_PUBLIC_KEY, cert_public_key);
          (`CERT_PRIVATE_KEY, cert_private_key);
          (`CERT_CA, cert_ca);
          (`CERT__CNT, cert__cnt);
        ]
  end

  module Rd_kafka_conf_res_t = struct
    let conf_unknown = constant "RD_KAFKA_CONF_UNKNOWN" int64_t
    let conf_invalid = constant "RD_KAFKA_CONF_INVALID" int64_t
    let conf_ok = constant "RD_KAFKA_CONF_OK" int64_t

    type t = [ `CONF_UNKNOWN | `CONF_INVALID | `CONF_OK ]

    let t : t typ =
      T.enum "rd_kafka_conf_res_t" ~typedef:true
        [
          (`CONF_UNKNOWN, conf_unknown);
          (`CONF_INVALID, conf_invalid);
          (`CONF_OK, conf_ok);
        ]
  end

  module Rd_kafka_consumer_group_state_t = struct
    let consumer_group_state_unknown =
      constant "RD_KAFKA_CONSUMER_GROUP_STATE_UNKNOWN" int64_t

    let consumer_group_state_preparing_rebalance =
      constant "RD_KAFKA_CONSUMER_GROUP_STATE_PREPARING_REBALANCE" int64_t

    let consumer_group_state_completing_rebalance =
      constant "RD_KAFKA_CONSUMER_GROUP_STATE_COMPLETING_REBALANCE" int64_t

    let consumer_group_state_stable =
      constant "RD_KAFKA_CONSUMER_GROUP_STATE_STABLE" int64_t

    let consumer_group_state_dead =
      constant "RD_KAFKA_CONSUMER_GROUP_STATE_DEAD" int64_t

    let consumer_group_state_empty =
      constant "RD_KAFKA_CONSUMER_GROUP_STATE_EMPTY" int64_t

    let consumer_group_state__cnt =
      constant "RD_KAFKA_CONSUMER_GROUP_STATE__CNT" int64_t

    type t =
      [ `CONSUMER_GROUP_STATE_UNKNOWN
      | `CONSUMER_GROUP_STATE_PREPARING_REBALANCE
      | `CONSUMER_GROUP_STATE_COMPLETING_REBALANCE
      | `CONSUMER_GROUP_STATE_STABLE
      | `CONSUMER_GROUP_STATE_DEAD
      | `CONSUMER_GROUP_STATE_EMPTY
      | `CONSUMER_GROUP_STATE__CNT ]

    let t : t typ =
      T.enum "rd_kafka_consumer_group_state_t" ~typedef:true
        [
          (`CONSUMER_GROUP_STATE_UNKNOWN, consumer_group_state_unknown);
          ( `CONSUMER_GROUP_STATE_PREPARING_REBALANCE,
            consumer_group_state_preparing_rebalance );
          ( `CONSUMER_GROUP_STATE_COMPLETING_REBALANCE,
            consumer_group_state_completing_rebalance );
          (`CONSUMER_GROUP_STATE_STABLE, consumer_group_state_stable);
          (`CONSUMER_GROUP_STATE_DEAD, consumer_group_state_dead);
          (`CONSUMER_GROUP_STATE_EMPTY, consumer_group_state_empty);
          (`CONSUMER_GROUP_STATE__CNT, consumer_group_state__cnt);
        ]
  end

  module Rd_kafka_msg_status_t = struct
    let msg_status_not_persisted =
      constant "RD_KAFKA_MSG_STATUS_NOT_PERSISTED" int64_t

    let msg_status_possibly_persisted =
      constant "RD_KAFKA_MSG_STATUS_POSSIBLY_PERSISTED" int64_t

    let msg_status_persisted = constant "RD_KAFKA_MSG_STATUS_PERSISTED" int64_t

    type t =
      [ `MSG_STATUS_NOT_PERSISTED
      | `MSG_STATUS_POSSIBLY_PERSISTED
      | `MSG_STATUS_PERSISTED ]

    let t : t typ =
      T.enum "rd_kafka_msg_status_t" ~typedef:true
        [
          (`MSG_STATUS_NOT_PERSISTED, msg_status_not_persisted);
          (`MSG_STATUS_POSSIBLY_PERSISTED, msg_status_possibly_persisted);
          (`MSG_STATUS_PERSISTED, msg_status_persisted);
        ]
  end

  module Rd_kafka_resp_err_t = struct
    let resp_err__begin = constant "RD_KAFKA_RESP_ERR__BEGIN" int64_t
    let resp_err__bad_msg = constant "RD_KAFKA_RESP_ERR__BAD_MSG" int64_t

    let resp_err__bad_compression =
      constant "RD_KAFKA_RESP_ERR__BAD_COMPRESSION" int64_t

    let resp_err__destroy = constant "RD_KAFKA_RESP_ERR__DESTROY" int64_t
    let resp_err__fail = constant "RD_KAFKA_RESP_ERR__FAIL" int64_t
    let resp_err__transport = constant "RD_KAFKA_RESP_ERR__TRANSPORT" int64_t

    let resp_err__crit_sys_resource =
      constant "RD_KAFKA_RESP_ERR__CRIT_SYS_RESOURCE" int64_t

    let resp_err__resolve = constant "RD_KAFKA_RESP_ERR__RESOLVE" int64_t

    let resp_err__msg_timed_out =
      constant "RD_KAFKA_RESP_ERR__MSG_TIMED_OUT" int64_t

    let resp_err__partition_eof =
      constant "RD_KAFKA_RESP_ERR__PARTITION_EOF" int64_t

    let resp_err__unknown_partition =
      constant "RD_KAFKA_RESP_ERR__UNKNOWN_PARTITION" int64_t

    let resp_err__fs = constant "RD_KAFKA_RESP_ERR__FS" int64_t

    let resp_err__unknown_topic =
      constant "RD_KAFKA_RESP_ERR__UNKNOWN_TOPIC" int64_t

    let resp_err__all_brokers_down =
      constant "RD_KAFKA_RESP_ERR__ALL_BROKERS_DOWN" int64_t

    let resp_err__invalid_arg =
      constant "RD_KAFKA_RESP_ERR__INVALID_ARG" int64_t

    let resp_err__timed_out = constant "RD_KAFKA_RESP_ERR__TIMED_OUT" int64_t
    let resp_err__queue_full = constant "RD_KAFKA_RESP_ERR__QUEUE_FULL" int64_t
    let resp_err__isr_insuff = constant "RD_KAFKA_RESP_ERR__ISR_INSUFF" int64_t

    let resp_err__node_update =
      constant "RD_KAFKA_RESP_ERR__NODE_UPDATE" int64_t

    let resp_err__ssl = constant "RD_KAFKA_RESP_ERR__SSL" int64_t
    let resp_err__wait_coord = constant "RD_KAFKA_RESP_ERR__WAIT_COORD" int64_t

    let resp_err__unknown_group =
      constant "RD_KAFKA_RESP_ERR__UNKNOWN_GROUP" int64_t

    let resp_err__in_progress =
      constant "RD_KAFKA_RESP_ERR__IN_PROGRESS" int64_t

    let resp_err__prev_in_progress =
      constant "RD_KAFKA_RESP_ERR__PREV_IN_PROGRESS" int64_t

    let resp_err__existing_subscription =
      constant "RD_KAFKA_RESP_ERR__EXISTING_SUBSCRIPTION" int64_t

    let resp_err__assign_partitions =
      constant "RD_KAFKA_RESP_ERR__ASSIGN_PARTITIONS" int64_t

    let resp_err__revoke_partitions =
      constant "RD_KAFKA_RESP_ERR__REVOKE_PARTITIONS" int64_t

    let resp_err__conflict = constant "RD_KAFKA_RESP_ERR__CONFLICT" int64_t
    let resp_err__state = constant "RD_KAFKA_RESP_ERR__STATE" int64_t

    let resp_err__unknown_protocol =
      constant "RD_KAFKA_RESP_ERR__UNKNOWN_PROTOCOL" int64_t

    let resp_err__not_implemented =
      constant "RD_KAFKA_RESP_ERR__NOT_IMPLEMENTED" int64_t

    let resp_err__authentication =
      constant "RD_KAFKA_RESP_ERR__AUTHENTICATION" int64_t

    let resp_err__no_offset = constant "RD_KAFKA_RESP_ERR__NO_OFFSET" int64_t
    let resp_err__outdated = constant "RD_KAFKA_RESP_ERR__OUTDATED" int64_t

    let resp_err__timed_out_queue =
      constant "RD_KAFKA_RESP_ERR__TIMED_OUT_QUEUE" int64_t

    let resp_err__unsupported_feature =
      constant "RD_KAFKA_RESP_ERR__UNSUPPORTED_FEATURE" int64_t

    let resp_err__wait_cache = constant "RD_KAFKA_RESP_ERR__WAIT_CACHE" int64_t
    let resp_err__intr = constant "RD_KAFKA_RESP_ERR__INTR" int64_t

    let resp_err__key_serialization =
      constant "RD_KAFKA_RESP_ERR__KEY_SERIALIZATION" int64_t

    let resp_err__value_serialization =
      constant "RD_KAFKA_RESP_ERR__VALUE_SERIALIZATION" int64_t

    let resp_err__key_deserialization =
      constant "RD_KAFKA_RESP_ERR__KEY_DESERIALIZATION" int64_t

    let resp_err__value_deserialization =
      constant "RD_KAFKA_RESP_ERR__VALUE_DESERIALIZATION" int64_t

    let resp_err__partial = constant "RD_KAFKA_RESP_ERR__PARTIAL" int64_t
    let resp_err__read_only = constant "RD_KAFKA_RESP_ERR__READ_ONLY" int64_t
    let resp_err__noent = constant "RD_KAFKA_RESP_ERR__NOENT" int64_t
    let resp_err__underflow = constant "RD_KAFKA_RESP_ERR__UNDERFLOW" int64_t

    let resp_err__invalid_type =
      constant "RD_KAFKA_RESP_ERR__INVALID_TYPE" int64_t

    let resp_err__retry = constant "RD_KAFKA_RESP_ERR__RETRY" int64_t

    let resp_err__purge_queue =
      constant "RD_KAFKA_RESP_ERR__PURGE_QUEUE" int64_t

    let resp_err__purge_inflight =
      constant "RD_KAFKA_RESP_ERR__PURGE_INFLIGHT" int64_t

    let resp_err__fatal = constant "RD_KAFKA_RESP_ERR__FATAL" int64_t

    let resp_err__inconsistent =
      constant "RD_KAFKA_RESP_ERR__INCONSISTENT" int64_t

    let resp_err__gapless_guarantee =
      constant "RD_KAFKA_RESP_ERR__GAPLESS_GUARANTEE" int64_t

    let resp_err__max_poll_exceeded =
      constant "RD_KAFKA_RESP_ERR__MAX_POLL_EXCEEDED" int64_t

    let resp_err__unknown_broker =
      constant "RD_KAFKA_RESP_ERR__UNKNOWN_BROKER" int64_t

    let resp_err__not_configured =
      constant "RD_KAFKA_RESP_ERR__NOT_CONFIGURED" int64_t

    let resp_err__fenced = constant "RD_KAFKA_RESP_ERR__FENCED" int64_t

    let resp_err__application =
      constant "RD_KAFKA_RESP_ERR__APPLICATION" int64_t

    let resp_err__assignment_lost =
      constant "RD_KAFKA_RESP_ERR__ASSIGNMENT_LOST" int64_t

    let resp_err__noop = constant "RD_KAFKA_RESP_ERR__NOOP" int64_t

    let resp_err__auto_offset_reset =
      constant "RD_KAFKA_RESP_ERR__AUTO_OFFSET_RESET" int64_t

    let resp_err__log_truncation =
      constant "RD_KAFKA_RESP_ERR__LOG_TRUNCATION" int64_t

    let resp_err__end = constant "RD_KAFKA_RESP_ERR__END" int64_t
    let resp_err_unknown = constant "RD_KAFKA_RESP_ERR_UNKNOWN" int64_t
    let resp_err_no_error = constant "RD_KAFKA_RESP_ERR_NO_ERROR" int64_t

    let resp_err_offset_out_of_range =
      constant "RD_KAFKA_RESP_ERR_OFFSET_OUT_OF_RANGE" int64_t

    let resp_err_invalid_msg = constant "RD_KAFKA_RESP_ERR_INVALID_MSG" int64_t

    let resp_err_unknown_topic_or_part =
      constant "RD_KAFKA_RESP_ERR_UNKNOWN_TOPIC_OR_PART" int64_t

    let resp_err_invalid_msg_size =
      constant "RD_KAFKA_RESP_ERR_INVALID_MSG_SIZE" int64_t

    let resp_err_leader_not_available =
      constant "RD_KAFKA_RESP_ERR_LEADER_NOT_AVAILABLE" int64_t

    let resp_err_not_leader_for_partition =
      constant "RD_KAFKA_RESP_ERR_NOT_LEADER_FOR_PARTITION" int64_t

    let resp_err_request_timed_out =
      constant "RD_KAFKA_RESP_ERR_REQUEST_TIMED_OUT" int64_t

    let resp_err_broker_not_available =
      constant "RD_KAFKA_RESP_ERR_BROKER_NOT_AVAILABLE" int64_t

    let resp_err_replica_not_available =
      constant "RD_KAFKA_RESP_ERR_REPLICA_NOT_AVAILABLE" int64_t

    let resp_err_msg_size_too_large =
      constant "RD_KAFKA_RESP_ERR_MSG_SIZE_TOO_LARGE" int64_t

    let resp_err_stale_ctrl_epoch =
      constant "RD_KAFKA_RESP_ERR_STALE_CTRL_EPOCH" int64_t

    let resp_err_offset_metadata_too_large =
      constant "RD_KAFKA_RESP_ERR_OFFSET_METADATA_TOO_LARGE" int64_t

    let resp_err_network_exception =
      constant "RD_KAFKA_RESP_ERR_NETWORK_EXCEPTION" int64_t

    let resp_err_coordinator_load_in_progress =
      constant "RD_KAFKA_RESP_ERR_COORDINATOR_LOAD_IN_PROGRESS" int64_t

    let resp_err_coordinator_not_available =
      constant "RD_KAFKA_RESP_ERR_COORDINATOR_NOT_AVAILABLE" int64_t

    let resp_err_not_coordinator =
      constant "RD_KAFKA_RESP_ERR_NOT_COORDINATOR" int64_t

    let resp_err_topic_exception =
      constant "RD_KAFKA_RESP_ERR_TOPIC_EXCEPTION" int64_t

    let resp_err_record_list_too_large =
      constant "RD_KAFKA_RESP_ERR_RECORD_LIST_TOO_LARGE" int64_t

    let resp_err_not_enough_replicas =
      constant "RD_KAFKA_RESP_ERR_NOT_ENOUGH_REPLICAS" int64_t

    let resp_err_not_enough_replicas_after_append =
      constant "RD_KAFKA_RESP_ERR_NOT_ENOUGH_REPLICAS_AFTER_APPEND" int64_t

    let resp_err_invalid_required_acks =
      constant "RD_KAFKA_RESP_ERR_INVALID_REQUIRED_ACKS" int64_t

    let resp_err_illegal_generation =
      constant "RD_KAFKA_RESP_ERR_ILLEGAL_GENERATION" int64_t

    let resp_err_inconsistent_group_protocol =
      constant "RD_KAFKA_RESP_ERR_INCONSISTENT_GROUP_PROTOCOL" int64_t

    let resp_err_invalid_group_id =
      constant "RD_KAFKA_RESP_ERR_INVALID_GROUP_ID" int64_t

    let resp_err_unknown_member_id =
      constant "RD_KAFKA_RESP_ERR_UNKNOWN_MEMBER_ID" int64_t

    let resp_err_invalid_session_timeout =
      constant "RD_KAFKA_RESP_ERR_INVALID_SESSION_TIMEOUT" int64_t

    let resp_err_rebalance_in_progress =
      constant "RD_KAFKA_RESP_ERR_REBALANCE_IN_PROGRESS" int64_t

    let resp_err_invalid_commit_offset_size =
      constant "RD_KAFKA_RESP_ERR_INVALID_COMMIT_OFFSET_SIZE" int64_t

    let resp_err_topic_authorization_failed =
      constant "RD_KAFKA_RESP_ERR_TOPIC_AUTHORIZATION_FAILED" int64_t

    let resp_err_group_authorization_failed =
      constant "RD_KAFKA_RESP_ERR_GROUP_AUTHORIZATION_FAILED" int64_t

    let resp_err_cluster_authorization_failed =
      constant "RD_KAFKA_RESP_ERR_CLUSTER_AUTHORIZATION_FAILED" int64_t

    let resp_err_invalid_timestamp =
      constant "RD_KAFKA_RESP_ERR_INVALID_TIMESTAMP" int64_t

    let resp_err_unsupported_sasl_mechanism =
      constant "RD_KAFKA_RESP_ERR_UNSUPPORTED_SASL_MECHANISM" int64_t

    let resp_err_illegal_sasl_state =
      constant "RD_KAFKA_RESP_ERR_ILLEGAL_SASL_STATE" int64_t

    let resp_err_unsupported_version =
      constant "RD_KAFKA_RESP_ERR_UNSUPPORTED_VERSION" int64_t

    let resp_err_topic_already_exists =
      constant "RD_KAFKA_RESP_ERR_TOPIC_ALREADY_EXISTS" int64_t

    let resp_err_invalid_partitions =
      constant "RD_KAFKA_RESP_ERR_INVALID_PARTITIONS" int64_t

    let resp_err_invalid_replication_factor =
      constant "RD_KAFKA_RESP_ERR_INVALID_REPLICATION_FACTOR" int64_t

    let resp_err_invalid_replica_assignment =
      constant "RD_KAFKA_RESP_ERR_INVALID_REPLICA_ASSIGNMENT" int64_t

    let resp_err_invalid_config =
      constant "RD_KAFKA_RESP_ERR_INVALID_CONFIG" int64_t

    let resp_err_not_controller =
      constant "RD_KAFKA_RESP_ERR_NOT_CONTROLLER" int64_t

    let resp_err_invalid_request =
      constant "RD_KAFKA_RESP_ERR_INVALID_REQUEST" int64_t

    let resp_err_unsupported_for_message_format =
      constant "RD_KAFKA_RESP_ERR_UNSUPPORTED_FOR_MESSAGE_FORMAT" int64_t

    let resp_err_policy_violation =
      constant "RD_KAFKA_RESP_ERR_POLICY_VIOLATION" int64_t

    let resp_err_out_of_order_sequence_number =
      constant "RD_KAFKA_RESP_ERR_OUT_OF_ORDER_SEQUENCE_NUMBER" int64_t

    let resp_err_duplicate_sequence_number =
      constant "RD_KAFKA_RESP_ERR_DUPLICATE_SEQUENCE_NUMBER" int64_t

    let resp_err_invalid_producer_epoch =
      constant "RD_KAFKA_RESP_ERR_INVALID_PRODUCER_EPOCH" int64_t

    let resp_err_invalid_txn_state =
      constant "RD_KAFKA_RESP_ERR_INVALID_TXN_STATE" int64_t

    let resp_err_invalid_producer_id_mapping =
      constant "RD_KAFKA_RESP_ERR_INVALID_PRODUCER_ID_MAPPING" int64_t

    let resp_err_invalid_transaction_timeout =
      constant "RD_KAFKA_RESP_ERR_INVALID_TRANSACTION_TIMEOUT" int64_t

    let resp_err_concurrent_transactions =
      constant "RD_KAFKA_RESP_ERR_CONCURRENT_TRANSACTIONS" int64_t

    let resp_err_transaction_coordinator_fenced =
      constant "RD_KAFKA_RESP_ERR_TRANSACTION_COORDINATOR_FENCED" int64_t

    let resp_err_transactional_id_authorization_failed =
      constant "RD_KAFKA_RESP_ERR_TRANSACTIONAL_ID_AUTHORIZATION_FAILED" int64_t

    let resp_err_security_disabled =
      constant "RD_KAFKA_RESP_ERR_SECURITY_DISABLED" int64_t

    let resp_err_operation_not_attempted =
      constant "RD_KAFKA_RESP_ERR_OPERATION_NOT_ATTEMPTED" int64_t

    let resp_err_kafka_storage_error =
      constant "RD_KAFKA_RESP_ERR_KAFKA_STORAGE_ERROR" int64_t

    let resp_err_log_dir_not_found =
      constant "RD_KAFKA_RESP_ERR_LOG_DIR_NOT_FOUND" int64_t

    let resp_err_sasl_authentication_failed =
      constant "RD_KAFKA_RESP_ERR_SASL_AUTHENTICATION_FAILED" int64_t

    let resp_err_unknown_producer_id =
      constant "RD_KAFKA_RESP_ERR_UNKNOWN_PRODUCER_ID" int64_t

    let resp_err_reassignment_in_progress =
      constant "RD_KAFKA_RESP_ERR_REASSIGNMENT_IN_PROGRESS" int64_t

    let resp_err_delegation_token_auth_disabled =
      constant "RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_AUTH_DISABLED" int64_t

    let resp_err_delegation_token_not_found =
      constant "RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_NOT_FOUND" int64_t

    let resp_err_delegation_token_owner_mismatch =
      constant "RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_OWNER_MISMATCH" int64_t

    let resp_err_delegation_token_request_not_allowed =
      constant "RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_REQUEST_NOT_ALLOWED" int64_t

    let resp_err_delegation_token_authorization_failed =
      constant "RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_AUTHORIZATION_FAILED" int64_t

    let resp_err_delegation_token_expired =
      constant "RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_EXPIRED" int64_t

    let resp_err_invalid_principal_type =
      constant "RD_KAFKA_RESP_ERR_INVALID_PRINCIPAL_TYPE" int64_t

    let resp_err_non_empty_group =
      constant "RD_KAFKA_RESP_ERR_NON_EMPTY_GROUP" int64_t

    let resp_err_group_id_not_found =
      constant "RD_KAFKA_RESP_ERR_GROUP_ID_NOT_FOUND" int64_t

    let resp_err_fetch_session_id_not_found =
      constant "RD_KAFKA_RESP_ERR_FETCH_SESSION_ID_NOT_FOUND" int64_t

    let resp_err_invalid_fetch_session_epoch =
      constant "RD_KAFKA_RESP_ERR_INVALID_FETCH_SESSION_EPOCH" int64_t

    let resp_err_listener_not_found =
      constant "RD_KAFKA_RESP_ERR_LISTENER_NOT_FOUND" int64_t

    let resp_err_topic_deletion_disabled =
      constant "RD_KAFKA_RESP_ERR_TOPIC_DELETION_DISABLED" int64_t

    let resp_err_fenced_leader_epoch =
      constant "RD_KAFKA_RESP_ERR_FENCED_LEADER_EPOCH" int64_t

    let resp_err_unknown_leader_epoch =
      constant "RD_KAFKA_RESP_ERR_UNKNOWN_LEADER_EPOCH" int64_t

    let resp_err_unsupported_compression_type =
      constant "RD_KAFKA_RESP_ERR_UNSUPPORTED_COMPRESSION_TYPE" int64_t

    let resp_err_stale_broker_epoch =
      constant "RD_KAFKA_RESP_ERR_STALE_BROKER_EPOCH" int64_t

    let resp_err_offset_not_available =
      constant "RD_KAFKA_RESP_ERR_OFFSET_NOT_AVAILABLE" int64_t

    let resp_err_member_id_required =
      constant "RD_KAFKA_RESP_ERR_MEMBER_ID_REQUIRED" int64_t

    let resp_err_preferred_leader_not_available =
      constant "RD_KAFKA_RESP_ERR_PREFERRED_LEADER_NOT_AVAILABLE" int64_t

    let resp_err_group_max_size_reached =
      constant "RD_KAFKA_RESP_ERR_GROUP_MAX_SIZE_REACHED" int64_t

    let resp_err_fenced_instance_id =
      constant "RD_KAFKA_RESP_ERR_FENCED_INSTANCE_ID" int64_t

    let resp_err_eligible_leaders_not_available =
      constant "RD_KAFKA_RESP_ERR_ELIGIBLE_LEADERS_NOT_AVAILABLE" int64_t

    let resp_err_election_not_needed =
      constant "RD_KAFKA_RESP_ERR_ELECTION_NOT_NEEDED" int64_t

    let resp_err_no_reassignment_in_progress =
      constant "RD_KAFKA_RESP_ERR_NO_REASSIGNMENT_IN_PROGRESS" int64_t

    let resp_err_group_subscribed_to_topic =
      constant "RD_KAFKA_RESP_ERR_GROUP_SUBSCRIBED_TO_TOPIC" int64_t

    let resp_err_invalid_record =
      constant "RD_KAFKA_RESP_ERR_INVALID_RECORD" int64_t

    let resp_err_unstable_offset_commit =
      constant "RD_KAFKA_RESP_ERR_UNSTABLE_OFFSET_COMMIT" int64_t

    let resp_err_throttling_quota_exceeded =
      constant "RD_KAFKA_RESP_ERR_THROTTLING_QUOTA_EXCEEDED" int64_t

    let resp_err_producer_fenced =
      constant "RD_KAFKA_RESP_ERR_PRODUCER_FENCED" int64_t

    let resp_err_resource_not_found =
      constant "RD_KAFKA_RESP_ERR_RESOURCE_NOT_FOUND" int64_t

    let resp_err_duplicate_resource =
      constant "RD_KAFKA_RESP_ERR_DUPLICATE_RESOURCE" int64_t

    let resp_err_unacceptable_credential =
      constant "RD_KAFKA_RESP_ERR_UNACCEPTABLE_CREDENTIAL" int64_t

    let resp_err_inconsistent_voter_set =
      constant "RD_KAFKA_RESP_ERR_INCONSISTENT_VOTER_SET" int64_t

    let resp_err_invalid_update_version =
      constant "RD_KAFKA_RESP_ERR_INVALID_UPDATE_VERSION" int64_t

    let resp_err_feature_update_failed =
      constant "RD_KAFKA_RESP_ERR_FEATURE_UPDATE_FAILED" int64_t

    let resp_err_principal_deserialization_failure =
      constant "RD_KAFKA_RESP_ERR_PRINCIPAL_DESERIALIZATION_FAILURE" int64_t

    let resp_err_end_all = constant "RD_KAFKA_RESP_ERR_END_ALL" int64_t

    type t =
      [ `RESP_ERR__BEGIN
      | `RESP_ERR__BAD_MSG
      | `RESP_ERR__BAD_COMPRESSION
      | `RESP_ERR__DESTROY
      | `RESP_ERR__FAIL
      | `RESP_ERR__TRANSPORT
      | `RESP_ERR__CRIT_SYS_RESOURCE
      | `RESP_ERR__RESOLVE
      | `RESP_ERR__MSG_TIMED_OUT
      | `RESP_ERR__PARTITION_EOF
      | `RESP_ERR__UNKNOWN_PARTITION
      | `RESP_ERR__FS
      | `RESP_ERR__UNKNOWN_TOPIC
      | `RESP_ERR__ALL_BROKERS_DOWN
      | `RESP_ERR__INVALID_ARG
      | `RESP_ERR__TIMED_OUT
      | `RESP_ERR__QUEUE_FULL
      | `RESP_ERR__ISR_INSUFF
      | `RESP_ERR__NODE_UPDATE
      | `RESP_ERR__SSL
      | `RESP_ERR__WAIT_COORD
      | `RESP_ERR__UNKNOWN_GROUP
      | `RESP_ERR__IN_PROGRESS
      | `RESP_ERR__PREV_IN_PROGRESS
      | `RESP_ERR__EXISTING_SUBSCRIPTION
      | `RESP_ERR__ASSIGN_PARTITIONS
      | `RESP_ERR__REVOKE_PARTITIONS
      | `RESP_ERR__CONFLICT
      | `RESP_ERR__STATE
      | `RESP_ERR__UNKNOWN_PROTOCOL
      | `RESP_ERR__NOT_IMPLEMENTED
      | `RESP_ERR__AUTHENTICATION
      | `RESP_ERR__NO_OFFSET
      | `RESP_ERR__OUTDATED
      | `RESP_ERR__TIMED_OUT_QUEUE
      | `RESP_ERR__UNSUPPORTED_FEATURE
      | `RESP_ERR__WAIT_CACHE
      | `RESP_ERR__INTR
      | `RESP_ERR__KEY_SERIALIZATION
      | `RESP_ERR__VALUE_SERIALIZATION
      | `RESP_ERR__KEY_DESERIALIZATION
      | `RESP_ERR__VALUE_DESERIALIZATION
      | `RESP_ERR__PARTIAL
      | `RESP_ERR__READ_ONLY
      | `RESP_ERR__NOENT
      | `RESP_ERR__UNDERFLOW
      | `RESP_ERR__INVALID_TYPE
      | `RESP_ERR__RETRY
      | `RESP_ERR__PURGE_QUEUE
      | `RESP_ERR__PURGE_INFLIGHT
      | `RESP_ERR__FATAL
      | `RESP_ERR__INCONSISTENT
      | `RESP_ERR__GAPLESS_GUARANTEE
      | `RESP_ERR__MAX_POLL_EXCEEDED
      | `RESP_ERR__UNKNOWN_BROKER
      | `RESP_ERR__NOT_CONFIGURED
      | `RESP_ERR__FENCED
      | `RESP_ERR__APPLICATION
      | `RESP_ERR__ASSIGNMENT_LOST
      | `RESP_ERR__NOOP
      | `RESP_ERR__AUTO_OFFSET_RESET
      | `RESP_ERR__LOG_TRUNCATION
      | `RESP_ERR__END
      | `RESP_ERR_UNKNOWN
      | `RESP_ERR_NO_ERROR
      | `RESP_ERR_OFFSET_OUT_OF_RANGE
      | `RESP_ERR_INVALID_MSG
      | `RESP_ERR_UNKNOWN_TOPIC_OR_PART
      | `RESP_ERR_INVALID_MSG_SIZE
      | `RESP_ERR_LEADER_NOT_AVAILABLE
      | `RESP_ERR_NOT_LEADER_FOR_PARTITION
      | `RESP_ERR_REQUEST_TIMED_OUT
      | `RESP_ERR_BROKER_NOT_AVAILABLE
      | `RESP_ERR_REPLICA_NOT_AVAILABLE
      | `RESP_ERR_MSG_SIZE_TOO_LARGE
      | `RESP_ERR_STALE_CTRL_EPOCH
      | `RESP_ERR_OFFSET_METADATA_TOO_LARGE
      | `RESP_ERR_NETWORK_EXCEPTION
      | `RESP_ERR_COORDINATOR_LOAD_IN_PROGRESS
      | `RESP_ERR_COORDINATOR_NOT_AVAILABLE
      | `RESP_ERR_NOT_COORDINATOR
      | `RESP_ERR_TOPIC_EXCEPTION
      | `RESP_ERR_RECORD_LIST_TOO_LARGE
      | `RESP_ERR_NOT_ENOUGH_REPLICAS
      | `RESP_ERR_NOT_ENOUGH_REPLICAS_AFTER_APPEND
      | `RESP_ERR_INVALID_REQUIRED_ACKS
      | `RESP_ERR_ILLEGAL_GENERATION
      | `RESP_ERR_INCONSISTENT_GROUP_PROTOCOL
      | `RESP_ERR_INVALID_GROUP_ID
      | `RESP_ERR_UNKNOWN_MEMBER_ID
      | `RESP_ERR_INVALID_SESSION_TIMEOUT
      | `RESP_ERR_REBALANCE_IN_PROGRESS
      | `RESP_ERR_INVALID_COMMIT_OFFSET_SIZE
      | `RESP_ERR_TOPIC_AUTHORIZATION_FAILED
      | `RESP_ERR_GROUP_AUTHORIZATION_FAILED
      | `RESP_ERR_CLUSTER_AUTHORIZATION_FAILED
      | `RESP_ERR_INVALID_TIMESTAMP
      | `RESP_ERR_UNSUPPORTED_SASL_MECHANISM
      | `RESP_ERR_ILLEGAL_SASL_STATE
      | `RESP_ERR_UNSUPPORTED_VERSION
      | `RESP_ERR_TOPIC_ALREADY_EXISTS
      | `RESP_ERR_INVALID_PARTITIONS
      | `RESP_ERR_INVALID_REPLICATION_FACTOR
      | `RESP_ERR_INVALID_REPLICA_ASSIGNMENT
      | `RESP_ERR_INVALID_CONFIG
      | `RESP_ERR_NOT_CONTROLLER
      | `RESP_ERR_INVALID_REQUEST
      | `RESP_ERR_UNSUPPORTED_FOR_MESSAGE_FORMAT
      | `RESP_ERR_POLICY_VIOLATION
      | `RESP_ERR_OUT_OF_ORDER_SEQUENCE_NUMBER
      | `RESP_ERR_DUPLICATE_SEQUENCE_NUMBER
      | `RESP_ERR_INVALID_PRODUCER_EPOCH
      | `RESP_ERR_INVALID_TXN_STATE
      | `RESP_ERR_INVALID_PRODUCER_ID_MAPPING
      | `RESP_ERR_INVALID_TRANSACTION_TIMEOUT
      | `RESP_ERR_CONCURRENT_TRANSACTIONS
      | `RESP_ERR_TRANSACTION_COORDINATOR_FENCED
      | `RESP_ERR_TRANSACTIONAL_ID_AUTHORIZATION_FAILED
      | `RESP_ERR_SECURITY_DISABLED
      | `RESP_ERR_OPERATION_NOT_ATTEMPTED
      | `RESP_ERR_KAFKA_STORAGE_ERROR
      | `RESP_ERR_LOG_DIR_NOT_FOUND
      | `RESP_ERR_SASL_AUTHENTICATION_FAILED
      | `RESP_ERR_UNKNOWN_PRODUCER_ID
      | `RESP_ERR_REASSIGNMENT_IN_PROGRESS
      | `RESP_ERR_DELEGATION_TOKEN_AUTH_DISABLED
      | `RESP_ERR_DELEGATION_TOKEN_NOT_FOUND
      | `RESP_ERR_DELEGATION_TOKEN_OWNER_MISMATCH
      | `RESP_ERR_DELEGATION_TOKEN_REQUEST_NOT_ALLOWED
      | `RESP_ERR_DELEGATION_TOKEN_AUTHORIZATION_FAILED
      | `RESP_ERR_DELEGATION_TOKEN_EXPIRED
      | `RESP_ERR_INVALID_PRINCIPAL_TYPE
      | `RESP_ERR_NON_EMPTY_GROUP
      | `RESP_ERR_GROUP_ID_NOT_FOUND
      | `RESP_ERR_FETCH_SESSION_ID_NOT_FOUND
      | `RESP_ERR_INVALID_FETCH_SESSION_EPOCH
      | `RESP_ERR_LISTENER_NOT_FOUND
      | `RESP_ERR_TOPIC_DELETION_DISABLED
      | `RESP_ERR_FENCED_LEADER_EPOCH
      | `RESP_ERR_UNKNOWN_LEADER_EPOCH
      | `RESP_ERR_UNSUPPORTED_COMPRESSION_TYPE
      | `RESP_ERR_STALE_BROKER_EPOCH
      | `RESP_ERR_OFFSET_NOT_AVAILABLE
      | `RESP_ERR_MEMBER_ID_REQUIRED
      | `RESP_ERR_PREFERRED_LEADER_NOT_AVAILABLE
      | `RESP_ERR_GROUP_MAX_SIZE_REACHED
      | `RESP_ERR_FENCED_INSTANCE_ID
      | `RESP_ERR_ELIGIBLE_LEADERS_NOT_AVAILABLE
      | `RESP_ERR_ELECTION_NOT_NEEDED
      | `RESP_ERR_NO_REASSIGNMENT_IN_PROGRESS
      | `RESP_ERR_GROUP_SUBSCRIBED_TO_TOPIC
      | `RESP_ERR_INVALID_RECORD
      | `RESP_ERR_UNSTABLE_OFFSET_COMMIT
      | `RESP_ERR_THROTTLING_QUOTA_EXCEEDED
      | `RESP_ERR_PRODUCER_FENCED
      | `RESP_ERR_RESOURCE_NOT_FOUND
      | `RESP_ERR_DUPLICATE_RESOURCE
      | `RESP_ERR_UNACCEPTABLE_CREDENTIAL
      | `RESP_ERR_INCONSISTENT_VOTER_SET
      | `RESP_ERR_INVALID_UPDATE_VERSION
      | `RESP_ERR_FEATURE_UPDATE_FAILED
      | `RESP_ERR_PRINCIPAL_DESERIALIZATION_FAILURE
      | `RESP_ERR_END_ALL ]

    let t : t typ =
      T.enum "rd_kafka_resp_err_t" ~typedef:true
        [
          (`RESP_ERR__BEGIN, resp_err__begin);
          (`RESP_ERR__BAD_MSG, resp_err__bad_msg);
          (`RESP_ERR__BAD_COMPRESSION, resp_err__bad_compression);
          (`RESP_ERR__DESTROY, resp_err__destroy);
          (`RESP_ERR__FAIL, resp_err__fail);
          (`RESP_ERR__TRANSPORT, resp_err__transport);
          (`RESP_ERR__CRIT_SYS_RESOURCE, resp_err__crit_sys_resource);
          (`RESP_ERR__RESOLVE, resp_err__resolve);
          (`RESP_ERR__MSG_TIMED_OUT, resp_err__msg_timed_out);
          (`RESP_ERR__PARTITION_EOF, resp_err__partition_eof);
          (`RESP_ERR__UNKNOWN_PARTITION, resp_err__unknown_partition);
          (`RESP_ERR__FS, resp_err__fs);
          (`RESP_ERR__UNKNOWN_TOPIC, resp_err__unknown_topic);
          (`RESP_ERR__ALL_BROKERS_DOWN, resp_err__all_brokers_down);
          (`RESP_ERR__INVALID_ARG, resp_err__invalid_arg);
          (`RESP_ERR__TIMED_OUT, resp_err__timed_out);
          (`RESP_ERR__QUEUE_FULL, resp_err__queue_full);
          (`RESP_ERR__ISR_INSUFF, resp_err__isr_insuff);
          (`RESP_ERR__NODE_UPDATE, resp_err__node_update);
          (`RESP_ERR__SSL, resp_err__ssl);
          (`RESP_ERR__WAIT_COORD, resp_err__wait_coord);
          (`RESP_ERR__UNKNOWN_GROUP, resp_err__unknown_group);
          (`RESP_ERR__IN_PROGRESS, resp_err__in_progress);
          (`RESP_ERR__PREV_IN_PROGRESS, resp_err__prev_in_progress);
          (`RESP_ERR__EXISTING_SUBSCRIPTION, resp_err__existing_subscription);
          (`RESP_ERR__ASSIGN_PARTITIONS, resp_err__assign_partitions);
          (`RESP_ERR__REVOKE_PARTITIONS, resp_err__revoke_partitions);
          (`RESP_ERR__CONFLICT, resp_err__conflict);
          (`RESP_ERR__STATE, resp_err__state);
          (`RESP_ERR__UNKNOWN_PROTOCOL, resp_err__unknown_protocol);
          (`RESP_ERR__NOT_IMPLEMENTED, resp_err__not_implemented);
          (`RESP_ERR__AUTHENTICATION, resp_err__authentication);
          (`RESP_ERR__NO_OFFSET, resp_err__no_offset);
          (`RESP_ERR__OUTDATED, resp_err__outdated);
          (`RESP_ERR__TIMED_OUT_QUEUE, resp_err__timed_out_queue);
          (`RESP_ERR__UNSUPPORTED_FEATURE, resp_err__unsupported_feature);
          (`RESP_ERR__WAIT_CACHE, resp_err__wait_cache);
          (`RESP_ERR__INTR, resp_err__intr);
          (`RESP_ERR__KEY_SERIALIZATION, resp_err__key_serialization);
          (`RESP_ERR__VALUE_SERIALIZATION, resp_err__value_serialization);
          (`RESP_ERR__KEY_DESERIALIZATION, resp_err__key_deserialization);
          (`RESP_ERR__VALUE_DESERIALIZATION, resp_err__value_deserialization);
          (`RESP_ERR__PARTIAL, resp_err__partial);
          (`RESP_ERR__READ_ONLY, resp_err__read_only);
          (`RESP_ERR__NOENT, resp_err__noent);
          (`RESP_ERR__UNDERFLOW, resp_err__underflow);
          (`RESP_ERR__INVALID_TYPE, resp_err__invalid_type);
          (`RESP_ERR__RETRY, resp_err__retry);
          (`RESP_ERR__PURGE_QUEUE, resp_err__purge_queue);
          (`RESP_ERR__PURGE_INFLIGHT, resp_err__purge_inflight);
          (`RESP_ERR__FATAL, resp_err__fatal);
          (`RESP_ERR__INCONSISTENT, resp_err__inconsistent);
          (`RESP_ERR__GAPLESS_GUARANTEE, resp_err__gapless_guarantee);
          (`RESP_ERR__MAX_POLL_EXCEEDED, resp_err__max_poll_exceeded);
          (`RESP_ERR__UNKNOWN_BROKER, resp_err__unknown_broker);
          (`RESP_ERR__NOT_CONFIGURED, resp_err__not_configured);
          (`RESP_ERR__FENCED, resp_err__fenced);
          (`RESP_ERR__APPLICATION, resp_err__application);
          (`RESP_ERR__ASSIGNMENT_LOST, resp_err__assignment_lost);
          (`RESP_ERR__NOOP, resp_err__noop);
          (`RESP_ERR__AUTO_OFFSET_RESET, resp_err__auto_offset_reset);
          (`RESP_ERR__LOG_TRUNCATION, resp_err__log_truncation);
          (`RESP_ERR__END, resp_err__end);
          (`RESP_ERR_UNKNOWN, resp_err_unknown);
          (`RESP_ERR_NO_ERROR, resp_err_no_error);
          (`RESP_ERR_OFFSET_OUT_OF_RANGE, resp_err_offset_out_of_range);
          (`RESP_ERR_INVALID_MSG, resp_err_invalid_msg);
          (`RESP_ERR_UNKNOWN_TOPIC_OR_PART, resp_err_unknown_topic_or_part);
          (`RESP_ERR_INVALID_MSG_SIZE, resp_err_invalid_msg_size);
          (`RESP_ERR_LEADER_NOT_AVAILABLE, resp_err_leader_not_available);
          (`RESP_ERR_NOT_LEADER_FOR_PARTITION, resp_err_not_leader_for_partition);
          (`RESP_ERR_REQUEST_TIMED_OUT, resp_err_request_timed_out);
          (`RESP_ERR_BROKER_NOT_AVAILABLE, resp_err_broker_not_available);
          (`RESP_ERR_REPLICA_NOT_AVAILABLE, resp_err_replica_not_available);
          (`RESP_ERR_MSG_SIZE_TOO_LARGE, resp_err_msg_size_too_large);
          (`RESP_ERR_STALE_CTRL_EPOCH, resp_err_stale_ctrl_epoch);
          ( `RESP_ERR_OFFSET_METADATA_TOO_LARGE,
            resp_err_offset_metadata_too_large );
          (`RESP_ERR_NETWORK_EXCEPTION, resp_err_network_exception);
          ( `RESP_ERR_COORDINATOR_LOAD_IN_PROGRESS,
            resp_err_coordinator_load_in_progress );
          ( `RESP_ERR_COORDINATOR_NOT_AVAILABLE,
            resp_err_coordinator_not_available );
          (`RESP_ERR_NOT_COORDINATOR, resp_err_not_coordinator);
          (`RESP_ERR_TOPIC_EXCEPTION, resp_err_topic_exception);
          (`RESP_ERR_RECORD_LIST_TOO_LARGE, resp_err_record_list_too_large);
          (`RESP_ERR_NOT_ENOUGH_REPLICAS, resp_err_not_enough_replicas);
          ( `RESP_ERR_NOT_ENOUGH_REPLICAS_AFTER_APPEND,
            resp_err_not_enough_replicas_after_append );
          (`RESP_ERR_INVALID_REQUIRED_ACKS, resp_err_invalid_required_acks);
          (`RESP_ERR_ILLEGAL_GENERATION, resp_err_illegal_generation);
          ( `RESP_ERR_INCONSISTENT_GROUP_PROTOCOL,
            resp_err_inconsistent_group_protocol );
          (`RESP_ERR_INVALID_GROUP_ID, resp_err_invalid_group_id);
          (`RESP_ERR_UNKNOWN_MEMBER_ID, resp_err_unknown_member_id);
          (`RESP_ERR_INVALID_SESSION_TIMEOUT, resp_err_invalid_session_timeout);
          (`RESP_ERR_REBALANCE_IN_PROGRESS, resp_err_rebalance_in_progress);
          ( `RESP_ERR_INVALID_COMMIT_OFFSET_SIZE,
            resp_err_invalid_commit_offset_size );
          ( `RESP_ERR_TOPIC_AUTHORIZATION_FAILED,
            resp_err_topic_authorization_failed );
          ( `RESP_ERR_GROUP_AUTHORIZATION_FAILED,
            resp_err_group_authorization_failed );
          ( `RESP_ERR_CLUSTER_AUTHORIZATION_FAILED,
            resp_err_cluster_authorization_failed );
          (`RESP_ERR_INVALID_TIMESTAMP, resp_err_invalid_timestamp);
          ( `RESP_ERR_UNSUPPORTED_SASL_MECHANISM,
            resp_err_unsupported_sasl_mechanism );
          (`RESP_ERR_ILLEGAL_SASL_STATE, resp_err_illegal_sasl_state);
          (`RESP_ERR_UNSUPPORTED_VERSION, resp_err_unsupported_version);
          (`RESP_ERR_TOPIC_ALREADY_EXISTS, resp_err_topic_already_exists);
          (`RESP_ERR_INVALID_PARTITIONS, resp_err_invalid_partitions);
          ( `RESP_ERR_INVALID_REPLICATION_FACTOR,
            resp_err_invalid_replication_factor );
          ( `RESP_ERR_INVALID_REPLICA_ASSIGNMENT,
            resp_err_invalid_replica_assignment );
          (`RESP_ERR_INVALID_CONFIG, resp_err_invalid_config);
          (`RESP_ERR_NOT_CONTROLLER, resp_err_not_controller);
          (`RESP_ERR_INVALID_REQUEST, resp_err_invalid_request);
          ( `RESP_ERR_UNSUPPORTED_FOR_MESSAGE_FORMAT,
            resp_err_unsupported_for_message_format );
          (`RESP_ERR_POLICY_VIOLATION, resp_err_policy_violation);
          ( `RESP_ERR_OUT_OF_ORDER_SEQUENCE_NUMBER,
            resp_err_out_of_order_sequence_number );
          ( `RESP_ERR_DUPLICATE_SEQUENCE_NUMBER,
            resp_err_duplicate_sequence_number );
          (`RESP_ERR_INVALID_PRODUCER_EPOCH, resp_err_invalid_producer_epoch);
          (`RESP_ERR_INVALID_TXN_STATE, resp_err_invalid_txn_state);
          ( `RESP_ERR_INVALID_PRODUCER_ID_MAPPING,
            resp_err_invalid_producer_id_mapping );
          ( `RESP_ERR_INVALID_TRANSACTION_TIMEOUT,
            resp_err_invalid_transaction_timeout );
          (`RESP_ERR_CONCURRENT_TRANSACTIONS, resp_err_concurrent_transactions);
          ( `RESP_ERR_TRANSACTION_COORDINATOR_FENCED,
            resp_err_transaction_coordinator_fenced );
          ( `RESP_ERR_TRANSACTIONAL_ID_AUTHORIZATION_FAILED,
            resp_err_transactional_id_authorization_failed );
          (`RESP_ERR_SECURITY_DISABLED, resp_err_security_disabled);
          (`RESP_ERR_OPERATION_NOT_ATTEMPTED, resp_err_operation_not_attempted);
          (`RESP_ERR_KAFKA_STORAGE_ERROR, resp_err_kafka_storage_error);
          (`RESP_ERR_LOG_DIR_NOT_FOUND, resp_err_log_dir_not_found);
          ( `RESP_ERR_SASL_AUTHENTICATION_FAILED,
            resp_err_sasl_authentication_failed );
          (`RESP_ERR_UNKNOWN_PRODUCER_ID, resp_err_unknown_producer_id);
          (`RESP_ERR_REASSIGNMENT_IN_PROGRESS, resp_err_reassignment_in_progress);
          ( `RESP_ERR_DELEGATION_TOKEN_AUTH_DISABLED,
            resp_err_delegation_token_auth_disabled );
          ( `RESP_ERR_DELEGATION_TOKEN_NOT_FOUND,
            resp_err_delegation_token_not_found );
          ( `RESP_ERR_DELEGATION_TOKEN_OWNER_MISMATCH,
            resp_err_delegation_token_owner_mismatch );
          ( `RESP_ERR_DELEGATION_TOKEN_REQUEST_NOT_ALLOWED,
            resp_err_delegation_token_request_not_allowed );
          ( `RESP_ERR_DELEGATION_TOKEN_AUTHORIZATION_FAILED,
            resp_err_delegation_token_authorization_failed );
          (`RESP_ERR_DELEGATION_TOKEN_EXPIRED, resp_err_delegation_token_expired);
          (`RESP_ERR_INVALID_PRINCIPAL_TYPE, resp_err_invalid_principal_type);
          (`RESP_ERR_NON_EMPTY_GROUP, resp_err_non_empty_group);
          (`RESP_ERR_GROUP_ID_NOT_FOUND, resp_err_group_id_not_found);
          ( `RESP_ERR_FETCH_SESSION_ID_NOT_FOUND,
            resp_err_fetch_session_id_not_found );
          ( `RESP_ERR_INVALID_FETCH_SESSION_EPOCH,
            resp_err_invalid_fetch_session_epoch );
          (`RESP_ERR_LISTENER_NOT_FOUND, resp_err_listener_not_found);
          (`RESP_ERR_TOPIC_DELETION_DISABLED, resp_err_topic_deletion_disabled);
          (`RESP_ERR_FENCED_LEADER_EPOCH, resp_err_fenced_leader_epoch);
          (`RESP_ERR_UNKNOWN_LEADER_EPOCH, resp_err_unknown_leader_epoch);
          ( `RESP_ERR_UNSUPPORTED_COMPRESSION_TYPE,
            resp_err_unsupported_compression_type );
          (`RESP_ERR_STALE_BROKER_EPOCH, resp_err_stale_broker_epoch);
          (`RESP_ERR_OFFSET_NOT_AVAILABLE, resp_err_offset_not_available);
          (`RESP_ERR_MEMBER_ID_REQUIRED, resp_err_member_id_required);
          ( `RESP_ERR_PREFERRED_LEADER_NOT_AVAILABLE,
            resp_err_preferred_leader_not_available );
          (`RESP_ERR_GROUP_MAX_SIZE_REACHED, resp_err_group_max_size_reached);
          (`RESP_ERR_FENCED_INSTANCE_ID, resp_err_fenced_instance_id);
          ( `RESP_ERR_ELIGIBLE_LEADERS_NOT_AVAILABLE,
            resp_err_eligible_leaders_not_available );
          (`RESP_ERR_ELECTION_NOT_NEEDED, resp_err_election_not_needed);
          ( `RESP_ERR_NO_REASSIGNMENT_IN_PROGRESS,
            resp_err_no_reassignment_in_progress );
          ( `RESP_ERR_GROUP_SUBSCRIBED_TO_TOPIC,
            resp_err_group_subscribed_to_topic );
          (`RESP_ERR_INVALID_RECORD, resp_err_invalid_record);
          (`RESP_ERR_UNSTABLE_OFFSET_COMMIT, resp_err_unstable_offset_commit);
          ( `RESP_ERR_THROTTLING_QUOTA_EXCEEDED,
            resp_err_throttling_quota_exceeded );
          (`RESP_ERR_PRODUCER_FENCED, resp_err_producer_fenced);
          (`RESP_ERR_RESOURCE_NOT_FOUND, resp_err_resource_not_found);
          (`RESP_ERR_DUPLICATE_RESOURCE, resp_err_duplicate_resource);
          (`RESP_ERR_UNACCEPTABLE_CREDENTIAL, resp_err_unacceptable_credential);
          (`RESP_ERR_INCONSISTENT_VOTER_SET, resp_err_inconsistent_voter_set);
          (`RESP_ERR_INVALID_UPDATE_VERSION, resp_err_invalid_update_version);
          (`RESP_ERR_FEATURE_UPDATE_FAILED, resp_err_feature_update_failed);
          ( `RESP_ERR_PRINCIPAL_DESERIALIZATION_FAILURE,
            resp_err_principal_deserialization_failure );
          (`RESP_ERR_END_ALL, resp_err_end_all);
        ]
  end

  module Rd_kafka_thread_type_t = struct
    let thread_main = constant "RD_KAFKA_THREAD_MAIN" int64_t
    let thread_background = constant "RD_KAFKA_THREAD_BACKGROUND" int64_t
    let thread_broker = constant "RD_KAFKA_THREAD_BROKER" int64_t

    type t = [ `THREAD_MAIN | `THREAD_BACKGROUND | `THREAD_BROKER ]

    let t : t typ =
      T.enum "rd_kafka_thread_type_t" ~typedef:true
        [
          (`THREAD_MAIN, thread_main);
          (`THREAD_BACKGROUND, thread_background);
          (`THREAD_BROKER, thread_broker);
        ]
  end

  module Rd_kafka_timestamp_type_t = struct
    let timestamp_not_available =
      constant "RD_KAFKA_TIMESTAMP_NOT_AVAILABLE" int64_t

    let timestamp_create_time =
      constant "RD_KAFKA_TIMESTAMP_CREATE_TIME" int64_t

    let timestamp_log_append_time =
      constant "RD_KAFKA_TIMESTAMP_LOG_APPEND_TIME" int64_t

    type t =
      [ `TIMESTAMP_NOT_AVAILABLE
      | `TIMESTAMP_CREATE_TIME
      | `TIMESTAMP_LOG_APPEND_TIME ]

    let t : t typ =
      T.enum "rd_kafka_timestamp_type_t" ~typedef:true
        [
          (`TIMESTAMP_NOT_AVAILABLE, timestamp_not_available);
          (`TIMESTAMP_CREATE_TIME, timestamp_create_time);
          (`TIMESTAMP_LOG_APPEND_TIME, timestamp_log_append_time);
        ]
  end

  module Rd_kafka_type_t = struct
    let producer = constant "RD_KAFKA_PRODUCER" int64_t
    let consumer = constant "RD_KAFKA_CONSUMER" int64_t

    type t = [ `PRODUCER | `CONSUMER ]

    let t : t typ =
      T.enum "rd_kafka_type_t" ~typedef:true
        [ (`PRODUCER, producer); (`CONSUMER, consumer) ]
  end

  module Rd_kafka_vtype_t = struct
    let vtype_end = constant "RD_KAFKA_VTYPE_END" int64_t
    let vtype_topic = constant "RD_KAFKA_VTYPE_TOPIC" int64_t
    let vtype_rkt = constant "RD_KAFKA_VTYPE_RKT" int64_t
    let vtype_partition = constant "RD_KAFKA_VTYPE_PARTITION" int64_t
    let vtype_value = constant "RD_KAFKA_VTYPE_VALUE" int64_t
    let vtype_key = constant "RD_KAFKA_VTYPE_KEY" int64_t
    let vtype_opaque = constant "RD_KAFKA_VTYPE_OPAQUE" int64_t
    let vtype_msgflags = constant "RD_KAFKA_VTYPE_MSGFLAGS" int64_t
    let vtype_timestamp = constant "RD_KAFKA_VTYPE_TIMESTAMP" int64_t
    let vtype_header = constant "RD_KAFKA_VTYPE_HEADER" int64_t
    let vtype_headers = constant "RD_KAFKA_VTYPE_HEADERS" int64_t

    type t =
      [ `VTYPE_END
      | `VTYPE_TOPIC
      | `VTYPE_RKT
      | `VTYPE_PARTITION
      | `VTYPE_VALUE
      | `VTYPE_KEY
      | `VTYPE_OPAQUE
      | `VTYPE_MSGFLAGS
      | `VTYPE_TIMESTAMP
      | `VTYPE_HEADER
      | `VTYPE_HEADERS ]

    let t : t typ =
      T.enum "rd_kafka_vtype_t" ~typedef:true
        [
          (`VTYPE_END, vtype_end);
          (`VTYPE_TOPIC, vtype_topic);
          (`VTYPE_RKT, vtype_rkt);
          (`VTYPE_PARTITION, vtype_partition);
          (`VTYPE_VALUE, vtype_value);
          (`VTYPE_KEY, vtype_key);
          (`VTYPE_OPAQUE, vtype_opaque);
          (`VTYPE_MSGFLAGS, vtype_msgflags);
          (`VTYPE_TIMESTAMP, vtype_timestamp);
          (`VTYPE_HEADER, vtype_header);
          (`VTYPE_HEADERS, vtype_headers);
        ]
  end
end
