#!/usr/bin/env bash
# trimAll.sh

# file path variable
fastqPath="/home/li.xuya/BIOL2309/CReads/"

# left and right  reads file suffix
leftSuffix=".R1.fastq"
rightSuffix=".R2.fastq"
pairedOutPath="Paired/"
unpairedOutPath="Unpaired/"

#Create output directories
mkdir -p $pairedOutPath
mkdir -p $unpairedOutPath

#Loop through all left-read fastq files in file path
function trimAll {
    for leftInFile in $fastqPath*$leftSuffix
    do
        pathRemoved="${leftInFile/$fastqPath/}"
        sampleName="${pathRemoved/$leftSuffix/}"
        echo $sampleName
        nice -n19 java -jar /usr/local/programs/Trimmomatic-0.36/trimmomatic-0.36.jar PE \
        -threads 1 -phred33 \
        $fastqPath$sampleName$leftSuffix \
        $fastqPath$sampleName$rightSuffix \
        $pairedOutPath$sampleName$leftSuffix \
        $unpairedOutPath$sampleName$leftSuffix \
        $pairedOutPath$sampleName$rightSuffix \
        $unpairedOutPath$sampleName$rightSuffix \
        HEADCROP:0 \
        ILLUMINACLIP:/usr/local/programs/Trimmomatic-0.36/adapters/TruSeq3-PE.fa:2:30:10 \
        LEADING:20 TRAILING:20 SLIDINGWINDOW:4:30 MINLEN:36
    done
}
trimAll 1>trimAll.log 2>trimAll.err
