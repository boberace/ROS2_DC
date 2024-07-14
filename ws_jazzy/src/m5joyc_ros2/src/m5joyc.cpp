// todo :  look into changing m5joyc_cmd_vel to m5joyc/cmd_vel like turtle1/cmd_vel
// todo :  github
#include <memory>

#include "rclcpp/rclcpp.hpp"
#include "sensor_msgs/msg/joy.hpp"
#include "geometry_msgs/msg/twist.hpp"

using std::placeholders::_1;

class m5joyc : public rclcpp::Node
{
public:
  m5joyc()
  : Node("m5joyc_cmd_vel")
  {
    subscription_ = this->create_subscription<sensor_msgs::msg::Joy>(
      "m5joyc_joy", 10, std::bind(&m5joyc::topic_callback, this, _1));
    publisher_ = this->create_publisher<geometry_msgs::msg::Twist>("m5joyc_cmd_vel", 10);
  }

private:
  void topic_callback(const sensor_msgs::msg::Joy::SharedPtr msg) const
  {
    // RCLCPP_INFO(this->get_logger(), "I heard: '%s'", msg->header.frame_id.c_str());

    auto cmd_vel_msg = std::make_unique<geometry_msgs::msg::Twist>();
    cmd_vel_msg->linear.x = abs(msg->axes[2])>0.1?msg->axes[2]:0.0;
    cmd_vel_msg->linear.y = abs(msg->axes[3])>0.1?msg->axes[3]:0.0;
    cmd_vel_msg->linear.z = 0.0;
    cmd_vel_msg->angular.x = 0.0;
    cmd_vel_msg->angular.y = 0.0;
    cmd_vel_msg->angular.z = abs(msg->axes[0])>0.1?msg->axes[0]:0.0;

    publisher_->publish(std::move(cmd_vel_msg));

  }
  rclcpp::Subscription<sensor_msgs::msg::Joy>::SharedPtr subscription_;
  rclcpp::Publisher<geometry_msgs::msg::Twist>::SharedPtr publisher_;
};

int main(int argc, char * argv[])
{
  rclcpp::init(argc, argv);
  rclcpp::spin(std::make_shared<m5joyc>());
  rclcpp::shutdown();
  return 0;
}
