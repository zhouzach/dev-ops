
https://my.oschina.net/am313/blog/865915
1.Prefix-Command前置操作：所有下面介绍的快捷键，都必须以前置操作开始。tmux默认的前置操作是CTRL+b。例如，我们想要新建一个窗体，
就需要先在键盘上摁下CTRL+b，松开后再摁下n键。

2.修改前置键：
vi ~/.tmux.conf:
set -g prefix C-a #
unbind C-b # C-b即Ctrl+b键，unbind意味着解除绑定
bind C-a send-prefix # 绑定Ctrl+a为新的指令前缀

# 从tmux v1.6版起，支持设置第二个指令前缀
set-option -g prefix2 ` # 设置一个不常用的`键作为指令前缀，按键更快些


3.To reload the current tmux configuration, run:
tmux source-file ~/.tmux.conf

在控制台中输入这条命令就可以创建一个名为work的会话并进入它，我们也可以同时指定这个会话中第一个窗口的名字，比如MySQL：
tmux new-session -s work -n mysql

关于会话有两个非常重要的操作，即attach和detach，attach就是让某个会话到前台来运行，而detach则是将某个会话放到后台。通常，
当我们打开tmux时，tmux在创建一个会话的同时也会attach到这个会话，所以我们会立即看到tmux的窗口。在某个会话中，我们按C-b d会detach这个
会话，也就会回到原先的终端控制台，但实际上并没有退出这个会话，比如你可以通过在终端中输入下列命令重新attach到work会话：

tmux attach -t work

在我们创建会话的同时也可以加上-d选项以表示不自动attach到这个新会话：

tmux new-session -s presto -d
tmux new-session -s spark -d

tmux ls
看到新创建的work会话

tmux attach -t work
attach到该会话中。

tmux kill-session -t work
在控制台上可以通过下列命令关闭会话work

以tmux打头的命令都是tmux提供的外部接口，是在命令行中供我们直接运行的，事实上，除了对会话的操作之外，在外部也可以直接创建窗口，例如：
tmux new-window -n project -t work
这条命令可以针对work会话创建一个名为project的窗口。

在创建会话和窗口时甚至可以指定要执行的命令：

tmux new-session -s work -n dev -d "ssh user@example.com"
以上命令会在创建work会话后，在其第一个窗口的控制台中执行SSH命令以远程连接到服务器中。

创建窗口时也与此类似，可将命令写在最后。

更为强大的是，tmux可以让你向某个会话[:窗口:面板]发送任意按键：

tmux send-keys -t work:editor 'emacs' C-m
上述命令能够向work会话的editor窗口发送emacs加回车，即在这个窗口中打开emacs编辑器。

有了tmux的各种强大的外部命令，我们就可以自定义脚本，自动化很多事情：

tmux new-session -s work -n mysql -d 'mysql'
tmux new-window -n editor -t work
tmux send-keys -t work:editor 'emacs' C-m
将上述命令写在一个shell脚本里，就可以一键完成下述功能：创建一个名为work的会话，第一个窗口命名为mysql，并在其中执行mysql命令进入mysql，
第二个窗口名为editor，并在其中打开emacs。


