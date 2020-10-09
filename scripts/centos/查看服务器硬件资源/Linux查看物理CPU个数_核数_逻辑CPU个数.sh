
#有几核（逻辑cpu个数）,就显示几条记录
cat /proc/cpuinfo |grep "model name" && cat /proc/cpuinfo |grep "physical id"
#或者
top后按数字1,多个cpu的话会显示多个








# 总核数 = 物理CPU个数 X 每颗物理CPU的核数
# 总逻辑CPU数 = 物理CPU个数 X 每颗物理CPU的核数 X 超线程数

# 查看物理CPU个数
cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l

# 查看每个物理CPU中core的个数(即核数)，总核数 = 物理CPU个数 X 每颗物理CPU的核数
cat /proc/cpuinfo| grep "cpu cores"| uniq

# 查看逻辑CPU的个数, 总逻辑CPU数 = 物理CPU个数 X 每颗物理CPU的核数 X 超线程数
cat /proc/cpuinfo| grep "processor"| wc -l