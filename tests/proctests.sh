#!/bin/bash
for x in `ls`
do
	if [ `expr match $x "test[0-9]*\.sh"` != 0 ]
	then
		./proctests.pl $x > "../cshell/tests/$x"
	fi
done
