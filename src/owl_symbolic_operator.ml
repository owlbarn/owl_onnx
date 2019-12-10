(*
 * OWL - OCaml Scientific and Engineering Computing
 * Copyright (c) 2016-2019 Liang Wang <liang.wang@cl.cam.ac.uk>
 *)

open Owl_symbolic_graph

let noop = make_node Owl_symbolic_symbol.NOOP [||]

(** Generator *)

let int ?name value =
  let sym = Owl_symbolic_ops_generator.Int.create ?name value in
  make_node (Owl_symbolic_symbol.Int sym) [||]


let float ?name value =
  let sym = Owl_symbolic_ops_generator.Float.create ?name value in
  make_node (Owl_symbolic_symbol.Float sym) [||]


let complex ?name r i =
  let sym = Owl_symbolic_ops_generator.Complex.create ?name r i in
  make_node (Owl_symbolic_symbol.Complex sym) [||]


let pi ?name () =
  let sym = Owl_symbolic_ops_generator.Pi.create ?name () in
  make_node (Owl_symbolic_symbol.Pi sym) [||]


let tensor ?name t =
  let sym = Owl_symbolic_ops_generator.Tensor.create ?name t in
  make_node (Owl_symbolic_symbol.Tensor sym) [||]


(* The shape and type are decided by initial value; 
 * if initial value not given, user need to specify them. 
 * Shape value default to scalar [||], and type default to SNT_Float. *)
let variable ?dtype ?shape ?init name =
  let s = Owl_symbolic_ops_generator.Variable.create ?dtype ?shape ?init name in
  make_node (Owl_symbolic_symbol.Variable s) [||]


let random_uniform ?dtype ?seed ?low ?high ?name shape =
  let s =
    Owl_symbolic_ops_generator.RandomUniform.create ?dtype ?seed ?low ?high ?name shape
  in
  make_node (Owl_symbolic_symbol.RandomUniform s) [||]


(** Logical *)

let equal ?name lhs rhs =
  let lhs_name = Owl_symbolic_graph.name lhs in
  let rhs_name = Owl_symbolic_graph.name rhs in
  let s = Owl_symbolic_ops_logical.Equal.create ?name lhs_name rhs_name in
  make_node (Owl_symbolic_symbol.Equal s) [| lhs; rhs |]


(** Math *)

let sin ?name x =
  let xn = Owl_symbolic_graph.name x in
  let s = Owl_symbolic_ops_math.Sin.create ?name xn in
  make_node (Owl_symbolic_symbol.Sin s) [| x |]


let cos ?name x =
  let xn = Owl_symbolic_graph.name x in
  let s = Owl_symbolic_ops_math.Cos.create ?name xn in
  make_node (Owl_symbolic_symbol.Cos s) [| x |]


let tan ?name x =
  let xn = Owl_symbolic_graph.name x in
  let s = Owl_symbolic_ops_math.Tan.create ?name xn in
  make_node (Owl_symbolic_symbol.Tan s) [| x |]


let asin ?name x =
  let xn = Owl_symbolic_graph.name x in
  let s = Owl_symbolic_ops_math.Asin.create ?name xn in
  make_node (Owl_symbolic_symbol.Asin s) [| x |]


let acos ?name x =
  let xn = Owl_symbolic_graph.name x in
  let s = Owl_symbolic_ops_math.Acos.create ?name xn in
  make_node (Owl_symbolic_symbol.Acos s) [| x |]


let atan ?name x =
  let xn = Owl_symbolic_graph.name x in
  let s = Owl_symbolic_ops_math.Atan.create ?name xn in
  make_node (Owl_symbolic_symbol.Atan s) [| x |]


let sinh ?name x =
  let xn = Owl_symbolic_graph.name x in
  let s = Owl_symbolic_ops_math.Sinh.create ?name xn in
  make_node (Owl_symbolic_symbol.Sinh s) [| x |]


let cosh ?name x =
  let xn = Owl_symbolic_graph.name x in
  let s = Owl_symbolic_ops_math.Cosh.create ?name xn in
  make_node (Owl_symbolic_symbol.Cosh s) [| x |]


let tanh ?name x =
  let xn = Owl_symbolic_graph.name x in
  let s = Owl_symbolic_ops_math.Tanh.create ?name xn in
  make_node (Owl_symbolic_symbol.Tanh s) [| x |]


let sqrt ?name x =
  let xn = Owl_symbolic_graph.name x in
  let s = Owl_symbolic_ops_math.Sqrt.create ?name xn in
  make_node (Owl_symbolic_symbol.Sqrt s) [| x |]


let exp ?name x =
  let xn = Owl_symbolic_graph.name x in
  let s = Owl_symbolic_ops_math.Exp.create ?name xn in
  make_node (Owl_symbolic_symbol.Exp s) [| x |]


let log ?name x =
  let xn = Owl_symbolic_graph.name x in
  let s = Owl_symbolic_ops_math.Exp.create ?name xn in
  make_node (Owl_symbolic_symbol.Exp s) [| x |]


let neg ?name x =
  let xn = Owl_symbolic_graph.name x in
  let s = Owl_symbolic_ops_math.Neg.create ?name xn in
  make_node (Owl_symbolic_symbol.Neg s) [| x |]


let relu ?name x =
  let xn = Owl_symbolic_graph.name x in
  let s = Owl_symbolic_ops_math.Relu.create ?name xn in
  make_node (Owl_symbolic_symbol.Relu s) [| x |]


let add ?name x y =
  let xn = Owl_symbolic_graph.name x in
  let yn = Owl_symbolic_graph.name y in
  let s = Owl_symbolic_ops_math.Add.create name xn yn in
  make_node (Owl_symbolic_symbol.Add s) [| x; y |]


let sub ?name x y =
  let xn = Owl_symbolic_graph.name x in
  let yn = Owl_symbolic_graph.name y in
  let s = Owl_symbolic_ops_math.Sub.create name xn yn in
  make_node (Owl_symbolic_symbol.Sub s) [| x; y |]


let mul ?name x y =
  let xn = Owl_symbolic_graph.name x in
  let yn = Owl_symbolic_graph.name y in
  let s = Owl_symbolic_ops_math.Mul.create name xn yn in
  make_node (Owl_symbolic_symbol.Mul s) [| x; y |]


let div ?name x y =
  let xn = Owl_symbolic_graph.name x in
  let yn = Owl_symbolic_graph.name y in
  let s = Owl_symbolic_ops_math.Div.create name xn yn in
  make_node (Owl_symbolic_symbol.Div s) [| x; y |]


let pow ?name x y =
  let xn = Owl_symbolic_graph.name x in
  let yn = Owl_symbolic_graph.name y in
  let s = Owl_symbolic_ops_math.Pow.create name xn yn in
  make_node (Owl_symbolic_symbol.Pow s) [| x; y |]


let matmul ?name x y =
  let xn = Owl_symbolic_graph.name x in
  let yn = Owl_symbolic_graph.name y in
  let s = Owl_symbolic_ops_math.MatMul.create name xn yn in
  make_node (Owl_symbolic_symbol.MatMul s) [| x; y |]


(** Reduction *)

let reduce_sum ?keepdims ?name x axes =
  let xn = Owl_symbolic_graph.name x in
  let s = Owl_symbolic_ops_reduction.ReduceSum.create ?keepdims ?name xn axes in
  make_node (Owl_symbolic_symbol.ReduceSum s) [| x |]


let reduce_max ?keepdims ?name x axes =
  let xn = Owl_symbolic_graph.name x in
  let s = Owl_symbolic_ops_reduction.ReduceMax.create ?keepdims ?name xn axes in
  make_node (Owl_symbolic_symbol.ReduceMax s) [| x |]


(** Tensor *)

let reshape ?name data shape =
  let data_name = Owl_symbolic_graph.name data in
  let shp =
    match Owl_graph.attr shape with
    | Owl_symbolic_symbol.Tensor s -> s
    | _                            -> failwith "reshape op: unmatched op type shape"
  in
  let o = Owl_symbolic_ops_tensor.Reshape.create ?name data_name shp in
  let sym = Owl_symbolic_symbol.Reshape o in
  make_node sym [| data; shape |]


(** Neural Network *)

let conv ?name ?dim ?padding ?strides ?dilations ?bias input kernel =
  let i_name = Owl_symbolic_graph.name input in
  let k_name = Owl_symbolic_graph.name kernel in
  match bias with
  | Some b ->
    let b_name = Owl_symbolic_graph.name b in
    let s =
      Owl_symbolic_ops_nn.Conv.create
        ?name
        ?padding
        ?strides
        ?dilations
        ~bias_name:b_name
        i_name
        k_name
    in
    make_node (Owl_symbolic_symbol.Conv s) [| input; kernel; b |]
  | None   ->
    let s =
      Owl_symbolic_ops_nn.Conv.create
        ?name
        ?dim
        ?padding
        ?strides
        ?dilations
        i_name
        k_name
    in
    make_node (Owl_symbolic_symbol.Conv s) [| input; kernel |]


(* !!!! Currently ignore its second optional output -- that may require some structural change *)
let maxpool ?name ?strides ?dilations ?padding input kernel_shp =
  let input_name = Owl_symbolic_graph.name input in
  let s =
    Owl_symbolic_ops_nn.MaxPool.create
      ?name
      ?strides
      ?dilations
      ?padding
      input_name
      kernel_shp
  in
  make_node (Owl_symbolic_symbol.MaxPool s) [| input |]
