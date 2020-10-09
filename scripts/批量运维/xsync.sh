#!/bin/sh
# https://blog.csdn.net/perfer258/article/details/81433622
# 获取输入参数个数，如果没有参数，直接退出
pcount=$#
if((pcount==0)); then
        echo no args...;
        exit;
fi

# 获取文件名称
p1=$1
fname=`basename $p1`
echo fname=$fname
# 获取上级目录到绝对路径
pdir=`cd -P $(dirname $p1); pwd`
echo pdir=$pdir
# 获取当前用户名称
user=`whoami`
# 循环
for((host=1; host<=3; host++)); do
        echo $pdir/$fname $user@cdh$host:$pdir
        echo ==================cdh$host==================
        rsync -rvl $pdir/$fname $user@cdh$host:$pdir
done

#最后chmod a+x xsync给文件添加执行权限即可。