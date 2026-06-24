let prefix = "orx_stub"

let prologue = {|
#if defined(__clang__)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-pointer-types-discards-qualifiers"
#elif defined(__GNUC__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdiscarded-qualifiers"
#endif

#include <orx.h>
|}

let () =
  print_endline prologue;
  Cstubs.Types.write_c Format.std_formatter (module Orx_types_bindings.Bindings)
