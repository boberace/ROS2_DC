source /opt/ros/$ROS_DISTRO/setup.bash
alias icode="code-insiders"

alias eba="code-insiders ~/.bash_aliases"
alias sba="source ~/.bash_aliases"

alias sr=". /opt/ros/$ROS_DISTRO/setup.bash"
alias srls=". install/local_setup.bash"
alias cb="colcon build --symlink-install"

rrs() { ros2 run sipeed_tof_ms_a010 publisher --ros-args -p device:="/dev/ttyUSB0";}


alias stp="ros2 run tf2_ros static_transform_publisher 0 0 0 0 0 0 base_link pico_vl53l5cx"

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


