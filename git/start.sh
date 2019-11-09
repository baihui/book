#/bin/bash
 
for f in `ps -aux|grep "gitbook serve" | awk '{print $2}'`
do	

echo "进程ID：${f}"	
nums=`netstat -nap | grep ${f} | awk '{print $4}' | grep 4000`

echo "端口: ${nums}"

if [ "$nums" != "" ];then
   echo " close  ${f}"	
   kill -9 ${f}
   break;
fi

kill -9 ${f}

done

gitbook serve &



