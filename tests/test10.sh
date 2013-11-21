TEST_NUMBER=10
TEST_REQUIREMENTS="3.1.4"
TEST_FOLDER="test$TEST_NUMBER"
FS_INPUT=""
FS_OUTPUT=""
WRONG_FILENAME="wrong?"
RUN_COMMAND="append-to-end.sh lol lol $WRONG_FILENAME"
#Prepare
mkdir $TEST_FOLDER
cd $TEST_FOLDER
#Execution
OUTPUT_STRING=`../../$RUN_COMMAND`
OUTPUT_CODE=$?
#Check

#Clear
cd ..
rm -r $TEST_FOLDER
#Output
echo "$TEST_NUMBER,$TEST_REQUIREMENTS,$RUN_COMMAND,$FS_INPUT,$OUTPUT_CODE,$OUTPUT_STRING,$FS_OUTPUT"
