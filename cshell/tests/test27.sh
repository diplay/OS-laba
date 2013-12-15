#!/bin/csh
set TEST_NUMBER=27
set TEST_REQUIREMENTS="3.3.1"
set TEST_FOLDER="test$TEST_NUMBER"
set FS_INPUT='"./testdir/testwhat.BBB -\n./testdir/testadd содержит строку «This text will be appended»"'
set RUN_COMMAND="append-to-end.sh testdir testwhat testadd"
set OUTPUT_STRING_EXPECTED=""
set OUTPUT_CODE_EXPECTED=0
#Prepare
mkdir $TEST_FOLDER
cd $TEST_FOLDER
mkdir testdir
echo "This text will be appended" > testdir/testadd
echo "PATH = testdir" > testfile
cat testdir/testadd >> testfile
#Execution
set OUTPUT_STRING=`../../$RUN_COMMAND`
set OUTPUT_CODE=$status
set FS_OUTPUT='\"./testdir/testwhat.BBB содержит строку «'`cat testdir/testwhat.BBB`'»'
set FS_OUTPUT=`echo $FS_OUTPUT`'\n./testdir/testadd содержит строку «'`cat testdir/testadd`'»\"'
#Check
if ( ( "$OUTPUT_STRING" == "$OUTPUT_STRING_EXPECTED" ) && ( $OUTPUT_CODE == $OUTPUT_CODE_EXPECTED ) ) then
	diff testdir/testwhat.BBB testfile > /dev/null
	if ( $status == 0 ) then
		set VERDICT="Ok"
	else
		set VERDICT="Fail(append)"
	endif
else
	set VERDICT="Fail"
endif
#Clear
cd ..
rm -rf $TEST_FOLDER
#Output
printf "$TEST_NUMBER,$TEST_REQUIREMENTS,$RUN_COMMAND,$FS_INPUT,$OUTPUT_CODE,$OUTPUT_STRING,$FS_OUTPUT,$VERDICT\n"
