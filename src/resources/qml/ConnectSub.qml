import QtQuick 2.12
//![2]
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
    title: "连接扫地机"
    color: "#2d3037"
    ComboBox {
        x: 147
        y: 63
        editable: true
        model: ListModel {
            id: model
            ListElement { text: "X900" }
            ListElement { text: "X800" }
            ListElement { text: "X750" }
        }
        onAccepted: {
            if (find(editText) === -1)
                model.append({text: editText})
        }
    }

    Text {
        id: element
        x: 49
        y: 74
        width: 85
        height: 18
        color: "ghostwhite"
        text: qsTr("选择扫地机:")
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 15
    }

    ComboBox {
        id: control
        x: 147
        y: 133
        model: ["iLifeInnovation", "ChinaNet-4WmF", "ChinaNet-3ah"]

        delegate: ItemDelegate {
            width: control.width
            contentItem: Text {
                text: modelData
                color: "#21be2b"
                font: control.font
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter
            }
            highlighted: control.highlightedIndex === index
        }

        indicator: Canvas {
            id: canvas
            x: control.width - width - control.rightPadding
            y: control.topPadding + (control.availableHeight - height) / 2
            width: 12
            height: 8
            contextType: "2d"
            Connections {
                target: control
                onPressedChanged: canvas.requestPaint()
            }

            onPaint: {
                context.reset();
                context.moveTo(0, 0);
                context.lineTo(width, 0);
                context.lineTo(width / 2, height);
                context.closePath();
                context.fillStyle = control.pressed ? "#17a81a" : "#21be2b";
                context.fill();
            }
        }

        contentItem: Text {
            leftPadding: 0
            rightPadding: control.indicator.width + control.spacing

            text: control.displayText
            font: control.font
            color: control.pressed ? "#17a81a" : "#21be2b"
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 120
            implicitHeight: 40
            border.color: control.pressed ? "#17a81a" : "#21be2b"
            border.width: control.visualFocus ? 2 : 1
            radius: 2
        }

        popup: Popup {
            y: control.height - 1
            width: control.width
            implicitHeight: contentItem.implicitHeight
            padding: 1

            contentItem: ListView {
                clip: true
                implicitHeight: contentHeight
                model: control.popup.visible ? control.delegateModel : null
                currentIndex: control.highlightedIndex

                ScrollIndicator.vertical: ScrollIndicator { }
            }

            background: Rectangle {
                border.color: "#21be2b"
                radius: 2
            }
        }
    }

    /******************END:EnterKey***************/

    TextField {
        id: passwordLabel
        x: 147
        y: 197
        placeholderText: qsTr("Enter password")
    }
    /**************连接的圆形运行进度***********/

    Rectangle{
        property int btnHeight: 48
        property int btnWidth: 120
        x: 147
        y: 270

        id: cProBtn
        height: btnHeight
        width: btnWidth
//        anchors.centerIn: parent
        border.color: "#148014"
        border.width: 2
        radius: 0
        Text{
            id: cText
            anchors.centerIn: cProBtn
            font.family: "microsoft yahei"
            font.pixelSize: 14
            color: "#21be2b"
            text: qsTr("点击连接")
        }
        MouseArea{
            anchors.fill: cProBtn
            onClicked: {
                if (rAniStart.running || rAniStop.running) return
                cText.visible = false;
                rAniStart.start();
                widthAniStart.start();
            }
        }
        PropertyAnimation{
            id: rAniStart
            target: cProBtn
            property: "radius"
            duration: 300
            from: 0
            to: cProBtn.btnHeight/2
            onStopped: {
                cProgress.onStart();
                cProgress.visible = true;
            }
        }
        PropertyAnimation{
            id: widthAniStart
            target: cProBtn
            property: "width"
            duration: 300
            from: cProBtn.btnWidth
            to: cProBtn.btnHeight
        }
        QmlCircularProgress{
            id: cProgress
            anchors.centerIn: parent
            visible: false
            arcWidth: 2
            radius: cProBtn.btnHeight/2
            interval: 2
            arcColor: "#148014"
            onSStop: {
                visible = false;
                rAniStop.start();
                widthAniStop.start();
            }
        }
        PropertyAnimation{
            id: rAniStop
            target: cProBtn
            property: "radius"


            duration: 300
            from: cProBtn.btnHeight/2
            to: 0
            onStopped: {
                cText.text = qsTr("连接成功");
                cText.color = "green"
                cText.visible = true;
            }
        }
        PropertyAnimation{
            id: widthAniStop
            target: cProBtn
            property: "width"
            duration: 300
            from: cProBtn.btnHeight
            to: cProBtn.btnWidth
        }
    }

    Text {
        id: element1
        x: 56
        y: 144
        width: 85
        height: 18
        color: "ghostwhite"
        text: qsTr("选择wifi:")
        font.pixelSize: 15
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: element2
        x: 49
        y: 208
        width: 85
        height: 18
        color: "ghostwhite"
        text: qsTr("输入wifi密码:")
        font.pixelSize: 15
        horizontalAlignment: Text.AlignHCenter
    }

    /******************END:连接的圆形运行进度***************/

}
