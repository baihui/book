#!/bin/bash  
pd=$(pwd) 
for f in $(ls -F |grep "/$") 
  do 
      cd ../$f 
      echo "$(git pull)" 
      echo "$(git add * && git commit -a -m 'publish' )" 
      echo "$(git push)" 
      gitbook build . ${pd}/${f}
 done

cd ${pd}

echo "$(git add *)" 

git commit -a -m 'publish'

git push -f 

