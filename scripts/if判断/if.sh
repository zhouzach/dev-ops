
# https://blog.csdn.net/shenhuxi_yu/article/details/53047012

#  [-n string] or [string] “string”的长度为非零non-zero则为真
if [ ! -n "$var" ]; then
  echo "$var is empty"
  exit 0
fi

# [-z string] “string”的长度为零则为真
SELF="$(cd $(dirname $BASH_SOURCE) && pwd)"
if [ -z "$SPARK_CONF_DIR" ]; then
  export SPARK_CONF_DIR="$SELF"
fi


#如果文件夹不存在，创建文件夹
if [ ! -d "/myfolder" ]; then
  mkdir /myfolder
fi

# [-f file] 如果file存在且是一个普通文件则为真
if [ -f "$SELF/classpath.txt" ]; then
  export SPARK_DIST_CLASSPATH=$(paste -sd: "$SELF/classpath.txt")
fi