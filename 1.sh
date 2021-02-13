#! /bin/bash

clear
cd
dialog                                         \
   --title 'Wait...'                           \
   --infobox '\nStarting ROS Kinetic installer...'  \
   0 0
sleep 1

GAUGE(){
echo $1 | dialog --gauge 'Wait... \n
Installing ROS Kinetic' 0 0 0
}

GAUGE 0
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' &> /dev/null

GAUGE 2
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 &> /dev/null

GAUGE 4
sudo apt-get update -y &> /dev/null

GAUGE 9
sudo apt-get install ros-kinetic-desktop-full -y &> /dev/null

GAUGE 70
sudo apt-get install ros-kinetic-desktop-full -y &> /dev/null

GAUGE 71
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc

GAUGE 72
source ~/.bashrc

GAUGE 73
echo "export ROS_MASTER_URI=http://localhost:11311" >> ~/.bashrc

GAUGE 74
source ~/.bashrc

GAUGE 75
echo "export ROS_HOSTNAME=localhost" >> ~/.bashrc

GAUGE 76
source ~/.bashrc

GAUGE 77
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential -y &> /dev/null

GAUGE 90
sudo apt install python-rosdep -y &> /dev/null

GAUGE 92
sudo rosdep init &> /dev/null

GAUGE 96
rosdep update &> /dev/null

GAUGE 99
sleep 1

GAUGE 100
sleep 1

dialog                                         \
   --title 'Complete installation.'                           \
   --msgbox '\nROS Kinetic was successfully installed.'  \
   0 0
