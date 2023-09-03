open StdLabels
open MoreLabels
open Ppx_yojson_conv_lib.Yojson_conv.Primitives

(**
Example header file to parse 
Property                                 | C/P | Range           |       Default | Importance | Description              
-----------------------------------------|-----|-----------------|--------------:|------------| --------------------------

*)

let log = Format.eprintf

type fields = { name : string; value : int }
[@@deriving show, yojson, eq] [@@yojson.allow_extra_fields]

type json_type = { type_class : string; enum_fields : fields list [@default []] }
[@@deriving yojson, show] [@@yojson.allow_extra_fields]

type json_header = { name : string; symbol_class : string; _type : json_type [@key "type"] }
[@@deriving yojson, show] [@@yojson.allow_extra_fields]

type json_headers = json_header list [@@deriving yojson, show]

let print_constant name =
  Format.printf "let %s = constant \"%s\" int64_t\n" (String.lowercase_ascii name) name

let print_constants enums =
  List.map ~f:(fun { name; value } -> name) enums |> List.iter ~f:print_constant;
  print_endline ""

let print_types names =
  List.map ~f:(fun { name; value } -> name) names
  |> List.map ~f:(String.cat "`")
  |> String.concat ~sep:"|"
  |> Format.printf "type t = [ %s]\n\n"

let print_t_def name enums =
  Format.printf "let t: t typ = T.enum \"%s\" ~typedef:true\n" name;
  List.map ~f:(fun { name; value } -> name) enums
  |> List.map ~f:(fun s -> Format.sprintf "(`%s, %s)" s (String.lowercase_ascii s))
  |> String.concat ~sep:";" |> Format.printf "[ %s ]\n"

let parse_json filename =
  let json = Yojson.Safe.from_file filename in
  let headers =
    try json_headers_of_yojson json
    with Ppx_yojson_conv_lib__Yojson_conv.Of_yojson_error (exn, json) ->
      Yojson.Safe.to_string json |> print_endline;
      raise exn
  in

  let enums = List.filter ~f:(fun { _type; _ } -> String.equal _type.type_class "enum") headers in
  List.iter enums ~f:(fun { _type; name; symbol_class } ->
      Format.printf "module %s (T : Ctypes.TYPE) = struct\n" (String.capitalize_ascii name);
      Format.printf "open T\n";
      print_constants _type.enum_fields;
      print_types _type.enum_fields;
      print_t_def name _type.enum_fields;
      print_endline "";
      print_endline "end")
(**)
(* let parse_header filename = *)
(*   log "Parsing %s\n" filename; *)
(*   In_channel.with_open_text filename @@ fun data -> *)
(*   let header = In_channel.input_all data in *)
(*   let res = Parser.parse_typedef_decl header in *)
(*   let pp = Format.pp_print_seq Parser.pp_decl in *)
(*   Format.printf "%a\n" pp res *)
