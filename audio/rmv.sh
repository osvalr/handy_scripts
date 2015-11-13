#!/bin/bash

# Record My Voice
# Usage: rmv [file_name]
#        rma [file_name] [project_dir_name]
#

project_dir="/home/$USER/Downloads"
if [ $# -eq 2 ]; then
        if ! [ -d ${project_dir}/$2 ]; then
                mkdir ${project_dir}/$2
        fi
        project_dir="${project_dir}/${2}"
fi
file_name=${project_dir}/${1}.wav
if [ -f $file_name ]; then
        rm $file_name;
        echo "$file_name existed, deleted!"
fi
avconv -f pulse -i default $file_name
