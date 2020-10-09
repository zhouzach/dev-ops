# https://stackoverflow.com/questions/1251999/how-can-i-replace-a-newline-n-using-sed

# on centos:

# cat test.txt
# 22
# 32
# 42
sed -i ':a;N;$!ba;s/\n/ /g' test.txt

# cat test.txt
# 22 32 42




# 换行符替换空格
sed -i 's/ /\n/g' test.txt
