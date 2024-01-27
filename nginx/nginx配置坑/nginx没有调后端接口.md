

https://stackoverflow.com/questions/23948527/13-permission-denied-while-connecting-to-upstreamnginx



setsebool httpd_can_network_connect on



You can see a list of all available SELinux booleans for httpd using

getsebool -a | grep httpd