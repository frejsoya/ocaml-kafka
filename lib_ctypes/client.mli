type t
(* Exceptions *)

val make : unit -> (t, string) Result.t
val with_client : (t -> unit) -> (unit, string) Result.t
val destroy : t -> unit
val name : t -> string
val config : t -> (string * string) list

