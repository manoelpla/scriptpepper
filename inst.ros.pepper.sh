#! /bin/bash

#EXIBE MENU DE ESCOLHA
OPC=$(dialog --menu "ROS + Pepper installer: " 0 0 0 \
1 "Install ROS Kinetic" \
2 "Install Pepper" --stdout)


case $OPC in
	1)
	gnome-terminal -- ./1.sh
	./inst.ros.pepper.sh;;

	2)
	gnome-terminal -- ./2.sh
	./inst.ros.pepper.sh;;

	*)
	clear

esac
