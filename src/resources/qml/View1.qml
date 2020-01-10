
//![2]
import QtQuick 2.0
//![2]
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.0
import QtQuick.Window 2.2

import QtQuick.Controls.Material 2.4

import an.qt.RosClient 1.0

Item {
    id: view1
    anchors.fill: parent

    property bool isClicked: false

    //电池电量(状态位)，0表示电量不足，1表示剩余一半，2表示满电
    property int battery_power: 0

    signal displayWidget();

    RosClient{
        id:rosclient
    }

    Rectangle{
        id: rectangle
        anchors.fill: parent
        color: "#2d3037"


        /**************Show the real-time map image*************/
        Rectangle {
            id: rectangleforImage
            x: 100
            y: 50
//            width: 1090
//            height: 620
            width: parent.width - 190
            height: parent.height - 100
            color: "#ffffff"

            Item{
                id: mapItemArea
                width: rectangleforImage.width
                height: rectangleforImage.height
                anchors.centerIn: rectangleforImage
                clip: true
                Image {
                    id: mapImg
                    //这里使图片居中显示
                    x: mapItemArea.width/2-mapImg.width/2
                    y: mapItemArea.height/2-mapImg.height/2
                   // source: "qrc:/images/backgroundmap.png" //if no source image,the source file will show
                    //图像异步加载，只对本地图像有用
                    asynchronous: true
                    cache: false
                }
//                Connections{
//                        target: CodeImage
//                        onCallQmlRefeshImg:{
//                            mapImg.source = ""
//                            mapImg.source = "image://CodeImg"
//                        }
//                }
                MouseArea {
                    id: mapDragArea
                    anchors.fill: mapImg
                    drag.target: mapImg
                    //这里使图片不管是比显示框大还是比显示框小都不会被拖拽出显示区域
                    drag.minimumX: (mapImg.width > mapItemArea.width) ? (mapItemArea.width - mapImg.width) : 0
                    drag.minimumY: (mapImg.height > mapItemArea.height) ? (mapItemArea.height - mapImg.height) : 0
                    drag.maximumX: (mapImg.width > mapItemArea.width) ? 0 : (mapItemArea.width - mapImg.width)
                    drag.maximumY: (mapImg.height > mapItemArea.height) ? 0 : (mapItemArea.height - mapImg.height)

                    //使用鼠标滚轮缩放
                    onWheel: {
                        //每次滚动都是120的倍数
                        var datla = wheel.angleDelta.y/120;
                        if(datla > 0)
                        {
                            mapImg.scale = mapImg.scale/0.9
                        }
                        else
                        {
                            mapImg.scale = mapImg.scale*0.9
                        }
                    }
                }
            }
        }
        /*************END:Show the real-time map image*******************/

        Row{
            Rectangle{
                id:rect1
                width: 300
                height:50
                Material.elevation: 6
                color:"#364449"
                RowLayout{
                    spacing: 8
                    anchors.left: rect1.left
                    anchors.leftMargin: 10
                    Text{

                        color: "#fafafa"
                        text: qsTr("ILIFE X1000")
                        font.weight: Font.ExtraBold
                        font.strikeout: false
                        style: Text.Outline
                        font.pointSize: 16
                        font.bold: true

                    }
                    Text{
                        id: wifitext
                        color: "#21be2b"
                        font.family: "FontAwesome"
                        font.pixelSize: 40

                        text: "\uf1eb"
                    }
                    Text{
                        id: alarmText
                        color: "#21be2b"
                        font.family: "FontAwesome"
                        font.pixelSize: 40
                        text: "\uf0f3" //alarm
                    }
          /*based on timer and switch icons to simulate battery control*/
                    Timer{
                        id: timer
                        interval: 500
                        running: true
                        repeat: true
                        onTriggered: {
                            battery_power = battery_power + 1
                            if(battery_power > 2)
                            {
                                battery_power = 0
                            }
                        }
                    }
                    Connections{
                        target: timer
                        onTriggered:{
                            if(battery_power == 0)
                            {
                                batteryimg.source = "qrc:/images/pic/none.ico"
                            }
                            else if(battery_power == 1)
                            {
                                batteryimg.source = "qrc:/images/pic/half.ico"
                            }
                            else
                            {
                                batteryimg.source = "qrc:/images/pic/full.ico"
                            }
                        }
                    }
                    Image {
                        id: batteryimg
                        sourceSize.width: 50
                        sourceSize.height: rect1.height
                        source: "qrc:/images/pic/none.ico"
                    }
                }
            }
            /*分隔线*/
            Rectangle{
                id: lineRect
                anchors.verticalCenter: rect1.verticalCenter
                height: 40
                width: 1
                color: "white"
            }
            Rectangle{
                id:rect2
//                width: 980
                width: view1.width - rect1.width
                height:50
                color:"#364449"
                RowLayout{
                    spacing: 150
                    anchors.centerIn: rect2
                    RowLayout{
                        spacing: 30

                        Text{  color: "#fafafa";text: qsTr("当前状态:") ;style: Text.Outline; font.pointSize: 16}
                        Text{  color: "#fafafa";text: qsTr("规划") ;style: Text.Outline; font.pointSize: 18}
                    }
                    RowLayout{
                        spacing: 30
                        Text{  color: "#fafafa";text: qsTr("清扫面积:") ;style: Text.Outline; font.pointSize: 16}
                        Text{  color: "#fafafa";text: qsTr("0.29m²") ;style: Text.Outline; font.pointSize: 18}
                    }
                    RowLayout{
                        spacing: 30
                        Text{  color: "#fafafa";text: qsTr("清扫时间:") ;style: Text.Outline; font.pointSize: 16}
                        Text{  color: "#fafafa";text: qsTr("0min") ;style: Text.Outline; font.pointSize: 18}
                    }

                    }

                }

        }

        TabBar {
            id: undertabbar
            height: 48
            anchors.bottom:parent.bottom
            transformOrigin: Item.Center
            width: parent.width

            TabButton {
                font.pixelSize: Qt.application.font.pixelSize * 1.5
                text: qsTr("连接")
                ConnectSub{
                    id: subwindow_connect
                }
                onClicked: {
                    subwindow_connect.show()
                }
            }
            TabButton {
                font.pixelSize: Qt.application.font.pixelSize * 1.5
                text: qsTr("加载地图")
                LoadMap{
                    id: subwindow_loadmap
                }
                onClicked: {
                    subwindow_loadmap.show()
                }
            }
            TabButton {
                text: qsTr("遥控")
                font.pixelSize: Qt.application.font.pixelSize * 1.5
                Telecontrol{
                    id: subwindow_control
                }
                onClicked: {
                    subwindow_control.show()
                }
            }
            TabButton {
                font.pixelSize: Qt.application.font.pixelSize * 1.5
                text: qsTr("重点清扫")
                ControlMap{
                    id: subwindow_map
                }
                onClicked: {
                    subwindow_map.show()
                }
            }

        }


        RoundButton {
            id: startButton
            anchors.right: parent.right
            anchors.rightMargin: 15
            anchors.bottom: undertabbar.top
            anchors.bottomMargin: 20
            radius: 300
            highlighted: true
            Material.background: "black"
            onClicked: {

                if(isClicked)
                {
                    startText.color = "#21be2b"
                    startText.text = "\uf144" //start
                    isClicked = false
                    rosclient.startClient(false);
                }
                else
                {
                    startText.color = "darkgrey"
                    startText.text = "\uf28b" //pause
                    isClicked = true
                    rosclient.startClient(true);

                }
            }

            Text{
                id: startText
                anchors.centerIn: startButton
                color: "#21be2b"
                font.family: "FontAwesome"
                font.pixelSize: 80
                text: "\uf144" //start

            }

        }
        RoundButton {
            id: rechargeButton
            anchors.bottom: startButton.top
            anchors.bottomMargin: 25
            anchors.horizontalCenter: startButton.horizontalCenter
            width: 80
            height: 80
            radius: 150
            highlighted: true
            Text{
                id: rechargeText
                anchors.centerIn: rechargeButton
                color: "black"
                font.family: "FontAwesome"
                font.pixelSize: 60
                text: "\uf015" //recharge icon

            }

        }

    }


}

