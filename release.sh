#!/bin/bash


pd=$(pwd)
for f in $(ls -F |grep "/$")
  do

      echo "$(cd $f )...........................${f}......................."
      echo "$(git pull)"
      echo "$(git add * && git commit -a -m 'publish' )"
      echo "$(git push)"
      echo "$(gitbook build . ${pd} && cd $pd )..........build完成.............."
      echo "$(git add $f && git commit -a -m 'publish' )"
      echo "$(git push)" 
      
      
  done
 
