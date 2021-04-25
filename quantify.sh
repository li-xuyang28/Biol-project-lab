#!/usr/bin/env bash
# trinityDeNovo.sh

# Build de-novo assembly with Trinity
nice -n19 /usr/local/programs/trinityrnaseq-Trinity-v2.8.4/util/abundance_estimates_to_matrix.pl --est_method salmon \
--out_prefix Trinity \
--name_sample_by_basedir \
--quant_files quant_files.list \
--gene_trans_map trinity_de-novo/Trinity.fasta.gene_trans_map
