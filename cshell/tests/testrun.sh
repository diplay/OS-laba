echo "Номер теста,Требования,Строка запуска,Объекты ФС,Код возврата,Сообщение,Объекты ФС,Вердикт"
TESTS=`ls`
TIMESTAMP=`date +%s`
while [ -e $TIMESTAMP ]
do
	let TIMESTAMP++
done
mkdir $TIMESTAMP
cp ../append-to-end.sh append-to-end.sh
chmod +x append-to-end.sh
cd $TIMESTAMP
for x in $TESTS
do
	if [ `expr match $x "test[0-9]*\.sh"` -ne 0 ]
	then
		chmod +x ../$x
		../$x
	fi
done
cd ..
rm -rf $TIMESTAMP
