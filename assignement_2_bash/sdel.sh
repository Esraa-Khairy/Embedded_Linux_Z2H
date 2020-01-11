#!bash: /bin/bash

clear

if [ -e ~/TRASH ]
then
	:
else
	mkdir -p ~/TRASH
	chmod 777 ~/TRASH
 	(crontab -l 2>/dev/null; echo "*/30 * * * * sdel.sh") | crontab - 
fi

find ~/TRASH -type f -mtime +2 -exec rm -f {} \; 


for file in "$@"
do 
	if file $file | grep -q 'compressed ' 
		then 
			echo "$file is already compresses "
	else
		gzip $file*
	fi
	mv $file* ~/TRASH
done
	

