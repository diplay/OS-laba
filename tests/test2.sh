TEST_NUMBER=2
TEST_REQUIREMENTS="3.1.1"
TEST_FOLDER="test$TEST_NUMBER"
FS_INPUT=""
FS_OUTPUT=""
RUN_COMMAND="append-to-end.sh lol"
mkdir $TEST_FOLDER
cd $TEST_FOLDER
OUTPUT_STRING=`../../$RUN_COMMAND`
OUTPUT_CODE=$?
cd ..
rm -r $TEST_FOLDER
echo "$TEST_NUMBER,$TEST_REQUIREMENTS,$RUN_COMMAND,$FS_INPUT,$OUTPUT_CODE,$OUTPUT_STRING,$FS_OUTPUT"
