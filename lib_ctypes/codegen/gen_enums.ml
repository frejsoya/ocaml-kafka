open StdLabels
open Ppx_yojson_conv_lib.Yojson_conv.Primitives

(**
Example header file to parse 
Property                                 | C/P | Range           |       Default | Importance | Description              
-----------------------------------------|-----|-----------------|--------------:|------------| --------------------------

*)

let log = Format.eprintf

type fields = { name : string; value : int }
[@@deriving show, yojson, eq] [@@yojson.allow_extra_fields]

type json_type = {
  type_class : string;
  enum_fields : fields list; [@default []]
}
[@@deriving yojson, show] [@@yojson.allow_extra_fields]

type json_header = {
  name : string;
  symbol_class : string;
  _type : json_type; [@key "type"]
}
[@@deriving yojson, show] [@@yojson.allow_extra_fields]

type json_headers = json_header list [@@deriving yojson, show]

let longest_prefix a b =
  let length : int = String.(min (length a) (length b)) in
  let rec loop idx max =
    if idx > max then String.sub a ~pos:0 ~len:idx
    else if String.(get a idx == get b idx) then loop (idx + 1) max
    else String.sub a ~pos:0 ~len:idx
  in
  loop 0 length

let common_prefix names =
  let names = List.sort ~cmp:String.compare names in
  let start, final = (List.hd names, List.hd @@ List.rev names) in
  longest_prefix start final

let%expect_test "prefix" =
  common_prefix [ "foo_bar"; "foo_foo" ] |> print_endline;
  [%expect {| foo_ |}]

let print_constant prefix name =
  let pos = String.length prefix in
  let len = String.length name - pos in
  let v_name = String.sub name ~pos ~len in
  Format.printf "let %s = constant \"%s\" int64_t\n"
    (String.lowercase_ascii v_name)
    name

let print_constants (enums : fields list) =
  let enums = List.map ~f:(fun (field : fields) -> field.name) enums in
  (* let prefix = common_prefix enums in *)
  let prefix = "RD_KAFKA_" in
  List.iter ~f:(print_constant prefix) enums;
  print_endline ""

let drop_prefix prefix str =
  let pos = String.length prefix in
  let len = String.length str - pos in
  String.sub str ~pos ~len

let print_types names =
  List.map ~f:(fun (field : fields) -> field.name) names
  |> List.map ~f:(drop_prefix "RD_KAFKA_")
  |> List.map ~f:(String.cat "`")
  |> String.concat ~sep:"|"
  |> Format.printf "type t = [ %s]\n\n"

let print_t_def name enums =
  Format.printf "let t  :  t typ = T.enum \"%s\" ~typedef:true\n" name;
  List.map
    ~f:(fun (fields : fields) ->
      (drop_prefix "RD_KAFKA_" fields.name, fields.name))
    enums
  |> List.map ~f:(fun (stripped, _s) ->
         Format.sprintf "(`%s, %s)" stripped (String.lowercase_ascii stripped))
  |> String.concat ~sep:";" |> Format.printf "[ %s ]\n"

let parse_json filename =
  let json = Yojson.Safe.from_file filename in
  let headers =
    try json_headers_of_yojson json
    with Ppx_yojson_conv_lib__Yojson_conv.Of_yojson_error (exn, json) ->
      Yojson.Safe.to_string json |> print_endline;
      raise exn
  in

  let enums =
    List.filter
      ~f:(fun { _type; _ } -> String.equal _type.type_class "enum")
      headers
  in
  Format.printf "module Enums(T : Ctypes.TYPE) = struct\n";
  Format.printf "open T\n";
  List.iter enums ~f:(fun { _type; name; _ } ->
      Format.printf "module %s = struct\n" (String.capitalize_ascii name);
      print_constants _type.enum_fields;
      print_types _type.enum_fields;
      print_t_def name _type.enum_fields;
      print_endline "";
      print_endline "end");
  print_endline "end"
(**)
(* let parse_header filename = *)
(*   log "Parsing %s\n" filename; *)
(*   In_channel.with_open_text filename @@ fun data -> *)
(*   let header = In_channel.input_all data in *)
(*   let res = Parser.parse_typedef_decl header in *)
(*   let pp = Format.pp_print_seq Parser.pp_decl in *)
(*   Format.printf "%a\n" pp res *)
