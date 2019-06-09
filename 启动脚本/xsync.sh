#!/bin/bash

pcount=$#
#1 获取输入参数个数，如果没有参数，直接退出
if((pcount==0))
then
	echo 'no args';
	exit;
fi

#2 获取文件名称
p1=$1
fname=`basename $1`
echo fname=$fname

#3 获取上级目录到绝对路径
pdir=`cd -P $(dirname $1); pwd`
echo pdir=$pdir

#4 获取当前用户名称
user=`whoami`

for host in hadoop103 hadoop104
do
	echo '========== $host =========='
	rsync -rvl $pdir/$fname $user@$host:$pdir/
done
