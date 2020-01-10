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
    title: "耗材情况"

    Rectangle{
        id: topTip
        anchors.top: parent.top
        width: parent.width
        height: 40
        color: "lightgray"
        Label{
            anchors.centerIn: topTip
            font.pixelSize: Qt.application.font.pixelSize
            text: qsTr("小贴士:长按重置耗材寿命")
        }
    }
    ColumnLayout{
        spacing: 20
        anchors.centerIn: parent
        RowLayout {
            id: rowLayout
            width: 100
            height: 100


            Text {
                id: element
                color: "#ffffff"
                text: qsTr("边刷寿命")
                font.bold: true
                font.pixelSize: 16
            }

            ProgressBar {
                id: probar
                value: 0.5
                padding: 2

                background: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 6
                    color: "#e6e6e6"
                    radius: 3
                }

                contentItem: Item {
                    implicitWidth: 200
                    implicitHeight: 4

                    Rectangle {
                        width: probar.visualPosition * parent.width
                        height: parent.height
                        radius: 2
                        color: "#17a81a"
                    }
                }
            }

        }

        RowLayout {
            id: rowLayout1
            width: 100
            height: 100

            Text {
                id: element1
                color: "#ffffff"
                text: qsTr("滚刷寿命")
                font.pixelSize: 16
                font.bold: true
            }

            ProgressBar {
                id: probar1
                contentItem: Item {
                    implicitWidth: 200
                    Rectangle {
                        width: probar1.visualPosition * parent.width
                        height: parent.height
                        color: "#17a81a"
                        radius: 2
                    }
                    implicitHeight: 4
                }
                background: Rectangle {
                    color: "#e6e6e6"
                    radius: 3
                    implicitWidth: 200
                    implicitHeight: 6
                }
                value: 0.5
                padding: 2
            }
        }

        RowLayout {
            id: rowLayout2
            width: 100
            height: 100

            Text {
                id: element2
                color: "#ffffff"
                text: qsTr("滤网寿命")
                font.pixelSize: 16
                font.bold: true
            }

            ProgressBar {
                id: probar2
                contentItem: Item {
                    implicitWidth: 200
                    Rectangle {
                        width: probar2.visualPosition * parent.width
                        height: parent.height
                        color: "#17a81a"
                        radius: 2
                    }
                    implicitHeight: 4
                }
                background: Rectangle {
                    color: "#e6e6e6"
                    radius: 3
                    implicitWidth: 200
                    implicitHeight: 6
                }
                value: 0.5
                padding: 2
            }
        }

    }

}
