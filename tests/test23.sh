TEST_NUMBER=23
TEST_REQUIREMENTS="3.2.7"
TEST_FOLDER="test$TEST_NUMBER"
FS_INPUT="./testdir  333"
FS_OUTPUT=""
RUN_COMMAND="append-to-end.sh testdir lol lol"
OUTPUT_STRING_EXPECTED="Cannot read subdirectory"
OUTPUT_CODE_EXPECTED=9
#Prepare
mkdir $TEST_FOLDER
cd $TEST_FOLDER
mkdir testdir
chmod 333 testdir
#Execution
OUTPUT_STRING=`../../$RUN_COMMAND`
OUTPUT_CODE=$?
#Check
if [ "$OUTPUT_STRING" = "$OUTPUT_STRING_EXPECTED" ] && [ $OUTPUT_CODE -eq $OUTPUT_CODE_EXPECTED ]
then
	VERDICT="Ok"
else
	VERDICT="Fail"
fi
#Clear
cd ..
rm -rf $TEST_FOLDER
#Output
echo "$TEST_NUMBER,$TEST_REQUIREMENTS,$RUN_COMMAND,$FS_INPUT,$OUTPUT_CODE,$OUTPUT_STRING,$FS_OUTPUT,$VERDICT"
