
import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    id: element
    property bool sourceLoaded: false
    property alias currentIndex: root.currentIndex

    signal itemChanged(int value)

    ListView {
        id: root
       // focus: true
        anchors.fill: parent
        snapMode: ListView.SnapOneItem //切换模式设置为单张切换
        highlightRangeMode: ListView.StrictlyEnforceRange//切换ListView的item的时候，currentIndex跟随变化
        highlightMoveDuration: 250
        orientation: ListView.Horizontal
        boundsBehavior: Flickable.StopAtBounds //禁止首尾滑动
/**初步构思:通过滑动窗口，根据窗口的索引变换来发送信号到C++。
目前这种方法试过了2种方法
1.在qml中设置objectName:xxx的方式，然后在main.cpp中findchild来寻找“xxx”对象的方式来执行connect信号与槽的功能
这其中main.cpp中findchild一般有两种方式，一种是基于View+Item,那么就是QQuickItem.另一种是engine+Window，那么就是QObject。目前不知道怎么在第二种架构中调用Item中的对象

2.这种方法在QML中定义signal 函数，然后发送信号函数到某一个对象的槽函数上，就可以直接利用connect来进行链接。这个同样会基于不同框架而定，没法在一种框架里面调用两种不同的对象

以上方法都实验失败

我的想法是，MainForm中的onChangedCurrentIntex()事件发生后，在main.qml中进行响应（或者说在main.qml中引用MainForm中的变化），然后在main.qml中进行发送信号或者设置objectName
来与main.cpp进行链接
**/
//        onCurrentIndexChanged: {
//                   console.log("current index = ",currentIndex)
//               }

        model: ListModel {
            ListElement {
                component: "View1.qml" //0
            }
            ListElement {
                component: "View2.qml" //1
            }
            ListElement {
                component: "View3.qml" //2
            }

        }
        //inline Component
        delegate: Loader {
            width: root.width
            height: root.height

            source: component
            asynchronous: true

            onLoaded: sourceLoaded = true
        } 

    }

}
