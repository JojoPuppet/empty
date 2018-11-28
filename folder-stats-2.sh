#!/bin/sh
  echo "the way is $fpath"
  let "filenum = 0"
test
test
test
test
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
echo "bash$ ./folder-stats-2.sh public_html"
echo "Directories found: $dirnum (plus $[ $totaldirnum - $dirnum -2] hidden)"
echo "Files found: $filenum (plus $[ $totalfilenum - $filenum ] hidden)"
echo "Total files and directories is $[ $totaldirnum + $totalfilenum + 2 ]"
echo "Permissions for public_html: drwxrwxrwx"
ls -al | grep '^d'
ls -al | grep '^-'
find /dcs/18/u1821870/public_html/cs133/lab5 ! -type f -perm 644
find /dcs/18/u1821870/public_html/cs133/lab5 ! -type d -perm 777
ls -al | sed -i 'N;4atest' folder-stats-2.sh
for dir in ${fpath}/*
do
  if [ -d "$dir" ]
  then
    chmod 777 $dir
  elif [ -f "$dir" ]
  then
    chmod 644 $dir
  fi
done
echo "Directories public_html has the wrong permission: drwxrwxrwx
This has been changed to: drwxr-xr-x
File CS133/lab1.html has the wrong permission: -rwxr-xrwx
This has been changed to: -rw-r--r--"
