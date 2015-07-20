(** * Interface to the OCaml big integers. *)
open Big_int

let rec to_positive_aux (big : big_int) xH xO xI =
  if eq_big_int big unit_big_int then
    xH
  else
    let big' = to_positive_aux (div_big_int big (big_int_of_int 2)) xH xO xI in
    if eq_big_int (mod_big_int big (big_int_of_int 2)) zero_big_int then
      xO big'
    else
      xI big'

let to_Z_aux (big : big_int) z_O z_pos z_neg xH xO xI =
  if eq_big_int big zero_big_int then
    z_O
  else if gt_big_int big zero_big_int then
    z_pos (to_positive_aux big xH xO xI)
  else
    z_pos (to_positive_aux (minus_big_int big) xH xO xI)
