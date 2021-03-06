#!/bin/csh
set TEST_NUMBER=6
set TEST_REQUIREMENTS="3.1.2"
set TEST_FOLDER="test$TEST_NUMBER"
set FS_INPUT=""
set FS_OUTPUT=""
set WRONG_FILENAME='wh\$\/\*ere'
set RUN_COMMAND="append-to-end.sh $WRONG_FILENAME lol lol"
set OUTPUT_STRING_EXPECTED="Wrong filename format"
set OUTPUT_CODE_EXPECTED=21

#Prepare
mkdir $TEST_FOLDER
cd $TEST_FOLDER
#Execution
set OUTPUT_STRING=`../../append-to-end.sh wh\$\/\*ere lol lol`
set OUTPUT_CODE=$status
#Check
if ( ( "$OUTPUT_STRING" == "$OUTPUT_STRING_EXPECTED" ) && ( $OUTPUT_CODE == $OUTPUT_CODE_EXPECTED ) ) then
set 	VERDICT="Ok"
else
set 	VERDICT="Fail"
endif
#Clear
cd ..
rm -r $TEST_FOLDER
#Output
echo "$TEST_NUMBER,$TEST_REQUIREMENTS,$RUN_COMMAND,$FS_INPUT,$OUTPUT_CODE,$OUTPUT_STRING,$FS_OUTPUT,$VERDICT"
