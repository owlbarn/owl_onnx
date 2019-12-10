(*
 * OWL - OCaml Scientific and Engineering Computing
 * Copyright (c) 2016-2019 Liang Wang <liang.wang@cl.cam.ac.uk>
 *)

(* Add, Sub, Mod, Mul, Div, Neg, Abs, Reciprocal, Floor, Ceil,
Sqrt, Relu, LeakyRelu, ThreasholdedRelu, Selu, Elu, Exp, Log, 
Pow, PRelu, Sigmoid, HardSigmoid, Max, Min, Sum, Mean, Clip, 
Softmax, LogSoftmax, Hardmax, Softsign, Softplus, Gemm, MatMul,
Sin, Cos, Tan, Asin, Acos, Atan, Expand, Sinh, Cosh, Tanh, Asinh, 
Acosh, Atanh, Sign, Erf, QLinearMatMul, MatMulInteger, Cumsum, 
Round, Det 
*)

open Owl_symbolic_types

(* p and q are not specified by user; but rather later calculated in canonical part *)
(* TODO: remove this op *)
module Rational = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    ; mutable p : int
    ; mutable q : int
    }

  let op_type = "Rational"

  let create ?(out_shape = None) name input attrs =
    { name; input; attrs; out_shape; p = 0; q = 0 }
end

(** One input *)

module Sin = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Sin"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Cos = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Cos"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Tan = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Tan"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Asin = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Asin"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Acos = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Acos"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Atan = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Atan"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Sinh = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Sinh"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Cosh = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Cosh"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Tanh = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Tanh"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Asinh = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Asinh"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Acosh = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Acosh"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Atanh = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Atanh"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Sqrt = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Sqrt"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Exp = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Exp"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Log = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Log"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Abs = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Abs"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Neg = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Neg"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Floor = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Floor"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Ceil = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Ceil"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Round = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Round"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Relu = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Relu"

  let create ?name x_name =
    let input = [| x_name |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

(** Two inputs *)

module Add = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
          (* ; mutable pos_scalar : int --> differentiate add (0), scalaradd(-1), and addscalar(1) *)
    }

  let op_type = "Add"

  let create name x y =
    let input = [| x; y |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Sub = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Sub"

  let create name x y =
    let input = [| x; y |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Mul = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Mul"

  let create name x y =
    let input = [| x; y |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Div = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Div"

  let create name x y =
    let input = [| x; y |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Pow = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "Pow"

  let create name x y =
    let input = [| x; y |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end

module Gemm = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "MatMul"

  let create ?(out_shape = None) name input attrs = { name; input; attrs; out_shape }
end

(* Matrix product that behaves like numpy.matmul:
 * https://docs.scipy.org/doc/numpy-1.13.0/reference/generated/numpy.matmul.html *)
module MatMul = struct
  type t =
    { mutable name : string
    ; mutable input : string array
    ; mutable attrs : (string * attrvalue) array
    ; mutable out_shape : int array option
    }

  let op_type = "MatMul"

  let create name x y =
    let input = [| x; y |] in
    let attrs = [||] in
    let name = Owl_symbolic_utils.node_name ?name op_type in
    { name; input; attrs; out_shape = None }
end
