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


delete()
{

    return 0
}


count()
{

    return 0
}

#check if theres any arguments from the command line

#If no arguments are passed:
if [ $# -ne 1 ]; then
	echo "success $0"
    
    #Then we are in interactive mode:
    #Prompt the user for commands and assign them to the input string array
    read -p "Enter command: " check cmd argLine
    echo"$check $cmd $argLine"
    #LOOP til input is quit
        #Execute commands



        #Prompt the user for commands and assign them to the input string array

    #END LOOP

else
	echo "fail"
    #Load command line arguments 
	

    #Execute commands

fi #End If

#exit program
