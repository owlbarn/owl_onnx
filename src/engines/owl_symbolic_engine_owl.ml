(*
 * OWL - OCaml Scientific and Engineering Computing
 * Copyright (c) 2016-2019 Liang Wang <liang.wang@cl.cam.ac.uk>
 *)

module G = Owl_computation_cpu_engine.Make (Owl_dense_ndarray.S)
open G
open Owl_graph

type t = G.graph

(* Target op (Owl -- Symbolic):
Var -- variable 
Zeros -- float tensor 
Ones  -- float tensor 
Const -- float tensor

HOWEVER, beware that: Uniform node  requires two const nodes as parameter;
so we are not one-to-one map.
Wait, no actually, we need to have "RandomUniform/Normal" operators in Symbolic as in ONNX. 
That means we need to ditch the two const node, but use then as attributes of the RandomUniform node.

Sin/Cos/Add/Sub/Mul/Div/Pow -- direct map
AddScalar/ScalarAdd/Scalar_Sin....  -- map to Add/Sin... in the end; scalar to tensor first

No need to shape inference since that' already done in Owl
*)

(** Helper function *)

let get_const_value (attr : Symbol.Shape.Type.attr) =
  if Array.length attr.value > 0
  then (
    let v = attr.value.(0) in
    if Device.is_elt v
    then Device.value_to_float v
    else failwith "Non-float value const not supported yet")
  else failwith "Non-value const"


(** Main entry *)

let to_symbolic (cgraph : t) =
  let outputs = G.get_outputs cgraph in
  (* name each node properly *)
  iter_ancestors
    ~order:DFS
    ~traversal:PostOrder
    (fun node ->
      let name = Owl_graph.name node in
      let name =
        if name <> ""
        then name
        else (
          let id = Owl_graph.id node in
          Printf.sprintf "owlnode%d" id)
      in
      Owl_graph.set_name node name)
    outputs;
  (* NOTE: change the length *)
  let syms = Hashtbl.create 100 in
  (* iterate Owl CGraph in topology order *)
  iter_ancestors
    ~order:DFS
    ~traversal:PostOrder
    (fun node ->
      let cnode_attr : Symbol.Shape.Type.attr = Owl_graph.attr node in
      let name = Owl_graph.name node in
      (* find in dict the input sym nodes of current sym *)
      let sym_inputs =
        Array.map
          (fun n ->
            let n = Owl_graph.name n in
            try Hashtbl.find syms n with
            | Not_found -> failwith "owl_to_symbolic: input node not found.")
          (Owl_graph.parents node)
      in
      (* build the current symbol *)
      let sym =
        match cnode_attr.op with
        | Const ->
          let value = get_const_value cnode_attr in
          Owl_symbolic_operator.flt ~name value
        | Sin   -> Owl_symbolic_operator.sin ~name sym_inputs.(0)
        | Add   -> Owl_symbolic_operator.add sym_inputs.(0) sym_inputs.(1)
        | _     -> failwith "Node type not supported."
      in
      Hashtbl.add syms name sym)
    outputs;
  (* choose only the output symbols to be in the graph *)
  let output_sym_nodes =
    Array.map
      (fun n ->
        let name = Owl_graph.name n in
        Hashtbl.find syms name)
      outputs
  in
  Owl_symbolic_graph.make_graph output_sym_nodes ""

(*
let of_symbolic (_sym_graph : symbolic_graph) =
  let attr =
    { op = Noop
    ; freeze = true
    ; reuse = false
    ; state = Valid
    ; shape = [||]
    ; value = [||]
    ; block = None
    }
  in
  Owl_graph.node attr


let eval_arr (sym_graph : symbolic_graph) =
  let cgraph_arr = of_symbolic sym_graph |> G.node_to_arr in
  G.eval_arr [| cgraph_arr |];
  G.unpack_arr cgraph_arr


let eval_elt (sym_graph : symbolic_graph) =
  let cgraph_elt = of_symbolic sym_graph |> G.node_to_elt in
  G.eval_elt [| cgraph_elt |];
  G.unpack_elt cgraph_elt
*)

(** save an cgraph model to file *)
let save _cgraph _filename = ()

(** load an cgraph model from file *)
let load _filename = None