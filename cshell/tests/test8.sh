TEST_NUMBER=8
TEST_REQUIREMENTS="3.1.3"
TEST_FOLDER="test$TEST_NUMBER"
FS_INPUT=""
FS_OUTPUT=""
WRONG_FILENAME="cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc"
RUN_COMMAND="append-to-end.sh lol $WRONG_FILENAME lol"
OUTPUT_STRING_EXPECTED="Wrong filename format"
OUTPUT_CODE_EXPECTED=22

#Prepare
mkdir $TEST_FOLDER
cd $TEST_FOLDER
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
rm -r $TEST_FOLDER
#Output
echo "$TEST_NUMBER,$TEST_REQUIREMENTS,$RUN_COMMAND,$FS_INPUT,$OUTPUT_CODE,$OUTPUT_STRING,$FS_OUTPUT,$VERDICT"
