#!/usr/bin/env bash
# trinityDeNovo.sh

# Get the list of left reads and store as $leftReads
leftReads="$(ls -q Paired/C*.R1.fastq)"

# Store echo of $leftReads as $leftReads to get rid of line breaks
leftReads=$(echo $leftReads)

# Replace spaces in the list of reads with comma
leftReads="${leftReads// /,}"

# Get the list of right reads and store as $rightReads
rightReads="$(ls -q Paired/C*.R2.fastq)"

# Store echo of $rightReads as $rightReads to get rid of line breaks
rightReads=$(echo $rightReads)

# Replace spaces in the list of reads with comma
rightReads="${rightReads// /,}"

outdir="salmon"

# Build de-novo assembly with Trinity
nice -n19 /usr/local/programs/trinityrnaseq-Trinity-v2.8.4/util/align_and_estimate_abundance.pl \
--seqType fq \
--samples_file samples.txt \
--transcripts trinity_de-novo/Trinity.fasta \
--est_method salmon \
--trinity_mode \
--prep_reference \
1>salmon.log 2>salmon.err &
