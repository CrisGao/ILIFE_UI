#include <ros/ros.h>
#include <beginner_tutorials/ExampleServiceMsg.h> //注意添加消息类型的头文件
#include <iostream>
#include <string>
#include <std_msgs/String.h>
#include <std_msgs/Int32.h>
#include <std_msgs/Int8.h>
#include <std_msgs/UInt8.h>

using namespace std;

//response是一个example_service::ExampleServiceMsgResponse类型的参数
bool callback(beginner_tutorials::ExampleServiceMsgRequest& request, beginner_tutorials::ExampleServiceMsgResponse& response)
{
    ROS_INFO("callback activated"); //等同于printf和cout
    //string in_name(request.name); //定义一个string格式的变量 
    response.had_start=false;
    response.had_voice = false;
    response.had_suction = false;
    response.had_pressure = false;
    response.had_brush = false;
    response.battery_value = 0;

    std_msgs::UInt8 voice_value,suction_value;
    
     voice_value.data =request.voice;
     suction_value.data = request.suction;			   
	
    
   if(request.start_or_stop)
{
response.had_start = true;
ROS_INFO("Start the  clean vaccum");  
}
else
{
ROS_INFO("Pause the vaccum");
}
      

    ROS_INFO("Setting voice is:%d",voice_value);
	ROS_INFO("Setting suction is: %d",suction_value);
   // std::cout<<"get the voice:"<<in_voice.data<<std::endl;	

//这里只定义了两个名称，只有输入这两个名称中的一个才会反馈对应的信息    

  return true;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "example_service");//初始化节点，以example_service命名
  ros::NodeHandle n;

  ros::ServiceServer service = n.advertiseService("lookup_by_name", callback); //创建了一个service，名称为lookup_by_name，当一个"request"发送给这个service，callback函数就会被激活，在这里没有循环执行的函数，所以这个节点会处于暂停状态直到接受到"request"的时候才会被唤醒
  ROS_INFO("Ready to look up names.");
  ros::spin();

  return 0;
}

