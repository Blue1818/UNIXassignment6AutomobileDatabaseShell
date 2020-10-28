#!/bin/bash

#define fuctions:

#This function is used to create a new database file. It takes up to two parameters:
#$1 The filename to use for the new database file. This must be specified
#$2 The label to put on the first line of the new database file.
#   If not specified, use "Untitled database" instead.
new () 
{

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

pram[0]=1
pram[1]=2
pram[2]=3
pram[3]=$1
echo ${pram[0]} ${pram[1]} ${pram[2]} "${pram[3]}"
return 0
#check if theres any arguments from the command line
if [ $# -eq 0 ]
then
#If no arguments are passed:
    #Then we are in interactive mode:
    #Prompt the user for commands and assign them to the input string array
    read -p "Enter command: " dbname cmd argLine
    
    #LOOP til input is quit
    while [ dbname = "quit" ]
    do 
        #Execute commands



        #Prompt the user for commands and assign them to the input string array
        read -p "Enter command: " dbname cmd argLine
    #END LOOP
    done

else
	echo "fail"
    #Load command line arguments 
	

    #Execute commands

fi #End If

#exit program
