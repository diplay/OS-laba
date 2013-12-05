TEST_NUMBER=17
TEST_REQUIREMENTS="3.2.4"
TEST_FOLDER="test$TEST_NUMBER"
FS_INPUT='"./testdir/lol.BBB 777\n./testdir/testadd -"'
FS_OUTPUT=""
RUN_COMMAND="append-to-end.sh testdir lol testadd"
OUTPUT_STRING_EXPECTED="Cannot find ADD file"
OUTPUT_CODE_EXPECTED=6
#Prepare
mkdir $TEST_FOLDER
cd $TEST_FOLDER
mkdir testdir
touch testdir/lol.BBB
chmod 777 testdir/lol.BBB
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
