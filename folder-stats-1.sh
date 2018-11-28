#!/bin/sh

  echo "the way is $fpath"
  let "filenum = 0"
  let "dirnum = 0"
  let "hiddenDir = 0"
  for dir in ${fpath}/*
  do
    if [ -d "$dir"]
    then
    let "dirnum+=1"
    elif [ -f "$dir" ]
    then
    let "filenum+=1"
    fi
    case $dir in
      .*)
      let "hiddenDir+=1"
    esac
done

totaldirnum=`ls -al |grep '^d'| wc -l`
totalfilenum=`ls -al|grep '^-'|wc -l`
echo "bash$ ./folder-stats-1.sh public_html"
echo "Directories found: $dirnum (plus $[ $totaldirnum - $dirnum -2] hidden)"
echo "Files found: $filenum (plus $[ $totalfilenum - $filenum ] hidden)"
echo "Total files and directories is $[ $totaldirnum + $totalfilenum + 2 ]"
