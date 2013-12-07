#!/bin/csh
set TEST_NUMBER=1
set TEST_REQUIREMENTS="3.1.1"
set TEST_FOLDER="test$TEST_NUMBER"
set FS_INPUT=""
set FS_OUTPUT=""
set RUN_COMMAND="append-to-end.sh"
set OUTPUT_STRING_EXPECTED="Wrong number of parameters"
set OUTPUT_CODE_EXPECTED=1
#Prepare
mkdir $TEST_FOLDER
cd $TEST_FOLDER
#Execution
set OUTPUT_STRING=`../../$RUN_COMMAND`
set OUTPUT_CODE=$status
#Check
if ( ( "$OUTPUT_STRING" == "$OUTPUT_STRING_EXPECTED" ) && ( $OUTPUT_CODE == $OUTPUT_CODE_EXPECTED ) ) then
set 	VERDICT="Ok"
else
set 	VERDICT="Fail"
endif
#Clean
cd ..
rm -r $TEST_FOLDER
#Output
echo "$TEST_NUMBER,$TEST_REQUIREMENTS,$RUN_COMMAND,$FS_INPUT,$OUTPUT_CODE,$OUTPUT_STRING,$FS_OUTPUT,$VERDICT"
