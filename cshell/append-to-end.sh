#!/bin/csh

set WHERE="$1"
set WHAT="$2.BBB"
set ADD="$3"

set FORBIDDEN_REGEXP='.*[\\\/\:\*\?\"\<\>\|\#].*'

if ( $#argv != 3 ) then
	echo "Wrong number of parameters"
	exit 1
endif

if ( ( `expr "$WHERE" : "$FORBIDDEN_REGEXP"` != 0 )  || ( `echo "$WHERE" | awk '{print length($0)}'` > 255 ) ) then
	echo "Wrong filename format"
	exit 21
endif

if ( ( `expr "$WHAT" : "$FORBIDDEN_REGEXP"` != 0 )  || ( `echo "$WHAT" | awk '{print length($0)}'` > 255 ) ) then
	echo "Wrong filename format"
	exit 21
endif

if ( ( `expr "$ADD" : "$FORBIDDEN_REGEXP"` != 0 )  || ( `echo "$ADD" | awk '{print length($0)}'` > 255 ) ) then
	echo "Wrong filename format"
	exit 21
endif

if ( ! -d $WHERE ) then
	echo "Subdirectory doesn't exist"
	exit 3
endif

if ( ! -r "$WHERE" ) then
	echo "Cannot read subdirectory"
	exit 9
endif

if ( ! -w $WHERE ) then
	echo "Cannot write to subdirectory"
	exit 4
endif

if ( ( ! -e "$WHERE/$WHAT" ) && ( -x $WHERE ) ) then
	echo "PATH = $WHERE" > "$WHERE/$WHAT"
else if ( ! -e "$WHERE/$WHAT" ) then
	echo "Cannot create file in subdirectory"
	exit 5
endif

if ( ! -e "$WHERE/$ADD" ) then
	echo "Cannot find ADD file"
	exit 6
endif

if ( ! -r "$WHERE/$ADD" ) then
	echo "Cannot read ADD file"
	exit 7
endif

if ( ! -w "$WHERE/$WHAT" ) then
	echo "Cannot write to WHAT file"
	exit 8
endif

echo `cat $WHERE/$ADD` >> "$WHERE/$WHAT"
exit 0
