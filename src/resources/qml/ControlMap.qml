import QtQuick 2.12
//![2]
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.0
import QtQuick.Window 2.2

Window {
    id: view2
    x:  500
    y:  150
    width:          800
    height:         500
    //visible:        true
    title: "重点清扫"
    Flickable{
        id:submap
        width: 1280
        height: 630
        contentWidth: map.width
        contentHeight: map.height
        clip: true

        Image {
            id: map
            source: "qrc:/images/backgroundmap.png"
        }

    }

    TabBar {
        id: subundertabbar
        // height: 60
        anchors.bottom:parent.bottom
        anchors.bottomMargin: 0
        //       transformOrigin: Item.Center
        width: parent.width
        TabButton{
            text: qsTr("操作地图")
            font.pointSize: 13
        }
        TabButton {
            text: qsTr("虚拟墙")
            font.pointSize: 13
        }
        TabButton {
            text: qsTr("抹地禁区")
            font.pointSize: 13
        }
        TabButton {
            text: qsTr("全局禁区")
            font.pointSize: 13
        }

    }

}
