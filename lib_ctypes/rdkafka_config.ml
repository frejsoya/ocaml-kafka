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
      let ptr = CArray.start arr in
      let str = Ctypes.string_from_ptr ptr ~length in
      Ok str
  | `CONF_INVALID | `CONF_UNKNOWN ->
      Error (Format.sprintf "invalid/unknown setting %s" key)

let set { conf } ~key ~value =
  let errstr, size = allocate_c_string () in
  let res = C.Functions.Conf.set conf key value errstr size in
  (* Fmt.epr "set %s=%s with result: %s\n" key value
     (Ctypes_std_views.string_of_char_ptr errstr)
  *)
  match res with
  | C.Types.Conf.Res.(`CONF_OK) -> Result.ok ()
  | `CONF_INVALID | `CONF_UNKNOWN ->
      Error (Ctypes_std_views.string_of_char_ptr errstr)

(* let dump { conf } = *)
(*   let size_out = Ctypes.allocate Ctypes.size_t Unsigned.Size_t.zero in *)
(*   let data = C.Functions.Conf.dump conf size_out in *)
(**)
(*   (* let destroy { handle } = C.Functions.Conf.destroy handle in *) *)
(*   data *)
