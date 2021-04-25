#!/usr/bin/env bash
# trinityDeNovo.sh

# Build de-novo assembly with Trinity
nice -n19 /usr/local/programs/trinityrnaseq-Trinity-v2.8.4/Analysis/DifferentialExpression/define_clusters_by_cutting_tree.pl \
--Ptree 60 -R diffExpr.P1e-4_C3.matrix.RData
