
# https://stackoverflow.com/questions/4247068/sed-command-with-i-option-failing-on-mac-but-works-on-linux

# 每行行尾添加,

# on MAC:
# Note missing space after -i option! (Necessary for GNU sed)
sed -i'' -e 's/$/,/' test.txt
sed -i'.bak' -e 's/$/,/' test.txt


# on centos:
sed -i 's/$/,/' test.txt