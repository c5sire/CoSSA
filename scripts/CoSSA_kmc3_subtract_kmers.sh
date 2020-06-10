#!/bin/bash

############################
# check for usage
############################
display_usage()
{
   echo -e "\nUsage:\n$0 path_to/sample1 path_to/sample2\n" 1>&2
}
# if less than required arguments supplied, display usage
if [  $# -ne 2 ]
then
   display_usage
   exit 1
fi
# check whether user had supplied -h or --help . If yes display usage
if [[ ( $# == "--help") ||  $# == "-h" ]]
then
   display_usage
   exit 0
fi

##########################################
# subtraction of kmers
##########################################
# in case the sample name with the kmc extension is given
infile1=$(echo "$1" | sed 's/\.kmc_...//')
infile2=$(echo "$2" | sed 's/\.kmc_...//')
# extract file name
sample1="$(basename -- $infile1)"
sample2="$(basename -- $infile2)"

### run kmc_tools substract kmers of sample1 with kmers of sample2 to obtain sample1 specific kmers
kmc_tools -t 5 simple ${infile1} ${infile2} kmers_subtract ${sample1}.${sample2}.subtract

