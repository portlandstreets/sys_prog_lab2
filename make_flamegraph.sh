#!/bin/bash
set -e

FG="./FlameGraph"

echo "FlameGraph Baseline photo"
perf script -i perf_base.data | "$FG/stackcollapse-perf.pl" | "$FG/flamegraph.pl" > flamegraph_baseline.svg

echo "FlameGraph Optimized photo"
perf script -i perf_opt.data | "$FG/stackcollapse-perf.pl" | "$FG/flamegraph.pl" > flamegraph_optimized.svg

echo "Графіки flamegraph_baseline.svg та flamegraph_optimized.svg згенеровано!"
