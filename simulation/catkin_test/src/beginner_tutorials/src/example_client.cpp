#include <ros/ros.h>
#include <beginner_tutorials/ExampleServiceMsg.h> // 自定义service messages类型的头文件
#include <iostream>
#include <string>
using namespace std;

int main(int argc, char **argv) {
    ros::init(argc, argv, "example_client");
    ros::NodeHandle n;
    //下面这一行很重要，它创建了以个serviceClient与已经创建的service（lookup_by_name）进行通信
    ros::ServiceClient client = n.serviceClient<beginner_tutorials::ExampleServiceMsg>("lookup_by_name");
    beginner_tutorials::ExampleServiceMsg srv;//这一行跟上一行很重要，这一行是指在package（example_service）中定义了service message（ExampleServiceMsg），在壳（srv）中包含了request和response的域
    bool found_on_list = false;
    string in_name;
    //下面是一个简单的逻辑判断循环
    while (ros::ok()) {
        cout<<endl;
        cout << "enter a name (x to quit): ";
        cin>>in_name;
        if (in_name.compare("x")==0)
            return 0;
        //cout<<"you entered "<<in_name<<endl;
        srv.request.name = in_name; //"Ted";
        //注意下面的client.call(srv)，这个call会与已创建的service完成信息交换，是一个布尔类型的判断，若判断为true，则会获得srv.response的信息
        if (client.call(srv)) {
            if (srv.response.on_the_list) {
                cout << srv.request.name << " is known as " << srv.response.nickname << endl;
                cout << "He is " << srv.response.age << " years old" << endl;
                if (srv.response.good_guy)
                    cout << "He is reported to be a good guy" << endl;
                else
                    cout << "Avoid him; he is not a good guy" << endl;
            } else {
                cout << srv.request.name << " is not in my database" << endl;
            }

        } else {
            ROS_ERROR("Failed to call service lookup_by_name");
            return 1;
        }
    }
    return 0;
}

