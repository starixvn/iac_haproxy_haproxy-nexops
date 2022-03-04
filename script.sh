#! /bin/bash
str="configs/uat1/nexops-tools.cfg" | IFS="/ " read -r -a array <<< "$str" | echo ${array[1]}