
# https://stackoverflow.com/questions/4247068/sed-command-with-i-option-failing-on-mac-but-works-on-linux

# https://blog.csdn.net/sunzhengtaolz/article/details/90354860
# 原因是Mac中用i命令进行替换时，强制要求备份 sed -i '一个路径'
# 如果不想备份，可以直接使用 sed -i ''

###############
# 每行行尾添加 #
###############

# on MAC:
# Note missing space after -i option! (Necessary for GNU sed)
sed -i'' -e 's/$/,/' test.txt
sed -i'.bak' -e 's/$/,/' test.txt


# on centos:
sed -i 's/$/,/' test.txt

###############
# 每行行头添加 #
###############
# on MAC:
# Note missing space after -i option! (Necessary for GNU sed)
sed -i'' -e 's/^/./' gg.txt