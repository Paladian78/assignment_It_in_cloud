#! /bin/bash
# name of the file that contains both the certificates
check_file="cert.txt"
file=0
if [ -f $check_file ]
then
while IFS=' ' read -r line
do
    if [[ $line == *"tls.crt"* ]]
    then file=1
        continue
    fi
    if [[ $file == 1 ]]
    then
        if [[ $line == *"ending"* ]]
        then file=0
        fi
        echo $line >> tls.crt
    fi

    
    if [[ $line == *"tls.key"* ]]
    then file=2
        continue
    fi
    if [[ $file == 2 ]]
    then
        if [[ $line == *"ending"* ]]
        then file=0
        fi
        echo $line >> tls.key
    fi
done < cert.txt
else echo "file does not exists"
fi