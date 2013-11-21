echo "Номер теста,Требования,Строка запуска, Объекты ФС, Код возврата, Сообщение, Объекты ФС"
TESTS=`ls`
for x in $TESTS
do
	if [ `expr match $x "test[0-9]*\.sh"` -ne 0 ]
	then
		chmod 777 $x
		echo `./$x`
	fi
done
