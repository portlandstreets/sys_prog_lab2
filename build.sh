#!/bin/bash
set -e

g++ -O0 -g -fno-omit-frame-pointer matrix_baseline.cpp -o prog_baseline
g++ -O3 -mavx2 -mfma -g -fno-omit-frame-pointer matrix_optimized.cpp -o prog_optimized

g++ -O0 -S -masm=intel matrix_baseline.cpp -o asm_baseline.s
g++ -O3 -mavx2 -mfma -S -masm=intel matrix_optimized.cpp -o asm_optimized.s

echo "Збірка завершена!"
