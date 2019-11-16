#!/usr/bin/env python3

### Eval option 1: onnxruntime 
import numpy as np 
import onnxruntime as rt

sess = rt.InferenceSession("test.onnx")
input_name_x = sess.get_inputs()[0].name
input_name_y = sess.get_inputs()[1].name

input_shape_x = sess.get_inputs()[0].shape
input_x = np.ones(input_shape_x).astype(np.float32)
input_y = y = np.asarray(3., dtype="float32")
pred_onx = sess.run(None, {input_name_x: input_x, input_name_y: input_y}) [0]
print(pred_onx)

### Expected result:
"""
[array([[3.841471, 3.841471, 3.841471],
        [3.841471, 3.841471, 3.841471]], dtype=float32)]
"""