import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Layouts 1.11
import QtQuick.Window 2.11

ApplicationWindow {
    id:  view2
    width: 400
    height: 500
    title: "历史记录"

    ListModel {
        id: listModel

        ListElement {
            text: qsTr("11月19日 16:01 清扫5m^2 时长2min")
        }
        ListElement {
            text: qsTr("11月19日 16:01 清扫5m^2 时长2min")
        }
        ListElement {
            text: qsTr("11月19日 16:01 清扫5m^2 时长2min")
        }
        ListElement {
            text: qsTr("11月19日 16:01 清扫5m^2 时长2min")
        }
        ListElement {
            text: qsTr("11月19日 16:01 清扫5m^2 时长2min")
        }
    }

    ListView{
        id: listview
        width: parent.width
        height: parent.height
        anchors.fill: parent
        model: listModel
        delegate: listDelegate
    }

    Component{
        id: listDelegate
        Rectangle{
            id: listItem
            width: parent.width
            height: 50
            color: "#90ee90"
            Text {
                id: text
                font.family: "microsoft yahei"
                font.pointSize: 12
                height: parent.height
                width: parent.width - delBtn.width
                text: model.text
                color: "#000000"
                verticalAlignment: Text.AlignVCenter
                MouseArea{
                    property point clickPos: "0,0"

                    anchors.fill: parent
                    onPressed: {
                        clickPos  = Qt.point(mouse.x,mouse.y);

                    }
                    onReleased: {
                        var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                        console.debug("delta.x: " + delta.x);
                        if ((delta.x < 0) && (aBtnShow.running === false) && (delBtn.width == 0)){
                            aBtnShow.start();
                        }else if (aBtnHide.running === false && (delBtn.width > 0)){
                            aBtnHide.start();
                        }

                        deleteText.visible = true;


                    }
                }
            }
            Rectangle{
                color: "#000000"
                height: 1
                width: parent.width
                anchors.bottom: parent.bottom
            }

            Rectangle{
                id: delBtn
                height: parent.height
                width: 0
                color: "hotpink"
                anchors.right: parent.right
                Text {
                    id: deleteText
                    font.family: "microsoft yahei"
                    font.pointSize: 12
                    anchors.centerIn: parent
                    text: qsTr("删除")
                    color: "#ffffff"
                    visible: false
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        listview.model.remove(index);
                    }
                }
            }
            PropertyAnimation{
                id: aBtnShow
                target: delBtn
                property: "width"
                duration: 100
                from: 0
                to: 60
            }
            PropertyAnimation{
                id: aBtnHide
                target: delBtn
                property: "width"
                duration: 100
                from: 60
                to: 0
            }
        }
    }
}
