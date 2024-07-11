# https://docs.ros.org/en/iron/How-To-Guides/Setup-ROS-2-with-VSCode-and-Docker-Container.html
source /opt/ros/$ROS_DISTRO/setup.bash
alias icode="code-insiders"

alias eba="code-insiders ~/.bash_aliases"
alias sba="source ~/.bash_aliases"

alias sr=". /opt/ros/$ROS_DISTRO/setup.bash"
alias srls=". install/local_setup.bash"
alias cb="colcon build --symlink-install"

rrs() { ros2 run sipeed_tof_ms_a010 publisher --ros-args -p device:="/dev/ttyUSB0";}

alias mca0="sudo minicom -D /dev/ttyACM0"
alias mca1="sudo minicom -D /dev/ttyACM1"
alias pbs="sudo minicom -D /dev/picoboard"
alias pps="sudo minicom -D /dev/picoprobe"

# show git git branch in prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]
\$(parse_git_branch)\[\e[00m\]$ "


# run ros agent over usb
# urosagent serial --dev /dev/picoboard
# urosagent serial --dev /dev/ttyACM0
# urosagent udp4 --port 8888 -v6
function urosagent() {
	docker run -it --rm --privileged \
	--net=host \
	microros/micro-ros-agent:iron \
	"$@"
}
alias uras0="urosagent serial --dev /dev/ttyACM0 -v6"
alias uras1="urosagent serial --dev /dev/ttyACM1 -v6"
alias stp="ros2 run tf2_ros static_transform_publisher 0 0 0 0 0 0 base_link pico_vl53l5cx"
alias rvt="rviz2 -d ../ws/src/.devcontainer/tof8_imu.rviz"
