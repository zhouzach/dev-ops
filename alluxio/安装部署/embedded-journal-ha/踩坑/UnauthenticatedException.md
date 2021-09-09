
Caused by: alluxio.shaded.client.io.grpc.StatusRuntimeException: UNAUTHENTICATED: Plain authentication failed: Failed to authenticate client user="root" connecting to Alluxio server and impersonating as impersonationUser="hdfs" to access Alluxio file system. User "root" is not configured to allow any impersonation. Please read the guide to configure impersonation at https://docs.alluxio.io/os/user/2.4/en/operation/Security.html

vim conf/alluxio-site.properties
alluxio.master.security.impersonation.root.users=*