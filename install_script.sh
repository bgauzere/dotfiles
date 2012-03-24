#!/bin/sh
#Reinstalle le systeme
#Mettre en argument les paquets à rajouter

#network
echo "Configuring network ..."
cat ./network_interfaces > /etc/network/interfaces
/etc/init.d/networking restart
echo "Done : " $?

#paquets
echo "Configuring apt-get ..."
cat ./sources.list >> /etc/apt/sources.list
apt-get update
apt-get install auctex awesome banshee build-essential chromium-browser cmake cmake emacs flashplugin-nonfree gajim-nightly htop icedove iceweasel libcvaux-dev libfftw3-dev libgsl0-dev libhighgui-dev liblapack-dev mplayer nfs-common pmount qalc subversion texlive-lang-french texlive-latex-extra vlc $1
echo "Done : " $?

echo "Configuring NFS ..."
#nfs data
mkdir /data
echo "adiou:/data/ /data nfs defaults,user,auto,noatime,intr 0 0" >> /etc/fstab
echo "Done"
