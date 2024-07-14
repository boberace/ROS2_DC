#ifndef M5JOYC_H
#define M5JOYC_H

#include <rclcpp/rclcpp.hpp>
#include "m5joyc/m5joyc_export.h"

namespace teleop_twist_joy
{

/**
 *
 */
class M5JOYC_EXPORT m5joyc : public rclcpp::Node
{
public:
  explicit m5joyc(const rclcpp::NodeOptions& options);

  virtual ~m5joyc();

private:
  struct Impl;
  Impl* pimpl_;
  OnSetParametersCallbackHandle::SharedPtr callback_handle;  
};

}  // namespace teleop_twist_joy

#endif  // M5JOYC_H