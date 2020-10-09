
printf -v file "%02d" 9
echo $file

echo "==========="


num1=`echo 9 |awk '{printf("%02d\n",$0)}'`
echo $num1