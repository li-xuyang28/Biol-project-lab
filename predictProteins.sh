#!/usr/bin/env bash
# predictProteins.sh

# Predict proteins using trans decoder TransDecoder.Predict
/usr/local/programs/TransDecoder-5.0.1/TransDecoder.Predict \
        -t trinity_de-novo/Trinity.fasta \
        --retain_pfam_hits pfam.domtblout \
        --retain_blastp_hits blastp.outfmt6 \
        1>predict.log 2>predict.err &
