type tree =
  | Branch of {left : tree; right : tree; content : string}
  | Leaf

type cont =
  | Next of tree * cont
  | Done

let print_tree tree cont =
  let tree_ref = ref tree in
  let cont_ref = ref cont in
  let break_ref = ref false in
  while not !break_ref do
    match !tree_ref, !cont_ref with
    | Branch {left; _}, cont ->
      cont_ref := Next (!tree_ref, cont);
      tree_ref := left;
    | Leaf, Next (Branch {right; content; _}, next) ->
      print_endline content;
      tree_ref := right;
      cont_ref := next
    | _ ->
      break_ref := true
  done

let () =
  let tree =
    Branch
      { left =
          Branch
            { left =
                Branch
                  { left = Leaf
                  ; right = Leaf
                  ; content = "1"
                  }
            ; right =
                Branch
                  { left = Leaf
                  ; right = Leaf
                  ; content = "3"
                  }
            ; content = "2"
            }
      ; right =
          Branch
            { left = Leaf
            ; right = Leaf
            ; content = "5"
            }
      ; content = "4"
      }
  in
  print_tree tree Done
