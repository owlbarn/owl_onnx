(*
 * OWL - OCaml Scientific and Engineering Computing
 * Copyright (c) 2016-2019 Liang Wang <liang.wang@cl.cam.ac.uk>
 *)

open Owl_symbolic_types
open Owl_symbolic_ops_reduction
open Owl_symbolic_ops_generator
open Owl_symbolic_ops_logical
open Owl_symbolic_ops_math
open Owl_symbolic_ops_nn
open Owl_symbolic_ops_tensor

type t =
  | NOOP
  (* Input *)
  | Int of Int.t
  | Complex of Complex.t
  | Float of Float.t
  | Tensor of Tensor.t
  | Variable of Variable.t
  | RandomUniform of RandomUniform.t
  | Zero of Zero.t
  | One of One.t
  | NegOne of NegOne.t
  | Pi of Pi.t
  (* Math *)
  | Sin of Sin.t
  | Cos of Cos.t
  | Tan of Tan.t
  | Asin of Asin.t
  | Acos of Acos.t
  | Atan of Atan.t
  | Sinh of Sinh.t
  | Cosh of Cosh.t
  | Tanh of Tanh.t
  | Asinh of Asinh.t
  | Acosh of Acosh.t
  | Atanh of Atanh.t
  | Sqrt of Sqrt.t
  | Exp of Exp.t
  | Log of Log.t
  | Relu of Relu.t
  | Abs of Abs.t
  | Neg of Neg.t
  | Floor of Floor.t
  | Ceil of Ceil.t
  | Round of Round.t
  | Rational of Rational.t
  | Add of Add.t
  | Sub of Sub.t
  | Mul of Mul.t
  | Div of Div.t
  | Pow of Pow.t
  | MatMul of MatMul.t
  (* Reduction *)
  | ReduceSum of ReduceSum.t
  | ReduceMax of ReduceMax.t
  (* Tensor *)
  | Reshape of Reshape.t
  | Identity of Identity.t
  | Split of Split.t
  (* NN *)
  | Conv of Conv.t
  | MaxPool of MaxPool.t
  | BatchNormalization of BatchNormalization.t
  (* Logical ops *)
  | Equal of Equal.t

let name = function
  | Int x                -> Int.(x.name)
  | Float x              -> Float.(x.name)
  | Complex x            -> Complex.(x.name)
  | Tensor x             -> Tensor.(x.name)
  | Variable x           -> Variable.(x.name)
  | RandomUniform x      -> RandomUniform.(x.name)
  | Zero x               -> Zero.(x.name)
  | One x                -> One.(x.name)
  | NegOne x             -> NegOne.(x.name)
  | Pi x                 -> Pi.(x.name)
  | Sin x                -> Sin.(x.name)
  | Cos x                -> Cos.(x.name)
  | Tan x                -> Tan.(x.name)
  | Asin x               -> Asin.(x.name)
  | Acos x               -> Acos.(x.name)
  | Atan x               -> Atan.(x.name)
  | Sinh x               -> Sinh.(x.name)
  | Cosh x               -> Cosh.(x.name)
  | Tanh x               -> Tanh.(x.name)
  | Asinh x              -> Asinh.(x.name)
  | Acosh x              -> Acosh.(x.name)
  | Atanh x              -> Atanh.(x.name)
  | Sqrt x               -> Sqrt.(x.name)
  | Exp x                -> Exp.(x.name)
  | Log x                -> Log.(x.name)
  | Relu x               -> Relu.(x.name)
  | Abs x                -> Abs.(x.name)
  | Floor x              -> Floor.(x.name)
  | Ceil x               -> Ceil.(x.name)
  | Round x              -> Round.(x.name)
  | Neg x                -> Neg.(x.name)
  | Rational x           -> Rational.(x.name)
  | Add x                -> Add.(x.name)
  | Sub x                -> Sub.(x.name)
  | Mul x                -> Mul.(x.name)
  | Div x                -> Div.(x.name)
  | Pow x                -> Pow.(x.name)
  | MatMul x             -> MatMul.(x.name)
  | ReduceSum x          -> ReduceSum.(x.name)
  | ReduceMax x          -> ReduceMax.(x.name)
  | Reshape x            -> Reshape.(x.name)
  | Identity x           -> Identity.(x.name)
  | Split x              -> Split.(x.name)
  | Conv x               -> Conv.(x.name)
  | MaxPool x            -> MaxPool.(x.name)
  | BatchNormalization x -> BatchNormalization.(x.name)
  | Equal x              -> Equal.(x.name)
  | _                    -> failwith "owl_symbolic_symbol.name"


let op_type = function
  | Int _                -> Int.op_type
  | Float _              -> Float.op_type
  | Complex _            -> Complex.op_type
  | Tensor _             -> Tensor.op_type
  | Variable _           -> Variable.op_type
  | RandomUniform _      -> RandomUniform.op_type
  | Zero _               -> Zero.op_type
  | One _                -> One.op_type
  | NegOne _             -> NegOne.op_type
  | Pi _                 -> Pi.op_type
  | Sin _                -> Sin.op_type
  | Cos _                -> Cos.op_type
  | Tan _                -> Tan.op_type
  | Asin _               -> Asin.op_type
  | Acos _               -> Acos.op_type
  | Atan _               -> Atan.op_type
  | Sinh _               -> Sinh.op_type
  | Cosh _               -> Cosh.op_type
  | Tanh _               -> Tanh.op_type
  | Asinh _              -> Asinh.op_type
  | Acosh _              -> Acosh.op_type
  | Atanh _              -> Atanh.op_type
  | Sqrt _               -> Sqrt.op_type
  | Exp _                -> Exp.op_type
  | Log _                -> Log.op_type
  | Rational _           -> Rational.op_type
  | Neg _                -> Neg.op_type
  | Abs _                -> Abs.op_type
  | Floor _              -> Floor.op_type
  | Ceil _               -> Ceil.op_type
  | Round _              -> Round.op_type
  | Relu _               -> Relu.op_type
  | Add _                -> Add.op_type
  | Sub _                -> Sub.op_type
  | Mul _                -> Mul.op_type
  | Div _                -> Div.op_type
  | Pow _                -> Pow.op_type
  | MatMul _             -> MatMul.op_type
  | ReduceSum _          -> ReduceSum.op_type
  | ReduceMax _          -> ReduceMax.op_type
  | Reshape _            -> Reshape.op_type
  | Identity _           -> Identity.op_type
  | Split _              -> Split.op_type
  | Conv _               -> Conv.op_type
  | MaxPool _            -> MaxPool.op_type
  | BatchNormalization _ -> BatchNormalization.op_type
  | Equal _              -> Equal.op_type
  | _                    -> failwith "owl_symbolic_symbol.op_type"


let input = function
  | Int _                -> [||]
  | Float _              -> [||]
  | Complex _            -> [||]
  | Tensor _             -> [||]
  | Variable _           -> [||]
  | RandomUniform _      -> [||]
  | Zero _               -> [||]
  | One _                -> [||]
  | NegOne _             -> [||]
  | Pi _                 -> [||]
  | Sin x                -> Sin.(x.input)
  | Cos x                -> Cos.(x.input)
  | Tan x                -> Tan.(x.input)
  | Asin x               -> Asin.(x.input)
  | Acos x               -> Acos.(x.input)
  | Atan x               -> Atan.(x.input)
  | Sinh x               -> Sinh.(x.input)
  | Cosh x               -> Cosh.(x.input)
  | Tanh x               -> Tanh.(x.input)
  | Asinh x              -> Asinh.(x.input)
  | Acosh x              -> Acosh.(x.input)
  | Atanh x              -> Atanh.(x.input)
  | Sqrt x               -> Sqrt.(x.input)
  | Exp x                -> Exp.(x.input)
  | Log x                -> Log.(x.input)
  | Neg x                -> Neg.(x.input)
  | Abs x                -> Abs.(x.input)
  | Floor x              -> Floor.(x.input)
  | Ceil x               -> Ceil.(x.input)
  | Round x              -> Round.(x.input)
  | Relu x               -> Relu.(x.input)
  | Rational x           -> Rational.(x.input)
  | Add x                -> Add.(x.input)
  | Sub x                -> Sub.(x.input)
  | Mul x                -> Mul.(x.input)
  | Div x                -> Div.(x.input)
  | Pow x                -> Pow.(x.input)
  | MatMul x             -> MatMul.(x.input)
  | ReduceSum x          -> ReduceSum.(x.input)
  | ReduceMax x          -> ReduceMax.(x.input)
  | Reshape x            -> Reshape.(x.input)
  | Identity x           -> Identity.(x.input)
  | Split x              -> Split.(x.input)
  | Conv x               -> Conv.(x.input)
  | MaxPool x            -> MaxPool.(x.input)
  | BatchNormalization x -> BatchNormalization.(x.input)
  | Equal x              -> Equal.(x.input)
  | _                    -> failwith "owl_symbolic_symbol.input"


let set_input sym inputs =
  match sym with
  | Sin x                -> x.input <- inputs
  | Cos x                -> x.input <- inputs
  | Tan x                -> x.input <- inputs
  | Asin x               -> x.input <- inputs
  | Acos x               -> x.input <- inputs
  | Atan x               -> x.input <- inputs
  | Sinh x               -> x.input <- inputs
  | Cosh x               -> x.input <- inputs
  | Tanh x               -> x.input <- inputs
  | Asinh x              -> x.input <- inputs
  | Acosh x              -> x.input <- inputs
  | Atanh x              -> x.input <- inputs
  | Sqrt x               -> x.input <- inputs
  | Exp x                -> x.input <- inputs
  | Log x                -> x.input <- inputs
  | Neg x                -> x.input <- inputs
  | Abs x                -> x.input <- inputs
  | Floor x              -> x.input <- inputs
  | Ceil x               -> x.input <- inputs
  | Round x              -> x.input <- inputs
  | Relu x               -> x.input <- inputs
  | Rational x           -> x.input <- inputs
  | Add x                -> x.input <- inputs
  | Sub x                -> x.input <- inputs
  | Mul x                -> x.input <- inputs
  | Div x                -> x.input <- inputs
  | Pow x                -> x.input <- inputs
  | MatMul x             -> x.input <- inputs
  | ReduceSum x          -> x.input <- inputs
  | ReduceMax x          -> x.input <- inputs
  | Reshape x            -> x.input <- inputs
  | Identity x           -> x.input <- inputs
  | Split x              -> x.input <- inputs
  | Conv x               -> x.input <- inputs
  | MaxPool x            -> x.input <- inputs
  | BatchNormalization x -> x.input <- inputs
  | Equal x              -> x.input <- inputs
  | _                    -> failwith "owl_symbolic_symbol.set_input"


let out_shape = function
  | Int x                -> Int.(x.out_shape)
  | Float x              -> Float.(x.out_shape)
  | Complex x            -> Complex.(x.out_shape)
  | Tensor x             -> Tensor.(x.out_shape)
  | Variable x           -> Variable.(x.out_shape)
  | RandomUniform x      -> RandomUniform.(x.out_shape)
  | Zero x               -> Zero.(x.out_shape)
  | One x                -> One.(x.out_shape)
  | NegOne x             -> NegOne.(x.out_shape)
  | Pi x                 -> Pi.(x.out_shape)
  | Sin x                -> Sin.(x.out_shape)
  | Cos x                -> Cos.(x.out_shape)
  | Tan x                -> Tan.(x.out_shape)
  | Asin x               -> Asin.(x.out_shape)
  | Acos x               -> Acos.(x.out_shape)
  | Atan x               -> Atan.(x.out_shape)
  | Sinh x               -> Sinh.(x.out_shape)
  | Cosh x               -> Cosh.(x.out_shape)
  | Tanh x               -> Tanh.(x.out_shape)
  | Asinh x              -> Asinh.(x.out_shape)
  | Acosh x              -> Acosh.(x.out_shape)
  | Atanh x              -> Atanh.(x.out_shape)
  | Sqrt x               -> Sqrt.(x.out_shape)
  | Exp x                -> Exp.(x.out_shape)
  | Log x                -> Log.(x.out_shape)
  | Neg x                -> Neg.(x.out_shape)
  | Abs x                -> Abs.(x.out_shape)
  | Floor x              -> Floor.(x.out_shape)
  | Ceil x               -> Ceil.(x.out_shape)
  | Round x              -> Round.(x.out_shape)
  | Relu x               -> Relu.(x.out_shape)
  | Rational x           -> Rational.(x.out_shape)
  | Add x                -> Add.(x.out_shape)
  | Sub x                -> Sub.(x.out_shape)
  | Mul x                -> Mul.(x.out_shape)
  | Div x                -> Div.(x.out_shape)
  | Pow x                -> Pow.(x.out_shape)
  | MatMul x             -> MatMul.(x.out_shape)
  | ReduceSum x          -> ReduceSum.(x.out_shape)
  | ReduceMax x          -> ReduceMax.(x.out_shape)
  | Reshape x            -> Reshape.(x.out_shape)
  | Identity x           -> Identity.(x.out_shape)
  | Split x              -> Split.(x.out_shape)
  | Conv x               -> Conv.(x.out_shape)
  | MaxPool x            -> MaxPool.(x.out_shape)
  | BatchNormalization x -> BatchNormalization.(x.out_shape)
  | _                    -> failwith "out_shape: unsupported op."


let set_out_shape sym shapes =
  match sym with
  | Tensor x             -> x.out_shape <- shapes
  | Variable x           -> x.out_shape <- shapes
  | RandomUniform x      -> x.out_shape <- shapes
  | Sin x                -> x.out_shape <- shapes
  | Cos x                -> x.out_shape <- shapes
  | Tan x                -> x.out_shape <- shapes
  | Asin x               -> x.out_shape <- shapes
  | Acos x               -> x.out_shape <- shapes
  | Atan x               -> x.out_shape <- shapes
  | Sinh x               -> x.out_shape <- shapes
  | Cosh x               -> x.out_shape <- shapes
  | Tanh x               -> x.out_shape <- shapes
  | Asinh x              -> x.out_shape <- shapes
  | Acosh x              -> x.out_shape <- shapes
  | Atanh x              -> x.out_shape <- shapes
  | Sqrt x               -> x.out_shape <- shapes
  | Exp x                -> x.out_shape <- shapes
  | Log x                -> x.out_shape <- shapes
  | Neg x                -> x.out_shape <- shapes
  | Abs x                -> x.out_shape <- shapes
  | Floor x              -> x.out_shape <- shapes
  | Ceil x               -> x.out_shape <- shapes
  | Round x              -> x.out_shape <- shapes
  | Relu x               -> x.out_shape <- shapes
  | Rational x           -> x.out_shape <- shapes
  | Add x                -> x.out_shape <- shapes
  | Sub x                -> x.out_shape <- shapes
  | Mul x                -> x.out_shape <- shapes
  | Div x                -> x.out_shape <- shapes
  | Pow x                -> x.out_shape <- shapes
  | MatMul x             -> x.out_shape <- shapes
  | ReduceSum x          -> x.out_shape <- shapes
  | ReduceMax x          -> x.out_shape <- shapes
  | Reshape x            -> x.out_shape <- shapes
  | Identity x           -> x.out_shape <- shapes
  | Split x              -> x.out_shape <- shapes
  | Conv x               -> x.out_shape <- shapes
  | MaxPool x            -> x.out_shape <- shapes
  | BatchNormalization x -> x.out_shape <- shapes
  | Equal x              -> x.out_shape <- shapes
  | _                    -> failwith "set_out_shape: unsupported op."


(** operaations that only apply to certain symbol *)

let attrs = function
  | Int x                -> Int.(x.attrs)
  | Float x              -> Float.(x.attrs)
  | Complex x            -> Complex.(x.attrs)
  | Tensor x             -> Tensor.(x.attrs)
  | Variable x           -> Variable.(x.attrs)
  | RandomUniform x      -> RandomUniform.(x.attrs)
  | Zero x               -> Zero.(x.attrs)
  | One x                -> One.(x.attrs)
  | NegOne x             -> NegOne.(x.attrs)
  | Pi x                 -> Pi.(x.attrs)
  | Sin x                -> Sin.(x.attrs)
  | Cos x                -> Cos.(x.attrs)
  | Sqrt x               -> Sqrt.(x.attrs)
  | Exp x                -> Exp.(x.attrs)
  | Log x                -> Log.(x.attrs)
  | Rational x           -> Rational.(x.attrs)
  | Neg x                -> Neg.(x.attrs)
  | Relu x               -> Relu.(x.attrs)
  | Add x                -> Add.(x.attrs)
  | Sub x                -> Sub.(x.attrs)
  | Mul x                -> Mul.(x.attrs)
  | Div x                -> Div.(x.attrs)
  | Pow x                -> Pow.(x.attrs)
  | MatMul x             -> MatMul.(x.attrs)
  | ReduceSum x          -> ReduceSum.(x.attrs)
  | ReduceMax x          -> ReduceMax.(x.attrs)
  | Reshape x            -> Reshape.(x.attrs)
  | Identity x           -> Identity.(x.attrs)
  | Split x              -> Split.(x.attrs)
  | Conv x               -> Conv.(x.attrs)
  | MaxPool x            -> MaxPool.(x.attrs)
  | BatchNormalization x -> BatchNormalization.(x.attrs)
  | Equal x              -> Equal.(x.attrs)
  | _                    -> [||]


let set_attrs sym a =
  match sym with
  | Int x                -> x.attrs <- a
  | Float x              -> x.attrs <- a
  | Complex x            -> x.attrs <- a
  | Tensor x             -> x.attrs <- a
  | Variable x           -> x.attrs <- a
  | RandomUniform x      -> x.attrs <- a
  | Zero x               -> x.attrs <- a
  | One x                -> x.attrs <- a
  | NegOne x             -> x.attrs <- a
  | Pi x                 -> x.attrs <- a
  | Sin x                -> x.attrs <- a
  | Cos x                -> x.attrs <- a
  | Sqrt x               -> x.attrs <- a
  | Exp x                -> x.attrs <- a
  | Log x                -> x.attrs <- a
  | Rational x           -> x.attrs <- a
  | Neg x                -> x.attrs <- a
  | Relu x               -> x.attrs <- a
  | Add x                -> x.attrs <- a
  | Sub x                -> x.attrs <- a
  | Mul x                -> x.attrs <- a
  | Div x                -> x.attrs <- a
  | Pow x                -> x.attrs <- a
  | MatMul x             -> x.attrs <- a
  | ReduceSum x          -> x.attrs <- a
  | Reshape x            -> x.attrs <- a
  | Identity x           -> x.attrs <- a
  | Split x              -> x.attrs <- a
  | ReduceMax x          -> x.attrs <- a
  | Conv x               -> x.attrs <- a
  | MaxPool x            -> x.attrs <- a
  | BatchNormalization x -> x.attrs <- a
  | Equal x              -> x.attrs <- a
  | _                    -> ()


let dtype = function
  | Float _         -> SNT_Float
  | Int _           -> SNT_Int32
  | Complex _       -> SNT_Complex32
  | Pi x            -> Pi.(x.dtype)
  | Tensor x        ->
    let (t : tensor) = Tensor.(x.value) in
    t.dtype
  | Variable x      -> Variable.(x.dtype)
  | RandomUniform x -> RandomUniform.(x.dtype)
  | _               -> failwith "owl_symboic_symobl.dtype: not var or constant op"


let shape = function
  | Tensor x        ->
    let (t : tensor) = Tensor.(x.value) in
    t.shape
  | Variable x      -> Variable.(x.shape)
  | RandomUniform x -> RandomUniform.(x.shape)
  | _               -> [||]


let axes = function
  | ReduceSum x -> x.axes
  | _           -> failwith "axes: unsupported op."


let float_value = function
  | Float x -> Float.(x.value)
  | _       -> failwith "owl_symbolic_symbol.float_value"


let int_value = function
  | Int x -> Int.(x.value)
  | _     -> failwith "owl_symbolic_symbol.int_value"


let complex_value = function
  | Complex x -> Complex.(x.real), Complex.(x.img)
  | _         -> failwith "owl_symbolic_symbol.int_value"


let tensor_value = function
  | Tensor x -> Tensor.(x.value)
  | _        -> failwith "owl_symbolic_symbol.tensor_value"


let initializer_ = function
  | Variable x -> Variable.(x.init)
  | _          -> failwith "owl_symbolic_symbol.initializer_"


let compare sx sy =
  let order =
    [| "Zero"
     ; "One"
     ; "NegOne"
     ; "Integer"
     ; "Rational"
     ; "Float"
     ; "Pi"
     ; "Variable"
     ; "Pow"
     ; "Mul"
     ; "Add"
     ; "Sqrt"
     ; "Exp"
     ; "Log"
     ; "Sin"
     ; "Cos"
    |]
  in
  let a = op_type sx in
  let b = op_type sy in
  if Array.mem a order && Array.mem b order
  then (
    let ai = ref 0 in
    let bi = ref 0 in
    Array.iteri
      (fun i x ->
        if x = a then ai := i;
        if x = b then bi := i)
      order;
    !ai - !bi)
  else String.compare a b
