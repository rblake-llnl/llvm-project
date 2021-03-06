//===-- call_apsr.S - Helpers for ARM EABI floating point tests -----------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements helpers for ARM EABI floating point tests for the
// compiler_rt library.
//
//===----------------------------------------------------------------------===//

#include "../../../../lib/builtins/assembly.h"

.syntax unified
// __attribute__((pcs("aapcs")))
// int32_t call_apsr_d(double a, double b, void(*fn)(double, double)) {
//   fn(a, b);
//   return apsr;
// }

DEFINE_COMPILERRT_PRIVATE_FUNCTION(call_apsr_d)
    push {r7, lr}
    ldr r7, [sp, #8]
    blx r7
    mrs r0, apsr
    pop {r7, pc}
END_COMPILERRT_FUNCTION(call_apsr_d)

// __attribute__((pcs("aapcs")))
// int32_t call_apsr_f(float a, float b, void(*fn)(float, float)) {
//   fn(a, b);
//   return apsr;
// }

DEFINE_COMPILERRT_PRIVATE_FUNCTION(call_apsr_f)
    push {lr}
    blx r2
    mrs r0, apsr
    pop {pc}
END_COMPILERRT_FUNCTION(call_apsr_f)
