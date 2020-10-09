# https://stackoverflow.com/questions/1783405/how-do-i-check-out-a-remote-git-branch

# 1.To fetch a branch, you simply need to:
git fetch origin

#2.This will fetch all of the remote branches for you. You can see the branches available for checkout with:
git branch -v -a

#3.With the remote branches in hand, you now need to check out the branch you are interested in,
# giving you a local working copy:
git checkout -b test origin/test
# or the shorthand
git checkout -t origin/test