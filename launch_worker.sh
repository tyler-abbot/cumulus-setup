
# script launches install on worker nodes inside cumulus
# this assumes you cloned https://github.com/floswald/cumulus-setup to you cumulus login node
# and that you are inside the root of that repo right now

# task 2: install software
for i in "${workers[@]}"
do
	echo "install on worker $i"
	scp install.sh root@"$i":~
	ssh $i 'chmod 755 ~/install.sh'
	ssh $i './install.sh'
	ssh $i 'rm ./install.sh'
	echo "done installing on worker $i"
done
