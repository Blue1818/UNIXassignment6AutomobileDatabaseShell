#!/bin/bash
	# Dale Westberg z1910234
	# CSCI 330
	# Assignment #3
	# 9/18/20
#define fuctions:

#This function is used to create a new database file. It takes up to two parameters:
#$1 The filename to use for the new database file. This must be specified
#$2 The label to put on the first line of the new database file.
#   If not specified, use "Untitled database" instead.
new () 
{
    local input=$2
    #Pipe input into file named $1:
    echo $input > $1
    echo "New database created"
    return 0
}

#This function is used to add a record to an existing database file.
#It will always take five parameters. If any of them are missing, it is an error.
# The filename of the database to add the record to.
# 2) The make of the car to be stored in this new record. It is a string that must be longer than zero
# characters.
# 3) The model of the car to be stored in this new record. It is a string that must be longer than zero
# characters.
# 4) The year of the car to be stored in this new record. It must be a four-digit number, greater than
# 187 0 and smaller than 2025.
# 5) The color of the car to be stored in this new record. It is a string that must be longer than zero
# characters.
add ()
{
    testfile $1
    local printImg
    printf -v printImg "%s, %s, %4d, %s" "$2" "$3" $4 "$5"
    #print printImg to file
    echo "$printImg" >> $1


    echo "Successfully added a record to the database"
    return 0
}

paramCheck ()
{
    # local check
    # local error="error"
    # echo ${$1:?error} < check
    # if [ check = "error" ]
    # then
    #     return 1
    # fi
    # echo ${$2:?error} < check
    # if [ check = "error" ]
    # then
    #     return 2
    # fi
    # echo ${$3:?error} < check
    # if [ check = "error" ]
    # then
    #     return 3
    # fi
    # echo ${$4:?error} < check
    # if [ check = "error" ]
    # then
    #     echo flag1
    #     return 4
    # fi
    # echo ${$5:?error} < check
    # if [ check = "error" ]
    # then
    #     echo flag5
    #     return 5
    # fi
    return 0
}

# This will take up to four parameters, depending on the value of the second.
# 1) The filename of the database to show the record(s) from. Must be the filename of a readable file.
# 2) how many to show (one of all, single, or range)
show ()
{
    testfile $1
    # This function is used to show record(s) found in an existing database.
    
    #case statement for mode
    case "$2" in
#         all - Show all of the records, example follows:
# Automobile Database
# Ford, Mustang, 2008, blue with white stripes
# Mitsubishi, Lancer, 2009, white
# Toyota, Camry LE, 2004, black
# Porsche, Cayenne S, 2007, red
        #print file ($1) to standard output
        all) cat $1
        ;;
        # – single - Shows the single record in the position indicated by the third parameter. Notice that
        # record #1 is on the second line, after the label.
        
        single) 
        local val
        local temp=$(($3 + 1))
        printf -v val "%d p" $temp
        sed -n -e "$val" $1
        ;;
        # – range - Show the records in the range starting at the position indicated by the third parameter,
        # up to and including the record indicated by the fourth.
        range) 
        local val1
        local temp1=$(($3 + 1))
        local temp2=$(($4 + 1))
        printf -v val1 "%d, %d p" $temp1 $temp2
        sed -n "$val1" $1
        ;;
    esac


    return 0
}

#This function is used to delete records from an existing database.
# 1) The filename of the database to delete record(s) from. Must be the filename of file readable and
# writable by the current user..
# 2) how many to show (one of all, single, or range)
delete ()
{
    testfile $1
    case "$2" in
#   – all - Delete all of the records, but not the label for the database.
        all)
        sed -n -e '1p' $1 > tempFile
        cat 'tempFile' > $1
        echo "All records deleted"
        ;;
#   – single - Delete the single record in the position indicated by the third parameter. Notice that
#   record #1 is on the second line, after the label. It is an error to try to delete a record number that
#   does not exist.
        single)
        local val
        local temp=$(($3 + 1))
        printf -v val "%d !p" $temp
        sed -n -e "$val" $1 > tempFile
        cat 'tempFile' > $1
        echo "1 record deleted"
        ;;
#   – range - Delete the records in the range starting at the position indicated by the third parameter,
#   up to and including the record indicated by the fourth.
        range)
        local val1
        local temp1=$(($3 + 1))
        local temp2=$(($4 + 1))
        printf -v val1 "%d,%dd" $temp1 $temp2
        sed "$val1" $1 > tempFile
        cat 'tempFile' > $1
        echo $(($temp2 - $temp1 + 1)) "records deleted"
        ;;
    esac

    #Delete temp file.
    rm 'tempFile'

    return 0
}

# This function is used to count and print the number of rows in an existing database. It has
# one parameter, which is not optional.
count ()
{
    testfile $1
    local temp
    local trash
    wc -l $1 > tempFile
    read temp trash < 'tempFile'
    echo "$temp"
    rm 'tempFile'
    return 0
}

testfile () 
{
    if [ $# -gt 0 ]; then
        #if [[ -f $1 && -r ]]; then
        if [ -f $1 && -r ]; then
            #echo "$1 is a readable file"
            return 0
        else
            echo "$1 is not a readable file"
            exit
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

#COME BACK TO INTERACTIVE MODE***
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
    # head=0
    # for parm
    # do
    #     #if its the first, assign to dbname
    #     if [ $head -eq 0 ]
    #     then
    #         dbname=$parm
    #     #if its the second, assign to cmd 
    #     elif [ $head -eq 1 ]
    #     then
    #         cmd=$parm
    #     else
    #     #else assign to param array
    #     param[$head]=$parm
    #     fi
    #     head=$((head + 1))
    # done
    dbname="$1"
    cmd="$2"
    param[0]="$3"
    param[1]="$4"
    param[2]="$5"
    param[3]="$6"
    #Execute commands
    $cmd $dbname "${param[0]}" "${param[1]}" "${param[2]}" "${param[3]}"
fi #End If

#exit program
