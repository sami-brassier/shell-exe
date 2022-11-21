CDate=$(date +%d-%m-%y-%H:%M)
CFile=number_connection-$CDate.log
last sami | wc -l > ./$CFile
tar -czvf ./$CFile.tar.gz ./
rm $CFile
