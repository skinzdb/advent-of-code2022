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
    | "L" -> -1
    | "R" -> 1
    | "U" -> 1000000  (* assuming width of grid is less than 1 million units long *)
    | "D" -> -1000000
    | _ -> 0

let next_step hd tl =
    match hd - tl with
    | 2 -> 1                (* Right *)
    | -2 -> -1              (* Left *)
    | 2000000 -> 1000000    (* Up *)
    | -2000000 -> -1000000  (* Down *)
    | 1000002 -> 1000001    (* Top-right-right *)
    | -1000002 -> -1000001  (* Bottom-left-left *)
    | 999998 -> 999999      (* Top-left-left *)
    | -999998 -> -999999    (* Bottom-right-right *)
    | 2000001 -> 1000001    (* Top-top-right *)
    | -2000001 -> -1000001  (* Bottom-bottom-left *)
    | 1999999 -> 999999     (* Top-top-left *)
    | -1999999 -> -999999   (* Bottom-bottom-right *)
    | _ -> 0

let unique_tl_steps = 
    let hd_pos = ref 0 in
    let tl_pos = ref 0 in
    let map = ref IntMap.empty in
    map := IntMap.add 0 1 !map;
    let lines = read_file "data.txt" in
    let lines_split = List.map (String.split_on_char ' ') lines in
    let _ = List.map (fun x -> match x with 
                                | dir::steps::_ -> let d = get_dir dir in
                                                   let s = int_of_string steps in
                                                   for i = 1 to s do
                                                        hd_pos := !hd_pos + d;
                                                        let td = next_step !hd_pos !tl_pos in
                                                        tl_pos := !tl_pos + td;
                                                        map := IntMap.add !tl_pos 1 !map;
                                                   done;
                                | _ -> ()
                     ) lines_split in
    IntMap.cardinal !map

let () = Printf.printf "%d\n" unique_tl_steps 
    
