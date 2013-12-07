#!/bin/csh
set TEST_NUMBER=20
set TEST_REQUIREMENTS="3.2.6"
set TEST_FOLDER="test$TEST_NUMBER"
set FS_INPUT='./testdir/testwhat.BBB 111\n./testdir/lol 777""'
set FS_OUTPUT=""
set RUN_COMMAND="append-to-end.sh testdir testwhat lol"
set OUTPUT_STRING_EXPECTED="Cannot write to WHAT file"
set OUTPUT_CODE_EXPECTED=8
#Prepare
mkdir $TEST_FOLDER
cd $TEST_FOLDER
mkdir testdir
touch testdir/testwhat.BBB
chmod 111 testdir/testwhat.BBB
touch testdir/lol
chmod 777 testdir/lol
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
