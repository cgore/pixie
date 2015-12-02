(ns pixie.math
  (:require [pixie.ffi-infer :as i]))

(i/with-config {:library "m"
                :cxx-flags ["-lm"]
                :includes ["math.h"]}
  (i/defcfn acos)
  (i/defcfn asin)
  (i/defcfn atan)
  (i/defcfn atan2)
  (i/defcfn cos)
  (i/defcfn cosh)
  (i/defcfn sin)
  (i/defcfn sinh)
  (i/defcfn tanh)
  (i/defcfn exp)
  (i/defcfn ldexp)
  (i/defcfn log)
  (i/defcfn log10)
  ;(i/defcfn modf) ;; Needs ffi support
  (i/defcfn pow)
  (i/defcfn sqrt)
  (i/defcfn ceil)
  (i/defcfn fabs)
  (i/defcfn floor)
  (i/defcfn fmod)

  (i/defcfn fpclassify)
  (i/defcfn isfinite)          ; Non-zero return => finite.
  (i/defcfn isinf)             ; Non-zero return => infinite.
  (i/defcfn isnan)             ; Non-zero return => NaN.
  (i/defcfn isnormal)          ; Non-zero return => normal FP.
  (i/defconst FP_INFINITE)     ; Indicates that x is an infinite number.
  (i/defconst FP_NAN)          ; Indicates that x is not a number (NaN).
  (i/defconst FP_NORMAL)       ; Indicates that x is a normalized number.
  (i/defconst FP_SUBNORMAL)    ; Indicates that x is a denormalized number.
  (i/defconst FP_ZERO)         ; Indicates that x is zero (0 or -0).

  (i/defconst M_E)             ; base of natural logarithm, e
  (i/defconst M_LOG2E)         ; log2(e)
  (i/defconst M_LOG10E)        ; log10(e)
  (i/defconst M_LN2)           ; ln(2)
  (i/defconst M_LN10)          ; ln(10)
  (i/defconst M_PI)            ; pi
  (i/defconst M_PI_2)          ; pi / 2
  (i/defconst M_PI_4)          ; pi / 4
  (i/defconst M_1_PI)          ; 1 / pi
  (i/defconst M_2_PI)          ; 2 / pi
  (i/defconst M_2_SQRTPI)      ; 2 / sqrt(pi)
  (i/defconst M_SQRT2)         ; sqrt(2)
  (i/defconst M_SQRT1_2))      ; sqrt(1/2)

(def finite?
  "Returns true if n is a finite number, false otherwise."
  [n]
  (-> n isfinite zero? not))

(def infinite?
  "Returns true if n is an infinite number, false otherwise."
  [n]
  (-> n isinf zero? not))

(def nan?
  "Returns true if n is a NaN, false otherwise."
  (-> n isnan zero? not))

(def normalized?
  "Returns true if n is a normalized floating point number, false otherwise."
  [n]
  (-> n isnormal zero? not))

(def denormalized?
  "Returns true if n is a denormalized floating point number, false otherwise."
  [n]
  (= FP_SUBNORMAL (fpclassify n)))
