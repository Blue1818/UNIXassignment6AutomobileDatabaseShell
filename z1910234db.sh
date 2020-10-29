#!/bin/bash

#define fuctions:

#This function is used to create a new database file. It takes up to two parameters:
#$1 The filename to use for the new database file. This must be specified
#$2 The label to put on the first line of the new database file.
#   If not specified, use "Untitled database" instead.
new () 
{
    #touch $1
    echo flag
    local space=" "
    local input=$2$3$4$5$6
    #input=${input:1:${#input}-2}
    echo $input > $1
    return 0
}


add ()
{
    
    return 0
}


show ()
{

    return 0
}


delete ()
{

    return 0
}


count ()
{

    return 0
}

testfile () 
{
    if [ $# -gt 0 ]; then
        #if [[ -f $1 && -r ]]; then
        if [ -f $1 && -r ]; then
            echo "$1 is a readable file"
        else
            echo "$1 is not a readable file"
        fi
    fi
}

#Passes in argument Line and parses it into a global array of strings called param[]
# parseCmd ()
# {
#     #Varables:
#     #numC = number of characters in argument line.
#     local numC=${#1}
#     #Array of integers for index of spaces.
#     local index
#     #Total number of arguments (Global varable)
#     numArg=0

#     for parm
#     do
#         param[$numArg]=$parm
#         numArg=$(($numArg + 1))
#     done
# }

# setParam ()
# {
#     if [ ${param1:0:1} -eq "\"" ]
#     then
#         while [ ${param}]
#     fi
# }

#THIS WORKS! the "string" quote stays in $3 when called as "$3"
# echo $1 $2 $4 "$3" 
# echo $*

#check if theres any arguments from the command line
if [ $# -eq 0 ]
then
#If no arguments are passed:
    #Then we are in interactive mode:
    #Prompt the user for commands and assign them to the input string array
    read -p "Enter command: " dbname cmd param1 param2
    echo "$param1"
    exit
    #LOOP til input is quit
    until [ $dbname = "quit" ]
    do 
        # case "$param1" in
        #     new) new $dbname $param1
        #     ;;
        #     add) setParam $param1 4; add $dbname $param1 $param2 $param3 $param4
        #     ;;
        
        # esac
        $cmd $dbname $param1 $param2 $param3 $param4
        #Prompt the user for commands and assign them to the input string array
        read -p "Enter command: " dbname cmd param1
    #END LOOP
    done
else
    #Load command line arguments
    head=0
    for parm
    do
        #if its the first, assign to dbname
        if [ $head -eq 0 ]
        then
            dbname=$parm
        #if its the second, assign to cmd 
        elif [ $head -eq 1 ]
        then
            cmd=$parm
        else
        #else assign to param array
        param[$head]=$parm
        fi
        head=$((head + 1))
    done
    #Execute commands
    $cmd $dbname ${param[0]} ${param[2]} ${param[3]} ${param[4]} ${param[5]}
fi #End If

#exit program
