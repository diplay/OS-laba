TEST_NUMBER=21
TEST_REQUIREMENTS="3.2.6"
TEST_FOLDER="test$TEST_NUMBER"
FS_INPUT='"./testdir/testwhat.BBB 555\n./testdir/lol 777"'
FS_OUTPUT=""
RUN_COMMAND="append-to-end.sh testdir testwhat lol"
OUTPUT_STRING_EXPECTED="Cannot write to WHAT file"
OUTPUT_CODE_EXPECTED=8
#Prepare
mkdir $TEST_FOLDER
cd $TEST_FOLDER
mkdir testdir
touch testdir/testwhat.BBB
chmod 555 testdir/testwhat.BBB
touch testdir/lol
chmod 777 testdir/lol
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
