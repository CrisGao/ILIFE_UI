import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Layouts 1.11
import QtQuick.Window 2.13
import Qt.labs.calendar 1.0

ApplicationWindow {
    id:  view2
    width: 400
    height: 500
    title: "固件升级"

    ColumnLayout{
        spacing: 20
        anchors.centerIn: parent
        Label {
            id: label
            font.pixelSize: Qt.application.font.pixelSize * 2
            text: qsTr("当前版本: 0.0.1.29")
        }
        Label {
            id: label2
            font.pixelSize: Qt.application.font.pixelSize * 2
            text: qsTr("最新版本: 0.0.1.99")
        }
        Label {
            id: minlabel1
            font.pixelSize: Qt.application.font.pixelSize
            text: qsTr("更新前请确保：")
        }
        Label {
            id: minlabel2
            font.pixelSize: Qt.application.font.pixelSize
            text: qsTr("1、扫地机有足够的电量。")
        }
        Label {
            id: minlabel3
            font.pixelSize: Qt.application.font.pixelSize
            text: qsTr("2、请确保您的网络连接正常。")
        }
        Label {
            id: minlabel4
            font.pixelSize: Qt.application.font.pixelSize
            text: qsTr("3、在升级之前，扫地机处于待机模式。")
        }
        Button {
            id: button
            text: qsTr("立即更新")
        }
    }

}
