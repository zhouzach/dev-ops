
https://stackoverflow.com/questions/70538578/flink-1-13-2-noresourceavailableexception


I meet this problem and my solution is : configure the file 'conf/flink-conf.yaml'

taskmanager.numberOfTaskSlots: 1
change to

taskmanager.numberOfTaskSlots: 30
this slots depend on how much running tasks