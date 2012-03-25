#!/bin/sh
#Reinstalle le systeme
# Argument :  paquets à installer en +

#network
echo "Configuring network ..."
cat ./network_interfaces > /etc/network/interfaces
/etc/init.d/networking restart
echo "Done : " $?

#paquets
echo "Configuring apt-get ..."
mv  ./sources.list /etc/apt/sources.list
apt-get update
apt-get install auctex autoconf awesome banshee build-essential chromium-browser cmake cvs emacs ffmpeg flashplugin-nonfree gajim-nightly geeqie git gnuplot htop icedove iceweasel lame libcvaux-dev libfftw3-dev libfftw3-dev libgsl0-dev libhighgui-dev liblapack-dev linux-headers-amd64 mplayer nfs-common octave openssh-server pcmanfm pdfmod pmount qalc sox stellarium subversion texlive-bibtex-extra texlive-fonts-extra texlive-fonts-recommended texlive-lang-french texlive-latex-extra vlc xchat xpdf ntp jack jackd curl lshw unzip $1
echo "Done : " $?

#nfs data
echo "Configuring NFS ..."
mkdir /data
echo "adiou:/data/ /data nfs defaults,user,auto,noatime,intr 0 0" >> /etc/fstab
echo "Done"

#NVIDIA drivers
