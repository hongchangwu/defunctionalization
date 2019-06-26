type tree =
  | Branch of {left : tree; right : tree; content : string}
  | Leaf

let rec print_tree = function
  | Leaf ->
    ()
  | Branch {left; right; content} ->
    print_tree left;
    print_endline content;
    print_tree right

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
  print_tree tree
