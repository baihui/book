#!/bin/bash  
pd=$(pwd) 
for f in $(ls -F |grep "/$") 
  do 
 
      echo "$(cd $f )...........................${f}......................." 
      echo "$(git pull)" 
      echo "$(git add * && git commit -a -m 'publish' )" 
      echo "$(git push)" 
      echo "build $(gitbook build . ${pd})/${f}"
 done

cd ${pd}

echo "$(git add *)" 

git commit -a -m 'publish'

git push -f 

