open Base
(* Interface of our counter *)

type t

(* We want the counter to be able to represent median string counts as well! *)
type median =
  | Median of string
  | Before_and_after of (string * string)

(* Empty counter record *)
val empty : t

(* Convert a collection of frequency counts to a list *)
val toList : t -> (string * int) list

(* Converts the set of frequency counts to an association list. A string shows up at most once, and the counts are >= 1. *)
val touch : t -> string -> t
val median : t -> median
