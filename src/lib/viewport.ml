open Common
open Direct_bindings

include Orx_gen.Viewport

let of_structure (s : Structure.t) : t option =
  of_void_pointer (Structure.to_void_pointer s)

let create_from_config_exn = create_exn create_from_config "viewport"

let get_shader_exn v =
  match get_shader v with
  | None ->
    Fmt.invalid_arg "No shader associated with viewport %s" (get_name v)
  | Some shader -> shader

let get_exn name =
  match get name with
  | None -> Fmt.invalid_arg "No viewport %s available" name
  | Some viewport -> viewport
