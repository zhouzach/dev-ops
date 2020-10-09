# https://stackoverflow.com/questions/1494178/how-to-define-hash-tables-in-bash

declare -A animals

animals=(["moo"]="cow" ["woof"]="dog")

declare -A animals1=(["moo"]="cow" ["woof"]="dog")

# Then use them just like normal arrays. Use

# animals['key']='value' to set value

# "${animals[@]}" to expand the values

#"${!animals[@]}" (notice the !) to expand the keys

#Don't forget to quote them:

echo "${animals[moo]}"
for sound in "${!animals[@]}";
do echo "$sound - ${animals[$sound]}"; done
