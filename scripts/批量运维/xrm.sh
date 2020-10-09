#!/bin/sh

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

declare -a hosts=("cdh1" "cdh2" "cdh3" "cdh4")

## now loop through the above array
# 使用 @ 符号可以获取数组中的所有元素
for host in "${hosts[@]}"
do
        echo $pdir/$fname
        echo ==================$user@$host==================
  ssh $user@$host "rm -rf $pdir/$fname"
done

#最后chmod a+x xrm给文件添加执行权限即可。