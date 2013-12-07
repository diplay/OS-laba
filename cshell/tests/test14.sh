#!/bin/csh
set TEST_NUMBER=14
set TEST_REQUIREMENTS="3.2.2"
set TEST_FOLDER="test$TEST_NUMBER"
set FS_INPUT="./testdir 444"
set FS_OUTPUT=""
set RUN_COMMAND="append-to-end.sh testdir lol lol"
set OUTPUT_STRING_EXPECTED="Cannot write to subdirectory"
set OUTPUT_CODE_EXPECTED=4
#Prepare
mkdir $TEST_FOLDER
cd $TEST_FOLDER
mkdir testdir
chmod 444 testdir
#Execution
set OUTPUT_STRING=`../../$RUN_COMMAND`
set OUTPUT_CODE=$status
#Check
if ( ( "$OUTPUT_STRING" == "$OUTPUT_STRING_EXPECTED" ) && ( $OUTPUT_CODE == $OUTPUT_CODE_EXPECTED ) ) then
set 	VERDICT="Ok"
else
set 	VERDICT="Fail"
endif
#Clear
cd ..
rm -rf $TEST_FOLDER
#Output
echo "$TEST_NUMBER,$TEST_REQUIREMENTS,$RUN_COMMAND,$FS_INPUT,$OUTPUT_CODE,$OUTPUT_STRING,$FS_OUTPUT,$VERDICT"
