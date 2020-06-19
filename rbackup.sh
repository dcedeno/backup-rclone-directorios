#!/bin/bash

array=(dir1 dir2 dir3 dir4)
hoy=`date +%Y-%m-%d`

for i in "${array[@]}"
do
	tar -czvf $hoy-$i.tar.gz /home/backup/$i/
	rclone copy $hoy-$i.tar.gz remote:/dir_$i/
	rm $hoy-$i.tar.gz 
done
