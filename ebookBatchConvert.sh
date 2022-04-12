#!/bin/bash

# the purpose of this script is to allow for batch conversion of ebook and other formats with ebook-convert
# requires ebook-tools
# Usage: ebook-convert input_file output_file [options]

# check for ebook-tools on system. If not present, prompt to install (research package manager integration) 

# get "$inputFileType" and "$outputFileType" from user

read -p "Enter Input File Type [Include '.'] : " inputFileType
read -p "Enter Output File Type [Include '.'] : " outputFileType

# "$inputFileType" and "$outputFileType" must include the . in the file type
# add input filtering and exeption handling next

# remove '.' from outputFileType and make directory for converted files to be stored in
mkdir "${outputFileType//.}"

# need to test what happens if dir already exists

# for every file run ebook-convert and pass through the file name to the output_file variable
#also set output_file to be saved in the directory that was just made
 for file in *"$inputFileType"; do
   ebook-convert ./"$file" ./"${outputFileType//.}"/"${file%"$inputFileType"}"$outputFileType""
 done
 
