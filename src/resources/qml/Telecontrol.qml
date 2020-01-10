import QtQuick 2.12
//![2]
import QtCharts 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.0
import QtQuick.Window 2.2

Window {
    id:             view1
    x:  500
    y: 150
    width:          400
    height:         400
    //visible:        true
    title: "遥控"

    //    Item {
    //        id:             videoItem
    Rectangle{
        id: teleshow
        anchors.fill: parent
        color: "#2d3037"
        Text {
            id: tip1
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            color: "ghostwhite"
            text: qsTr("手动遥控清扫机")
            font.pointSize: 16
        }
        Button {
            id: upbutton
            x: 170
            y: 60
            width: 60
            height: 100

            Text{
                color: "forestgreen"
                font.family: "FontAwesome"
                font.pixelSize: 60
                anchors.centerIn: upbutton
                text: "\uf106" //up
            }
            flat: false
            checkable: false
            display: AbstractButton.TextBesideIcon
        }

        Button {
            id: rightbutton
            x: 256
            y: 186
            height: 60
            Text{
                color: "forestgreen"
                font.family: "FontAwesome"
                font.pixelSize: 60
                anchors.centerIn: rightbutton
                text: "\uf105" //right
            }

        }

        Button {
            id: downbutton
            x: 170
            y: 272
            width: 60
            height: 100
            Text{
                color: "forestgreen"
                font.family: "FontAwesome"
                font.pixelSize: 60
                anchors.centerIn: downbutton
                text: "\uf107" //down
            }
        }

        Button {
            id: leftbutton
            x: 44
            y: 186
            height: 60
            Text{
                color: "forestgreen"
                font.family: "FontAwesome"
                font.pixelSize: 60
                anchors.centerIn: leftbutton
                text: "\uf104" //left
            }

        }
        RoundButton {
            id: roundButton
            x: 150
            y: 166
            width: 100
            height: 100
            Text{
                color: "forestgreen"
                font.family: "FontAwesome"
                font.pixelSize: 100
                anchors.centerIn: roundButton
                text: "\uf28b" //right
            }
        }
        //            Image{
        //                source: "qrc:/qml/image/map.png"
        //            }
    }
}
