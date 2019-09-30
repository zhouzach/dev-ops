
https://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/

sudo lsof -i -P -n | grep LISTEN
sudo lsof -i:22
sudo ss -nltw | grep 9090