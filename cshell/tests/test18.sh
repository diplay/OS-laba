#!/bin/csh
set TEST_NUMBER=18
set TEST_REQUIREMENTS="3.2.5"
set TEST_FOLDER="test$TEST_NUMBER"
set FS_INPUT='"./testdir/lol.BBB 777\n./testdir/testadd 222"'
set FS_OUTPUT=""
set RUN_COMMAND="append-to-end.sh testdir lol testadd"
set OUTPUT_STRING_EXPECTED="Cannot read ADD file"
set OUTPUT_CODE_EXPECTED=7
#Prepare
mkdir $TEST_FOLDER
cd $TEST_FOLDER
mkdir testdir
touch testdir/lol.BBB
chmod 777 testdir/lol.BBB
touch testdir/testadd
chmod 222 testdir/testadd
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
