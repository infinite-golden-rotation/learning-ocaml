open Base

type t = int Map.M(String).t

let empty = Map.empty (module String)

(* Currently implemented in a trivial fashion. *)
let toList t = Map.to_alist t

(* Does the type have to be declared twice in mli an ml? *)
type median =
  | Median of string
  | Before_and_after of (string * string)

(* Function to compute median. *)
let median counts =
  let sorted_keys =
    List.sort (toList counts) ~compare:(fun (_, x) (_, y) -> Int.descending x y)
  in
  let len = List.length sorted_keys in
  match len with
  | 0 -> failwith "No median for counter with no keys"
  | _ -> (
      let nth n = List.nth_exn sorted_keys n in
      let midl = len % 2 in
      match midl with
      | 0 -> Median (fst (nth midl))
      | 1 -> Before_and_after (fst (nth midl), fst (nth (midl + 1)))
      | _ -> assert false)

(* Increment frequency count of current counter. *)
let touch counts line =
  let count =
    match Map.find counts line with
    | None -> 0
    | Some x -> x
  in
  Map.set counts ~key:line ~data:(count + 1)
