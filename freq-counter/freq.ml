open Base
open Stdio

(* Function to count the words in input  *)
let buildCounts () =
  In_channel.fold_lines In_channel.stdin ~init:Counter.empty ~f:Counter.touch

let () =
  ( buildCounts () |> Counter.toList
  |> List.sort ~compare:(fun (_, x) (_, y) -> Int.descending x y)
  |> fun l -> List.take l 20 )
  |> fun l -> List.iter l ~f:(fun (w, c) -> printf "%3d: %s\n" c w)
