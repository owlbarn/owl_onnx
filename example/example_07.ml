open Owl_symbolic
open Infix
open Op

let dnn =
  let x = variable ~shape:[| 100; 3; 32; 32 |] "X" in
  let t_conv0 =
    conv
      x
      (random_uniform ~low:(-0.138) ~high:0.138 [| 32; 3; 3; 3 |])
      "SAME"
      [| 1; 1 |]
      [| 1; 1 |]
  in
  let t_zero0 =
    let flt_val = Array.make 32 0. in
    let t = Type.make_tensor ~flt_val [| 32 |] in
    tensor t
  in
  let t_relu0 = relu (t_conv0 + t_zero0) in
  let t_maxpool0 = maxpool t_relu0 [| 2; 2 |] [| 2; 2 |] "VALID" [| 1; 1 |] in
  let t_shape0 =
    let t = Type.make_tensor ~dtype:SNT_Int64 ~int_val:[| 100; 8192 |] [| 2 |] in
    tensor t
  in
  let t_reshape0 = reshape t_maxpool0 t_shape0 in
  let t_rand0 = random_uniform ~low:(-0.0011) ~high:0.0011 [| 8192; 512 |] in
  let t_zero1 =
    let flt_val = Array.make 512 0. in
    let t = Type.make_tensor ~flt_val [| 1; 512 |] in
    tensor t
  in
  let t_relu1 = relu ((t_reshape0 *@ t_rand0) + t_zero1) in
  let t_rand1 = random_uniform ~low:(-0.00419) ~high:0.00419 [| 512; 10 |] in
  let t_zero2 =
    let flt_val = Array.make 10 0. in
    let t = Type.make_tensor ~flt_val [| 1; 10 |] in
    tensor t
  in
  let t_add2 = (t_relu1 *@ t_rand1) + t_zero2 in
  let t_exp0 = exp (t_add2 - (reduce_max t_add2 [| 1 |])) in
  t_exp0 / (reduce_sum t_exp0 [| 1 |])


let g = SymGraph.make_graph [| dnn |] "sym_graph"
let onnx_graph = ONNX_Engine.of_symbolic g
let _ = ONNX_Engine.save onnx_graph "test.onnx"