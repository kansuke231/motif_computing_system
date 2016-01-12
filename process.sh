#!/bin/bash

DIR_PATH=$(cd $(dirname $0) && pwd)

for filepath in ${DIR_PATH}/gml/*.gml; do
   fname_ext="${filepath##*/}"
   fname="${fname_ext%.*}"
   echo $fname; 
   seq 10 | parallel python gml_to_edgelist.py $filepath rewire ${DIR_PATH}/rewire_edgelist/${fname}_{}.txt;
   for input_file in ${DIR_PATH}/rewire_edgelist/*.txt; do   
      in_fname_ext="${input_file##*/}"
      in_fname="${in_fname_ext%.*}"
      ./pgd -f $input_file --macro ${DIR_PATH}/outdir/${in_fname}.txt;
      rm $input_file;
   done
done

