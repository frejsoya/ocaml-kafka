(*
Config module for kafka
*)

type t = { conf : C.Types.Conf.t Ctypes.ptr }

(* of_assoc_list/ to_assoc_list *)
val set : t -> key:string -> value:string -> (string, string) result
val get : t -> key:string -> (string, string) result
val make : unit -> t
