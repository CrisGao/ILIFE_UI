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
    width:          800
    height:         700
    color: "#2d3037"
    //visible:        true
    title: "选择地图"

    Rectangle {
        id: rectangleUP
        x: 29
        y: 6
        width: 742
        height: 300
        color: "#ffffff"
        radius: 25
        border.width: 2
        Image {
            id: mapImageup
            anchors.fill: rectangleUP
            source: "qrc:/images/backgroundmap.png"
        }

        Text {
            id: elementUp
            x: 339
            y: 17
            text: qsTr("当前地图")
            font.bold: true
            font.pixelSize: 16
        }

    }

    Rectangle {
        id: rectangleDown
        x: 29
        y: 358
        width: 742
        height: 300
        color: "#ffffff"
        radius: 25
        border.width: 2
        Image {
            id: mapImagedown
            anchors.fill: rectangleDown
            source: "qrc:/images/backgroundmap.png"
        }

        Text {
            id: elementDown
            x: 339
            y: 18
            text: qsTr("历史地图")
            font.bold: true
            font.pixelSize: 16
        }

        Text {
            id: elementDown1
            x: 324
            y: 44
            text: qsTr("2019-11-18 14:54")
            font.pixelSize: 12
        }
    }

    Button {
        id: buttonUp
        x: 350
        y: 312
        height: 30
        text: qsTr("删除此地图")
        contentItem: Text {
            text: buttonUp.text
            font: buttonUp.font
            opacity: enabled ? 1.0 : 0.3
            color: buttonUp.down ? "orangered" : "red"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 40
            opacity: enabled ? 1 : 0.3
            border.color: buttonUp.down ? "orangered" : "red"
            border.width: 1
            radius: 5
        }

    }

    Button {
        id: buttonDown
        x: 239
        y: 664
        height: 30
        text: qsTr("删除此地图")
        contentItem: Text {
            text: buttonDown.text
            font: buttonDown.font
            opacity: enabled ? 1.0 : 0.3
            color: buttonDown.down ? "orangered" : "red"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 40
            opacity: enabled ? 1 : 0.3
            border.color: buttonDown.down ? "orangered" : "red"
            border.width: 1
            radius: 5
        }
    }

    Button {
        id: buttonChoise
        x: 498
        y: 664
        height: 30
        text: qsTr("使用该地图")
        contentItem: Text {
            text: buttonChoise.text
            font: buttonChoise.font
            opacity: enabled ? 1.0 : 0.3
            // color: buttonChoise.down ? "palegreen" : "mediumseagreen"
            color: "ghostwhite"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 40
            color: buttonChoise.down ? "palegreen" : "mediumseagreen"
            opacity: enabled ? 1 : 0.3
            border.color: buttonChoise.down ? "palegreen" : "mediumseagreen"
            border.width: 1
            radius: 5
        }

    }

}
