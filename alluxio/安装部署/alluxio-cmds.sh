
./bin/alluxio format

# In one of the master nodes, start the Alluxio cluster with the following command:
# This will start Alluxio masters on all the nodes specified in conf/masters,
# and start the workers on all the nodes specified in conf/workers.
# Argument SudoMount indicates to mount the RamFS on each worker using sudo privilege,
# if it is not already mounted.
./bin/alluxio-start.sh all SudoMount



#To determine the leading master, run:
# visit http://<LEADER_HOSTNAME>:19999 to see the status page of the Alluxio leading master.
./bin/alluxio fs leader




./bin/alluxio-stop.sh all