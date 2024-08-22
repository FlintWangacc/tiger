let anyErrors = ref false
let fileName = ref ""
let lineNum = ref 1
let linePos = ref [1]

let reset () = (anyErrors:=false;
                fileName:="";
                lineNum:=1;
                linePos:=[1])

exception Error

let error pos (msg:string) =
  let rec look n = function
    | a :: rest ->
        if a < pos then Printf.printf "%d.%d" n (pos - a) else look (n - 1) rest
    | _ -> print_string "0.0"
  in
  anyErrors := true;
  look !lineNum !linePos;
  print_string ":";
  print_endline msg;
  print_newline ()

let impossible msg =
  Printf.printf "Error: Compiler bug %s\n" msg;
  raise Error  