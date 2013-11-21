TEST_NUMBER=4
TEST_REQUIREMENTS="3.1.2"
TEST_FOLDER="test$TEST_NUMBER"
FS_INPUT=""
FS_OUTPUT=""
THREE_HUNDRED="aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
RUN_COMMAND="append-to-end.sh $THREE_HUNDRED lol lol"
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
