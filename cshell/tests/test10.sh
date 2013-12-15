#!/bin/csh
set TEST_NUMBER=10
set TEST_REQUIREMENTS="3.1.4"
set TEST_FOLDER="test$TEST_NUMBER"
set FS_INPUT=""
set FS_OUTPUT=""
set WRONG_FILENAME='wrong?'
set RUN_COMMAND="append-to-end.sh lol lol $WRONG_FILENAME"
set OUTPUT_STRING_EXPECTED="Wrong filename format"
set OUTPUT_CODE_EXPECTED=23
#Prepare
mkdir $TEST_FOLDER
cd $TEST_FOLDER
#Execution
set OUTPUT_STRING=`../../append-to-end.sh lol lol "wrong?"`
set OUTPUT_CODE=$status
#Check
if ( ( "$OUTPUT_STRING" == "$OUTPUT_STRING_EXPECTED" ) && ( $OUTPUT_CODE == $OUTPUT_CODE_EXPECTED ) ) then
	set VERDICT="Ok"
else
	set VERDICT="Fail"
endif
#Clear
cd ..
rm -r $TEST_FOLDER
#Output
echo "$TEST_NUMBER,$TEST_REQUIREMENTS,$RUN_COMMAND,$FS_INPUT,$OUTPUT_CODE,$OUTPUT_STRING,$FS_OUTPUT,$VERDICT"
