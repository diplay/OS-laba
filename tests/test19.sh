TEST_NUMBER=19
TEST_REQUIREMENTS="3.2.5"
TEST_FOLDER="test$TEST_NUMBER"
FS_INPUT=""
FS_OUTPUT=""
RUN_COMMAND="append-to-end.sh testdir lol testadd"
OUTPUT_STRING_EXPECTED="Cannot read ADD file"
OUTPUT_CODE_EXPECTED=7
#Prepare
mkdir $TEST_FOLDER
cd $TEST_FOLDER
mkdir testdir
touch testdir/lol.BBB
chmod 777 testdir/lol.BBB
touch testdir/testadd
chmod 333 testdir/testadd
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
