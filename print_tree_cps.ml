type tree =
  | Leaf
  | Branch of {content : string; left : tree; right : tree}

let rec print_tree tree cont =
  match tree with
  | Leaf ->
    cont ()
  | Branch {content; left; right} ->
    print_tree
      left
      (fun () ->
        print_endline content;
        print_tree right cont)

let () =
  let tree =
    Branch
      { content = "4"
      ; left =
          Branch
            { content = "2"
            ; left =
                Branch
                  { content = "1"
                  ; left = Leaf
                  ; right = Leaf

                  }
            ; right =
                Branch
                  { content = "3"
                  ; left = Leaf
                  ; right = Leaf
                  }
            }
      ; right =
          Branch
            { content = "5"
            ; left = Leaf
            ; right = Leaf
            }
      }
  in
  print_tree tree (fun () -> ())
