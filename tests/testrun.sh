echo "Номер теста,Требования,Строка запуска,Объекты ФС,Код возврата,Сообщение,Объекты ФС,Вердикт"
TESTS=`ls`
for x in $TESTS
do
	if [ `expr match $x "test[0-9]*\.sh"` -ne 0 ]
	then
		chmod 777 $x
		./$x
	fi
done
