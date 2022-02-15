
 https://www.ruanyifeng.com/blog/2020/08/rsync.html
 -a参数可以替代-r，除了可以递归同步以外，还可以同步元信息（比如修改时间、权限等）。由于 rsync 默认使用文件大小和修改时间决定文件是否需要更新，
 所以-a比-r更有用。下面的用法才是常见的写法。
 
 $ rsync -a source destination
 目标目录destination如果不存在，rsync 会自动创建。执行上面的命令后，源目录source被完整地复制到了目标目录destination下面，
 即形成了destination/source的目录结构。
 
 如果只想同步源目录source里面的内容到目标目录destination，则需要在源目录后面加上斜杠。
 
 $ rsync -a source/ destination
 上面命令执行后，source目录里面的内容，就都被复制到了destination目录里面，并不会在destination下面创建一个source子目录。
 
 
 https://www.cnblogs.com/MikeZhang/p/rsyncExample_20160818.html
 数据同步:
 rsync -avzP --delete SRC DEST
 参数说明：
 -a 参数，相当于-rlptgoD（-r 是递归 -l 是链接文件，意思是拷贝链接文件；-p 表示保持文件原有权限；-t 保持文件原有时间；-g 保持文件原有用户组；-o 保持文件原有属主；-D 相当于块设备文件）；
 -z 传输时压缩；
 -P 传输进度；
 -v 传输时的进度等信息