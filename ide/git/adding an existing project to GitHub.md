
https://help.github.com/articles/adding-an-existing-project-to-github-using-the-command-line/


echo "# presto-common" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:zhouzach/presto-common.git
git push -u origin main

git pull origin master master --allow-unrelated-histories
git push -u origin master
上面命令将本地的master分支推送到origin主机，同时指定origin为默认主机，后面就可以不加任何参数使用git push了。



Git global setup
git config --global user.name "sj.zachzhou"
git config --global user.email "zach.zhou@infinivision.io"

Create a new repository
git clone git@gitlab-ex.mcd.com.cn:cdp/feature-engineering.git
cd feature-engineering
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master
Push an existing folder
cd existing_folder
git init
git remote add origin git@gitlab-ex.mcd.com.cn:cdp/feature-engineering.git
git add .
git commit -m "Initial commit"
git push -u origin master
Push an existing Git repository
cd existing_repo
git remote rename origin old-origin
git remote add origin git@gitlab-ex.mcd.com.cn:cdp/feature-engineering.git
git push -u origin --all
git push -u origin --tags