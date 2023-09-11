(*
Config module for kafka
*)

type t = { conf : C.Types.Conf.t Ctypes.ptr }

(* of_assoc_list/ to_assoc_list *)
val set : t -> key:string -> value:string -> (string, string) result
val get : t -> key:string -> (string, string) result
val to_list : t -> (string * string) list
val make : unit -> t
