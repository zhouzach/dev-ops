#!/usr/bin/env bash

ps aux | sort -k4nr |head -n 10

查看进程使用的内存:
top -p pid
或
cat /proc/pid/status