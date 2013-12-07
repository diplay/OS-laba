#!/bin/csh
echo "Номер теста,Требования,Строка запуска,Объекты ФС,Код возврата,Сообщение,Объекты ФС,Вердикт"
set TESTS=`ls`
set TIMESTAMP=`date +%s`
while ( -e $TIMESTAMP )
	let TIMESTAMP++
end
mkdir $TIMESTAMP
cp ../append-to-end.sh append-to-end.sh
chmod +x append-to-end.sh
cd $TIMESTAMP
foreach x ($TESTS)
	if ( `expr match $x "test[0-9]*\.sh"` != 0 ) then
		chmod +x ../$x
		../$x
		if ( $status != 0 ) then
			exit
		endif
	endif
end
cd ..
rm -rf $TIMESTAMP
