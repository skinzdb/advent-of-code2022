module IntMap = Map.Make(Int);;

let read_file filename = 
let lines = ref [] in
let chan = open_in filename in
try
  while true; do
    lines := input_line chan :: !lines
  done; !lines
with End_of_file ->
  close_in chan;
  List.rev !lines ;;

let get_dir d = match d with
    | "L" -> (-1,0)
    | "R" -> (1,0)
    | "U" -> (0,1)  
    | "D" -> (0,-1)
    | _ -> (0,0);;

let clamp low high value = 
    if value < low then low else
        if value > high then high else value;;

let next_step (hx, hy) (tx, ty) =
    let (dx, dy) = (hx - tx, hy - ty) in
    if abs dx > 1 || abs dy > 1 then (clamp (-1) 1 dx, clamp (-1) 1 dy) else (0,0);;

let add (x1,y1) (x2,y2) = (x1+x2, y1+y2);;

let encode (x, y) = y * 1000000 + x;; (* Assuming grid width is less than 1000000 units *)

let unique_tl_steps = 
    let pos = ref [(0,0); (0,0); (0,0); (0,0); (0,0); (0,0); (0,0); (0,0); (0,0); (0,0)] in
    let map = ref IntMap.empty in
    map := IntMap.add 0 1 !map;
    let lines = read_file "data.txt" in
    let lines_split = List.map (String.split_on_char ' ') lines in
    let _ = List.map (fun x ->
        match x with 
          | dir::steps::_ -> let d = get_dir dir in
                             let s = int_of_string steps in
                             for _ = 1 to s do
                               pos := add (List.hd !pos) d :: List.tl !pos;
                               for i = 0 to 8 do
                                     let parent = List.nth !pos i in
                                     let child = List.nth !pos (i+1) in
                                     let diff = next_step parent child in
                                     pos := List.mapi (fun j x -> if j == i + 1 then add x diff else x) !pos 
                               done;
                               map := IntMap.add (encode (List.nth !pos 9)) 1 !map;
                             done 
          | _ -> ()) lines_split in
    IntMap.cardinal !map;;

let () = Printf.printf "%d\n" unique_tl_steps 
    
