#!/bin/bash

WHERE=$1
WHAT="$2.BBB"
ADD=$3

FORBIDDEN_REGEXP='.*[\\\/\:\*\?\"\<\>\|\#].*'

if [ $# -ne 3 ]
then
	echo "Wrong number of parameters"
	exit 1
fi

if [[ "$WHERE" =~ ($FORBIDDEN_REGEXP) ]] || [ ${#WHERE} -gt 255 ]
then
	echo "Wrong filename format"
	exit 21
fi

if [[ "$WHAT" =~ ($FORBIDDEN_REGEXP) ]] || [ ${#WHAT} -gt 255 ]
then
	echo "Wrong filename format"
	exit 22
fi

if [[ "$ADD" =~ ($FORBIDDEN_REGEXP) ]] || [ ${#ADD} -gt 255 ]
then
	echo "Wrong filename format"
	exit 23
fi

if [ ! -d $WHERE ]
then
	echo "Subdirectory doesn't exist"
	exit 3
fi

if [ ! -r "$WHERE" ]
then
	echo "Cannot read subdirectory"
	exit 9
fi

if [ ! -w $WHERE ]
then
	echo "Cannot write to subdirectory"
	exit 4
fi

if [ ! -e "$WHERE/$WHAT" ] && [ -x $WHERE ]
then
	echo "PATH = $WHERE" > "$WHERE/$WHAT"
elif [ ! -e "$WHERE/$WHAT" ]
then
	echo "Cannot create file in subdirectory"
	exit 5
fi

if [ ! -e "$WHERE/$ADD" ]
then
	echo "Cannot find ADD file"
	exit 6
fi

if [ ! -r "$WHERE/$ADD" ]
then
	echo "Cannot read ADD file"
	exit 7
fi

if [ ! -w "$WHERE/$WHAT" ]
then
	echo "Cannot write to WHAT file"
	exit 8
fi

echo `cat $WHERE/$ADD` >> "$WHERE/$WHAT"
exit 0
