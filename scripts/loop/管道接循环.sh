
# https://stackoverflow.com/questions/1521462/looping-through-the-content-of-a-file-in-bash

cat peptides.txt | while read line
do
   # do something with $line here
   echo $line
done

# and the one-liner variant:
cat peptides.txt | while read line; do echo $line; done
# These options will skip the last line of the file if there is no trailing line feed.
# You can avoid this by the following:

cat peptides.txt | while read line || [[ -n $line ]];
do
   # do something with $line here
   echo $line
done