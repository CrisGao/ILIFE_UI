# ILIFE_UI
目前我们与下位机的控制方式是通过**ROS**的通信机制，并通过**librviz**的方式显示地图和轨迹，不过最终是否用这中显示方式还有待商定。
ROS通信机制中，service/client是所有设置功能的通信方式，publish/describe是为了显示librviz控件。

# 1. Prerequisites

## Ubuntu16.04

## ROS kinect

## ROS Qt Creator Plugin-in
它可以方便调试ROS程序，通过下方安装，会同时安装Qt5.9Creator。
```
sudo add-apt-repository ppa:levi-armstrong/qt-libraries-xenial
sudo add-apt-repository ppa:levi-armstrong/ppa
sudo apt-get update && sudo apt-get install qt59creator qt57creator-plugin-ros libqtermwidget59-0-dev
```
官方链接:https://ros-qtc-plugin.readthedocs.io/en/latest/_source/Improve-ROS-Qt-Creator-Plugin-Developers-ONLY.html

## Qt5.13

# 2. Building and Running

## 编译生成ROS执行程序
```
cd ILIFE_UI
catkin_make
source ./devel/setup.bash
rosrun ILIFE_UI ILIFE_UI
```
**注意**：若报错make找不到Qt5QuickControls，可以将本地的`YOURDIR/Qt5.13.2/5.13.2/gcc_64/lib/cmake/Qt5QuickControls`文件夹放入`/usr/lib/x86_64-linux-gnu/cmake/`
然后将Qt5QuickControls.make中将get_filename_component()改成get_filename_component(_qt5QuickControls2_install_prefix "YOURDIR/Qt5.13.2/5.13.2/gcc_64" ABSOLUTE)

##在Qt上进行调试运行

### 1. 打开程序
运行QtCreator5.9.desktop，并按照以下步骤
```
File->New File or Project->Other Project->ROS Workspace
在Name填写项目名称，Workspace Path选择程序父目录。
```
这样就可以打开程序

### 2. 需要配置项目
1. 选择调用的Qt版本
```
Projects->Manage Kits->Kits->import Kit(default)->选择Qt Version为Qt5.13
```

2. 配置Build步骤,使用make来编译和调试程序。
```
1. Build->删除原先的steps
2. 添加新的步骤，Add Build Step->Custom Process Step
3. 然后在Command键入:cmake，在Arguments键入:./src -DCMAKE_INSTALL_PREFIX=./install -DCATKIN_DEVEL_PREFIX=./devel -DCMAKE_BUILD_TYPE=Debug，Working directory保持默认
4. 继续添加步骤，在Command键入:make,在Arguments键入:-j8（具体数值根据电脑核数）， Working directory保持默认
```
					
3. 配置Run步骤，Run configuration选择Custom Executable,然后在Custom Executable中选择YOURDIR/ILIFE_UI/devel/lib/ILIFE_UI/ILIFE_UI,记得还要勾选Enable QML

# 3. Simulation

## Prerequisites

### cartographer
https://google-cartographer-ros.readthedocs.io/en/latest/compilation.html

## 播放地图轨迹数据包
需要将YOURDIR/ILIFE_UI/simulation/cartographer_ros.zip解压后，替换cartographer中的install_isolated/share/cartographer_ros中的
configuration_files、launch、urdf这三个文件夹
```
cd ~/cartographer
source install_isolated/setup.bash
roslaunch cartographer_ros demo_backpack_2d.launch bag_filename:=YOURDIR/ILIFE_UI/simulation/floor_1.bag
```
## 测试设置功能service/client
目前只有“开始/暂停”，“音量调节”，“吸力调节”三个控件有实现功能。
```
cd YOURDIR/ILIFE_UI/simulation/catkin_test
catkin_make
source ./devel/setup.bash
rosrun beginner_tutorials example_service
```
