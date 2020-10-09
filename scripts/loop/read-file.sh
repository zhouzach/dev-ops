
# https://stackoverflow.com/questions/1521462/looping-through-the-content-of-a-file-in-bash
#One way to do it is:

while read p; do
  echo "$p"
done <peptides.txt
#As pointed out in the comments, this has the side effects of trimming leading whitespace, interpreting backslash sequences, and skipping the last line if it's missing a terminating linefeed. If these are concerns, you can do:

while IFS="" read -r p || [ -n "$p" ]
do
  printf '%s\n' "$p"
done < peptides.txt
#Exceptionally, if the loop body may read from standard input, you can open the file using a different file descriptor:

while read -u 10 p; do
  ...
done 10<peptides.txt
#Here, 10 is just an arbitrary number (different from 0, 1, 2).