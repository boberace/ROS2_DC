a010_ros2
Sipeed MaixSense-A010 ros2 node

cd ros2
source /opt/ros/*/setup.sh
colcon build #If you are prompted that colcon is missing, you need sudo apt install python3-colcon-ros
source install/setup.sh
ros2 run sipeed_tof_ms_a010 publisher --ros-args -p device:="/dev/ttyUSB0"

After that, the terminal will continue to refresh and display [sipeed_tof]: Publishing, that is, it works normally

