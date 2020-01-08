
https://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/

sudo lsof -i -P -n | grep LISTEN
sudo lsof -i:22
sudo ss -nltw | grep 9090




https://www.cnblogs.com/sparkdev/p/8421897.html
ss 常用选项
-h, --help 帮助
-V, --version  显示版本号
-t, --tcp 显示 TCP 协议的 sockets
-u, --udp 显示 UDP 协议的 sockets
-x, --unix 显示 unix domain sockets，与 -f 选项相同
-n, --numeric 不解析服务的名称，如 "22" 端口不会显示成 "ssh"
-l, --listening 只显示处于监听状态的端口
-p, --processes 显示监听端口的进程(Ubuntu 上需要 sudo)
-a, --all 对 TCP 协议来说，既包含监听的端口，也包含建立的连接
-r, --resolve 把 IP 解释为域名，把端口号解释为协议名称