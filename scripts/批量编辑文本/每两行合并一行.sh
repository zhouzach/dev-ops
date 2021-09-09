
# https://www.dovov.com/9668.html
seq 10 | sed 'N;s/\n/ /'

#虽然看起来以前的解决scheme是可行的，但如果在文档中出现单个exception，输出将会变成碎片。 下面有点安全。

 seq 10 | sed -n '/KEY/{ N s/\n/ /p }' somefile.txt