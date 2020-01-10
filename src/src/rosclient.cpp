#include "../include/robomap/rosclient.h"
#include <ros/ros.h>
#include <ILIFE_UI/ExampleServiceMsg.h> // 自定义service messages类型的头文件
#include <iostream>
#include <string>
#include <std_msgs/String.h>


RosClient::RosClient(QObject *parent) : QObject(parent)
{
  int argc;
  char **argv;
  ros_init(argc,argv);


}
void RosClient::ros_init(int argc,char **argv)
{
  ros::init(argc,argv,"rosmap",ros::init_options::AnonymousName);
}
void RosClient::startClient(bool isStart)
{
  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<ILIFE_UI::ExampleServiceMsg>("lookup_by_name");
  ILIFE_UI::ExampleServiceMsg srv;

  if(isStart)
    srv.request.start_or_stop = true;
  else
    srv.request.start_or_stop = false;

  if(client.call(srv))
  {
  }
  else
  {
    ROS_ERROR("Failed to call service");
    return;
  }
}
void RosClient::sendMessageRun(int value)
{
  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<ILIFE_UI::ExampleServiceMsg>("lookup_by_name");

  ILIFE_UI::ExampleServiceMsg srv;
  switch (ros_handle) {
  case VoiceHandle:
    srv.request.voice = value;
    srv.request.suction = ros_suction;
    ros_voice = value;
    break;
  case SuctionHandle:
    srv.request.voice = ros_voice;
    srv.request.suction = value;
    ros_suction = value;
    break;
  default:
    break;
  }
  if(client.call(srv))
  {
    if(!srv.response.had_voice)
      std::cout<<"had success setting the voice"<<std::endl<<
                 "the voice is:"<<ros_voice<<std::endl;
    if(!srv.response.had_suction)
      std::cout<<"had success setting the suction"<<std::endl<<
                 "the suction is:"<<ros_suction<<std::endl;
  }
  else
  {
    ROS_ERROR("Failed to call service");
    return;
  }

}

void RosClient::setHandle(ChooseHandle handle)
{
  ros_handle = handle;
}
