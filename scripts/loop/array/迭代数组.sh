# https://stackoverflow.com/questions/8880603/loop-through-an-array-of-strings-in-bash


## declare an array variable
declare -a arr=("element1" "element2" "element3")

## now loop through the above array
# 使用 @ 符号可以获取数组中的所有元素
for i in "${arr[@]}"
do
   echo "$i"
   # or do whatever with individual element of the array
done

# You can access them using echo "${arr[0]}", "${arr[1]}" also






for databaseName in a b c d e f; do
  echo ${databaseName}
  # do something like: echo $databaseName
done

for Item in Item1 \
            Item2 \
            Item3 \
            Item4
  do
    echo $Item
  done



List=(
      Item1
      Item2
      Item3
     )

echo ${List[*]}

for Item in ${List[*]}
  do
    echo $Item
  done

# Create a function to go through a list:
Loop(){
  for item in ${*} ;
    do
      echo ${item}
    done
}
Loop ${List[*]}

declare -a List=(
                 "element 1"
                 "element 2"
                 "element 3"
                )
for entry in "${List[@]}"
   do
     echo "$entry"
   done

# Creating an associative array. A dictionary:
declare -A continent

continent[Vietnam]=Asia
continent[France]=Europe
continent[Argentina]=America

for item in "${!continent[@]}";
  do
    printf "$item is in ${continent[$item]} \n"
  done

# CVS variables or files in to a list.
List="Item 1,Item 2,Item 3"
Backup_of_internal_field_separator=$IFS
IFS=,
for item in $List;
  do
    echo $item
  done
IFS=$Backup_of_internal_field_separator



List=()
Start_count=0
Step_count=0.1
Stop_count=1
for Item in `seq $Start_count $Step_count $Stop_count`
    do
       List+=(Item_$Item)
    done
for Item in ${List[*]}
    do
        echo $Item
    done


cat <<EOF> List_entries.txt
Item1
Item 2
'Item 3'
"Item 4"
Item 7 : *
"Item 6 : * "
"Item 6 : *"
Item 8 : $PWD
'Item 8 : $PWD'
"Item 9 : $PWD"
EOF


List=$(cat List_entries.txt)
echo $List
echo "$List"
echo ${List[*]}
echo "${List[*]}"
echo ${List[@]}
echo "${List[@]}"