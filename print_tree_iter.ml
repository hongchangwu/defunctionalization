type tree =
  | Branch of {content : string; left : tree; right : tree}
  | Leaf

type cont =
  | Next of string * tree * cont
  | Done

(* let rec print_tree tree cont =
 *   match tree with
 *   | Leaf ->
 *     apply cont
 *   | Branch {content; left; right} ->
 *     print_tree left (Next (content, right, cont))
 *
 * and apply = function
 *   | Done ->
 *     ()
 *   | Next (content, tree, cont) ->
 *     print_endline content;
 *     print_tree tree cont *)

(* let rec print_tree tree cont =
 *   match tree with
 *   | Leaf ->
 *     begin match cont with
 *       | Done ->
 *         ()
 *       | Next (content, tree, cont) ->
 *         print_endline content;
 *         print_tree tree cont
 *     end
 *   | Branch {content; left; right} ->
 *     print_tree left (Next (content, right, cont)) *)

let print_tree tree cont =
  let tree_ref = ref tree in
  let cont_ref = ref cont in
  let break_ref = ref false in
  while not !break_ref do
    match !tree_ref with
    | Leaf ->
      begin match !cont_ref with
        | Done ->
          break_ref := true
        | Next (content, tree, next) ->
          print_endline content;
          tree_ref := tree;
          cont_ref := next
      end
    | Branch {content; left; right} ->
      cont_ref := Next (content, right, !cont_ref);
      tree_ref := left;
  done

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
  print_tree tree Done
