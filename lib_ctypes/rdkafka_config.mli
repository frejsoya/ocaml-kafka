(*
Config module for kafka
*)

type t

(* of_assoc_list/ to_assoc_list *)
val set : t -> key:string -> value:string -> (unit, string) result
val get : t -> key:string -> (string, string) result
val make : unit -> t
