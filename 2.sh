#! /bin/bash

cd
clear

dialog                                         \
   --title 'Wait...'                           \
   --infobox '\nStarting Pepper installer...'  \
   0 0
sleep 3

INSTA(){
echo $1 | dialog --gauge 'Wait... \n
Installing Pepper packages' 0 0 0
}

INSTA 0
sudo apt-get update -y &> /dev/null
sudo apt-get upgrade -y &> /dev/null
sudo apt-get install ros-kinetic-gazebo-ros-control -y &> /dev/null
sudo apt-get install ros-kinetic-move-base -y &> /dev/null

INSTA 8
sudo apt-get install ros-kinetic-moveit* -y &> /dev/null
sudo apt-get install ros-kinetic-navigation -y &> /dev/null

INSTA 29
sudo apt-get install ros-kinetic-tf2-sensor-msgs -y &> /dev/null
sudo apt-get install ros-kinetic-map-server -y &> /dev/null

INSTA 35
sudo apt-get install ros-kinetic-ros-control -y &> /dev/null
sudo apt-get install ros-kinetic-amcl -y &> /dev/null

INSTA 38
sudo apt-get install ros-kinetic-ros-controllers -y &> /dev/null
sudo apt-get install libignition-math2-dev protobuf-compiler -y &> /dev/null

INSTA 43
sudo apt-get install ros-kinetic-gazebo-ros -y &> /dev/null
sudo apt-get install autoconf automake libtool curl make g++ unzip -y &> /dev/null

INSTA 51
sudo apt-get install ros-kinetic-gazebo-plugins -y &> /dev/null
sudo apt-get install ros-kinetic-octomap* -y &> /dev/null

INSTA 58
sudo apt-get install ros-kinetic-controller-manager -y &> /dev/null
sudo apt-get install ros-kinetic-gmapping -y &> /dev/null

INSTA 63
sudo apt-get install python-wstool -y &> /dev/null

INSTA 75
sudo apt-get install ros-kinetic-gazebo* -y &> /dev/null

INSTA 82
sudo apt-get install ros-kinetic-openslam-gmapping -y &> /dev/null

INSTA 83
sudo apt-get install ros-kinetic-navigation -y &> /dev/null

INSTA 85
sudo apt-get install ros-kinetic-depthimage-to-laserscan -y &> /dev/null

INSTA 87
sudo apt-get update -y &> /dev/null

INSTA 89
sudo apt-get install default-jdk -y &> /dev/null

INSTA 97
gnome-terminal -- sudo apt-get install ros-kinetic-pepper-meshes

dialog                                         \
   --title 'Wait....'                           \
   --msgbox '\nProceed when the Pepper Meshes terminal is finished.'  \
   0 0

INSTA 98
sudo apt-get update -y &> /dev/null

INSTA 99
sudo apt-get upgrade -y &> /dev/null

INSTA 100
sleep 1

dialog                                         \
   --title 'Wait...'                           \
   --infobox '\nStarting Pepper download...'  \
   0 0
sleep 3

DOWN(){
echo $1 | dialog --gauge 'Wait... \n
Downloading Pepper files' 0 0 0
}

DOWN 0 
cd
mkdir -p pepper_sim_ws/src
cd pepper_sim_ws/src

DOWN 3
git clone https://github.com/JoseDiazAmado/RUTAS---Pepper-Robots-Simutation tmp && mv tmp/.git . && rm -fr tmp && git reset --hard #&> /dev/null

DOWN 81
cd
cd pepper_sim_ws
catkin_make &> /dev/null

DOWN 100
echo "export ROS_PEPPER_SIM_WS=~/pepper_sim_ws" >> ~/.bashrc
source ~/.bashrc
echo "source $ROS_PEPPER_SIM_WS/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

dialog                                         \
   --title 'Complete installation.'                           \
   --msgbox '\nPepper was successfully installed.'  \
   0 0
