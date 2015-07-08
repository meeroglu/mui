#!/bin/sh

echo this is freshcopy func
freshCopy()
{
  git clone $1
  reponame=$(echo $url | awk -F/ '{print $NF}' | sed -e 's/.git$//');
  cd $reponame 
  git init
  git add .
  
}

repoSync()
{
git fetch $1 $2
git merge $1/$2
}
remoteAdd()
{
git remote add $1 $2
}

pushRepo()
{
git push $1 $2
}




#freshCopy git@github.com:muicss/mui.git
#remoteAdd first git@github.com:meeroglu/first.git
#remoteAdd second git@github.com:meeroglu/second.git
#pushRepo first master
#pushRepo second master
#repoSync first master second master
#pushRepo second master

#repoSync first master
#repoSync second master
#pushRepo first master
pushRepo second master
#exit
