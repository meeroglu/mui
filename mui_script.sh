#!/bin/sh
echo this is begining of script 
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
git add .
git commit -m "updated"
git checkout master
}
remoteAdd()
{
git remote add $1 $2
}
pushRepo()
{
git push $1 $2
}

#if ! git diff-index --quiet HEAD --; then
# echo "Degisiklik bulunan dosyalar:"
#    git diff HEAD~~1 --name-only
# echo "first repositorydeki deigiklikler aliniyor"
#   repoSync first master
# echo "second repositorydeki degisiklikler aliniyor"
#   repoSync second master
# echo "first repo sync ediliyor"
#   pushRepo first master
# echo "second repo sync ediliyor"
#   pushRepo second master
# echo "synchronization tamamlandi"
#else
#   echo "there is no changed file"

#fi

if ! git --git-dir="/dir/.git" diff --quiet; then

     echo "repositorylerden birinde degisiklik var "
     echo "bu degisiklikler aliniyor"
repoSync first master
repoSync second master
     echo "Degisikler alindi repolar sync ediliyor "
pushRepo first master
     echo "first repo sync edildi"
     echo "second repo sync ediliyor"
pushRepo second master
     echo "second repo sync edildi"			
else
     echo "no changed file in repos"
fi

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
#pushRepo second master
exit
