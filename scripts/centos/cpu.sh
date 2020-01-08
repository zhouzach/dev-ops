#!/usr/bin/env bash

ps aux | sort -k3nr |head -n 10

# http://c.biancheng.net/view/996.html
# sort 选项:
# -f：忽略大小写；
# -b：忽略每行前面的空白部分；
# -n：以数值型进行排序，默认使用字符串排序；
# -r：反向排序；
# -u：删除重复行。就是 uniq 命令；
# -t：指定分隔符，默认分隔符是制表符；
# -k [n,m]：按照指定的字段范围排序。从第 n 个字段开始，到第 m 个字（默认到行尾）；