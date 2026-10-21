#!/bin/bash
set -e

echo "Заміри для неоптимізованого коду"
/usr/bin/time -v -o time_baseline.txt ./prog_baseline
perf stat -d -o stat_baseline.txt ./prog_baseline
perf record -F 99 -g -o perf_base.data -- ./prog_baseline
perf report -i perf_base.data --stdio > perf_report_baseline.txt

echo "Заміри для оптимізованого коду"
/usr/bin/time -v -o time_optimized.txt ./prog_optimized
perf stat -d -o stat_optimized.txt ./prog_optimized
perf record -F 999 -g -o perf_opt.data -- ./prog_optimized
perf report -i perf_opt.data --stdio > perf_report_optimized.txt

echo "Статистику зібрано!"
