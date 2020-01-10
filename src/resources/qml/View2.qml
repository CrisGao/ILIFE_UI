
import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12
import QtQuick.Window 2.2

import an.qt.RosClient 1.0

Item {
    id: view2
    anchors.fill: parent
    property int addXn: 450
    property int reduceYn : 20

    width: 1280
    height: 720

    RosClient{
        id:rosclient

    }

    Rectangle {
        anchors.fill: parent
        color: "#2d3037"
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        PathView {

            id: view
            anchors.fill: parent
            highlight: appHighlight
            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5
            focus: true
            model: appModel
            delegate: appDelegate
            path: Path {
                startX: 10+addXn
                startY: 50-reduceYn
                PathAttribute { name: "iconScale"; value: 0.5 }
                PathQuad { x: 200+addXn; y: 150-reduceYn; controlX: 50+addXn; controlY: 200-reduceYn }
                PathAttribute { name: "iconScale"; value: 1.0 }
                PathQuad { x: 390+addXn; y: 50-reduceYn; controlX: 350+addXn; controlY: 200-reduceYn }
                PathAttribute { name: "iconScale"; value: 0.5 }
            }
        }

        ListModel {
            id: appModel
            ListElement { name: "定时预约"; icon: "qrc:images/clock.svg" }
            ListElement { name: "清扫记录"; icon: "qrc:images/clipboard-list.svg" }
            ListElement { name: "耗材情况"; icon: "qrc:images/bug.svg" }
            ListElement { name: "固件升级"; icon: "qrc:images/arrow-alt-circle-up.svg" }
            ListElement { name: "恢复出厂设置"; icon: "qrc:images/sync-alt.svg" }

        }

        Component {
            id: appDelegate
            Item {
                width: 100; height: 100
                scale: PathView.iconScale

                Image {
                    id: myIcon
                    y: 1; anchors.horizontalCenter: parent.horizontalCenter
                    sourceSize.width: 100
                    sourceSize.height: 100
                    source: icon
                    smooth: true
                }
                Text {
                    anchors { top: myIcon.bottom; horizontalCenter: parent.horizontalCenter }
                    text: name
                    color: "ghostwhite"
                    font.bold: true
                    smooth: true
                }
                AlarmSub{
                    id: subwindow_alarm
                }
                HistorySub{
                    id: subwindow_history
                }
                DeviceInfoSub{
                    id: subwindow_device
                }
                FirmwareUpdateSub{
                    id: subwindow_firmware
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked:
                    {
                        view.currentIndex = index
                        if(view.currentIndex == 0)
                        {
                            //定时预约
                            subwindow_alarm.show()
                        }
                        if(view.currentIndex == 1)
                        {
                            //清扫记录
                            subwindow_history.show()
                        }
                        if(view.currentIndex == 2)
                        {
                            //耗材情况
                            subwindow_device.show()
                        }

                        if(view.currentIndex == 3)
                        {
                            //固件升级
                            subwindow_firmware.show()
                        }
                    }
                }
            }
        }

        Component {
            id: appHighlight
            Rectangle { width: 100; height: 100; color: "green" }
        }

        ToolSeparator {
            id: toolSeparator
            x: 384
            y: 200
            width: 520
            height: 13
            orientation: Qt.Horizontal
        }
        /***********below control button**********/

        ColumnLayout{
            id: columnassign
            anchors.top: toolSeparator.bottom
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 40

            //first row
            RowLayout{
                spacing: 220
                //voice switch
                SwitchDelegate {
                    id: voiceSwitch
                    //                x: 137
                    //                y: 255
                    scale: 1.5
                    // text: qsTr("提示音开关")
                    checked: true

                    contentItem: Text {
                        color: "#ffffff"
                        rightPadding: voiceSwitch.indicator.width + voiceSwitch.spacing
                        font: voiceSwitch.font
                        opacity: enabled ? 1.0 : 0.3
                        text: "提示音开关"
                        //font.bold: true
                        elide: Text.ElideRight
                        verticalAlignment: Text.AlignVCenter
                    }

                    indicator: Rectangle {
                        x: 110
                        implicitWidth: 48
                        implicitHeight: 26
                        y: parent.height / 2 - height / 2
                        radius: 13
                        color: voiceSwitch.checked ? "#17a81a" : "transparent"
                        border.color: voiceSwitch.checked ? "#17a81a" : "#cccccc"

                        Rectangle {
                            x: voiceSwitch.checked ? parent.width - width : 0
                            width: 26
                            height: 26
                            radius: 13
                            color: voiceSwitch.down ? "#cccccc" : "#ffffff"
                            border.color: voiceSwitch.checked ? (voiceSwitch.down ? "#17a81a" : "#21be2b") : "#999999"
                        }
                    }

                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 40
                        visible: voiceSwitch.down || voiceSwitch.highlighted
                        color: voiceSwitch.down ? "#bdbebf" : "#eeeeee"
                    }
                }

                //the voice regulation
                RowLayout{
                    spacing: 80
                    Text {
                        id: voiceText
                        color: "#ffffff"
                        text: qsTr("音量调节")
                        font.pixelSize: 16
                        scale: 1.5
                        font.bold: false
                    }
                    Slider {
                        id: voiceRegulation
                        background: Rectangle {
                            x: voiceRegulation.leftPadding
                            y: voiceRegulation.topPadding + voiceRegulation.availableHeight / 2 - height / 2
                            width: voiceRegulation.availableWidth
                            height: implicitHeight
                            color: "#bdbebf"
                            radius: 2
                            implicitHeight: 4
                            implicitWidth: 200
                            Rectangle {
                                width: voiceRegulation.visualPosition * parent.width
                                height: parent.height
                                color: "#21be2b"
                                radius: 2
                            }
                        }
                        scale: 1.5
                        handle: Rectangle {
                            id: handlrect
                            x: voiceRegulation.leftPadding + voiceRegulation.visualPosition * (voiceRegulation.availableWidth - width)
                            y: voiceRegulation.topPadding + voiceRegulation.availableHeight / 2 - height / 2
                            color: voiceRegulation.pressed ? "#f0f0f0" : "#f6f6f6"
                            radius: 13
                            implicitHeight: 26
                            implicitWidth: 26
                            border.color: "#bdbebf"
                        }
                        font.pointSize: 14
                        from: 1
                        value: 25
                        to: 100
                        font.wordSpacing: 0.1
                        onPressedChanged: {
                            if(!voiceRegulation.pressed)
                            {
                                rosclient.setHandle(RosClient.VoiceHandle);
                                rosclient.sendMessageRun(voiceRegulation.value.toFixed(0));
                            }
                        }

                    }
                    Label {
                        id: voiceLabel
                        color: "#f9f9f9"
                        text:  voiceRegulation.value.toFixed(0)
                    }

                }

            }
            /********End:first row*****************/

            //second Row
            RowLayout{
                spacing: 200
                //suction switch
                SwitchDelegate {
                    id: suctionSwitch
                    x: 140
                    y: 351
                    scale: 1.5
                    //text: qsTr("Max吸力模式")
                    checked: true

                    contentItem: Text {
                        color: "#ffffff"
                        rightPadding: suctionSwitch.indicator.width + suctionSwitch.spacing
                        font: suctionSwitch.font
                        opacity: enabled ? 1.0 : 0.3
                        text: "Max吸力模式"
                        //color: control.down ? "#17a81a" : "#21be2b"
                        // font.bold: true
                        elide: Text.ElideRight
                        verticalAlignment: Text.AlignVCenter
                    }

                    indicator: Rectangle {
                        implicitWidth: 48
                        implicitHeight: 26
                        x: suctionSwitch.width - width - suctionSwitch.rightPadding
                        y: parent.height / 2 - height / 2
                        radius: 13
                        color: suctionSwitch.checked ? "#17a81a" : "transparent"
                        border.color: suctionSwitch.checked ? "#17a81a" : "#cccccc"

                        Rectangle {
                            x: suctionSwitch.checked ? parent.width - width : 0
                            width: 26
                            height: 26
                            radius: 13
                            color: suctionSwitch.down ? "#cccccc" : "#ffffff"
                            border.color: suctionSwitch.checked ? (suctionSwitch.down ? "#17a81a" : "#21be2b") : "#999999"
                        }
                    }

                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 40
                        visible: suctionSwitch.down || suctionSwitch.highlighted
                        color: suctionSwitch.down ? "#bdbebf" : "#eeeeee"
                    }
                }
                //suction regulation
                RowLayout{
                    spacing: 80
                    Text {
                        id: suctionText
                        //                x: 390
                        //                y: 373
                        color: "#ffffff"
                        text: qsTr("吸力调节")
                        font.pixelSize: 16
                        scale: 1.5
                        font.bold: false
                    }
                    Slider {
                        id: suctionRegulation
                        //                x: 540
                        //                y: 357
                        background: Rectangle {
                            x: suctionRegulation.leftPadding
                            y: suctionRegulation.topPadding + suctionRegulation.availableHeight / 2 - height / 2
                            width: suctionRegulation.availableWidth
                            height: implicitHeight
                            color: "#bdbebf"
                            radius: 2
                            implicitHeight: 4
                            implicitWidth: 200
                            Rectangle {
                                width: suctionRegulation.visualPosition * parent.width
                                height: parent.height
                                color: "#21be2b"
                                radius: 2
                            }
                        }
                        scale: 1.5
                        handle: Rectangle {
                            x: suctionRegulation.leftPadding + suctionRegulation.visualPosition * (suctionRegulation.availableWidth - width)
                            y: suctionRegulation.topPadding + suctionRegulation.availableHeight / 2 - height / 2
                            color: suctionRegulation.pressed ? "#f0f0f0" : "#f6f6f6"
                            radius: 13
                            implicitHeight: 26
                            implicitWidth: 26
                            border.color: "#bdbebf"
                        }
                        font.pointSize: 14
                        from: 0
                        value: 25
                        to: 100
                        font.wordSpacing: 0.1
                        onPressedChanged: {
                            if(!suctionRegulation.pressed)
                            {
                                rosclient.setHandle(RosClient.SuctionHandle);
                                rosclient.sendMessageRun(suctionRegulation.value.toFixed(0));

                            }
                        }
                    }
                    Label {
                        id: suctionLabel
                        color: "#f9f9f9"
                        text: suctionRegulation.value.toFixed(0)
                    }
                }
            }

            /********End:second row*****************/

            //third Row
            RowLayout{
                spacing: 220
                //pressure Switch
                SwitchDelegate {
                    id: pressureSwitch
                    x: 145
                    y: 432
                    background: Rectangle {
                        color: pressureSwitch.down ? "#bdbebf" : "#eeeeee"
                        implicitHeight: 40
                        implicitWidth: 100
                        visible: pressureSwitch.down || pressureSwitch.highlighted
                    }
                    checked: true
                    indicator: Rectangle {
                        x: 110
                        y: parent.height / 2 - height / 2
                        color: pressureSwitch.checked ? "#17a81a" : "transparent"
                        radius: 13
                        implicitHeight: 26
                        implicitWidth: 48
                        Rectangle {
                            x: pressureSwitch.checked ? parent.width - width : 0
                            width: 26
                            height: 26
                            color: pressureSwitch.down ? "#cccccc" : "#ffffff"
                            radius: 13
                            border.color: pressureSwitch.checked ? (pressureSwitch.down ? "#17a81a" : "#21be2b") : "#999999"
                        }
                        border.color: pressureSwitch.checked ? "#17a81a" : "#cccccc"
                    }
                    scale: 1.5
                    contentItem: Text {
                        color: "#ffffff"
                        text: "地毯增压"
                        elide: Text.ElideRight
                        rightPadding: pressureSwitch.indicator.width + pressureSwitch.spacing
                        opacity: enabled ? 1.0 : 0.3
                        font: pressureSwitch.font
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                //pressure regulation
                RowLayout{
                    spacing: 80
                    Text {
                        id: pressureText
                        //                x: 390
                        //                y: 454
                        color: "#ffffff"
                        text: qsTr("压力调节")
                        font.pixelSize: 16
                        scale: 1.5
                        font.bold: false
                    }

                    Slider {
                        id: pressureRegulation
                        //                x: 540
                        //                y: 453
                        background: Rectangle {
                            x: pressureRegulation.leftPadding
                            y: pressureRegulation.topPadding + pressureRegulation.availableHeight / 2 - height / 2
                            width: pressureRegulation.availableWidth
                            height: implicitHeight
                            color: "#bdbebf"
                            radius: 2
                            implicitHeight: 4
                            implicitWidth: 200
                            Rectangle {
                                width: pressureRegulation.visualPosition * parent.width
                                height: parent.height
                                color: "#21be2b"
                                radius: 2
                            }
                        }
                        scale: 1.5
                        handle: Rectangle {
                            x: pressureRegulation.leftPadding + pressureRegulation.visualPosition * (pressureRegulation.availableWidth - width)
                            y: pressureRegulation.topPadding + pressureRegulation.availableHeight / 2 - height / 2
                            color: pressureRegulation.pressed ? "#f0f0f0" : "#f6f6f6"
                            radius: 13
                            implicitHeight: 26
                            implicitWidth: 26
                            border.color: "#bdbebf"
                        }
                        font.pointSize: 14
                        from: 0
                        value: 25
                        to: 100
                        font.wordSpacing: 0.1
                    }
                    Label {
                        id: pressureLabel
                        color: "#f9f9f9"
                        text: pressureRegulation.value.toFixed(0)
                    }
                }
            }
            /********End:third row*****************/

            //fourth row
            RowLayout{
                spacing: 150
                //water control
                RowLayout{
                    spacing: 50

                    Text {
                        id: waterText
                        //                x: 133
                        //                y: 532
                        color: "#ffffff"
                        text: qsTr("水量控制")
                        scale: 1.5
                        font.pixelSize: 16
                        font.bold: false
                    }
                    ComboBox {
                        id: controlwarter
                        //                x: 246
                        //                y: 529
                        model: ["轻柔", "标准", "强力"]

                        delegate: ItemDelegate {
                            width: controlwarter.width
                            contentItem: Text {
                                text: modelData
                                color: "#21be2b"
                                font: controlwarter.font
                                elide: Text.ElideRight
                                verticalAlignment: Text.AlignVCenter
                            }
                            highlighted: controlwarter.highlightedIndex === index
                        }

                        indicator: Canvas {
                            id: canvas
                            x: controlwarter.width - width - controlwarter.rightPadding
                            y: controlwarter.topPadding + (controlwarter.availableHeight - height) / 2
                            width: 12
                            height: 8
                            contextType: "2d"

                            Connections {
                                target: controlwarter
                                onPressedChanged: canvas.requestPaint()
                            }

                            onPaint: {
                                context.reset();
                                context.moveTo(0, 0);
                                context.lineTo(width, 0);
                                context.lineTo(width / 2, height);
                                context.closePath();
                                context.fillStyle = controlwarter.pressed ? "#17a81a" : "#21be2b";
                                context.fill();
                            }
                        }

                        contentItem: Text {
                            leftPadding: 0
                            rightPadding: controlwarter.indicator.width + controlwarter.spacing

                            text: controlwarter.displayText
                            font: controlwarter.font
                            color: controlwarter.pressed ? "#17a81a" : "#21be2b"
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }

                        background: Rectangle {
                            implicitWidth: 120
                            implicitHeight: 40
                            border.color: controlwarter.pressed ? "#17a81a" : "#21be2b"
                            border.width: controlwarter.visualFocus ? 2 : 1
                            radius: 2
                        }

                        popup: Popup {
                            y: controlwarter.height - 1
                            width: controlwarter.width
                            implicitHeight: contentItem.implicitHeight
                            padding: 1

                            contentItem: ListView {
                                clip: true
                                implicitHeight: contentHeight
                                model: controlwarter.popup.visible ? controlwarter.delegateModel : null
                                currentIndex: controlwarter.highlightedIndex

                                ScrollIndicator.vertical: ScrollIndicator { }
                            }

                            background: Rectangle {
                                border.color: "#21be2b"
                                radius: 2
                            }
                        }
                    }
                }

                //brush speed Control
                RowLayout{
                    spacing: 80

                    Text {
                        id: brushText
                        color: "#ffffff"
                        text: qsTr("边刷速度")
                        scale: 1.5
                        font.bold: false
                        font.pixelSize: 16
                    }

                    Slider {
                        id: brushSpeed
                        //                x: 562
                        //                y: 535
                        font.wordSpacing: 0.1
                        scale: 1.5
                        font.pointSize: 14
                        from: 0
                        value: 25
                        to: 100

                        background: Rectangle {
                            x: brushSpeed.leftPadding
                            y: brushSpeed.topPadding + brushSpeed.availableHeight / 2 - height / 2
                            implicitWidth: 200
                            implicitHeight: 4
                            width: brushSpeed.availableWidth
                            height: implicitHeight
                            radius: 2
                            color: "#bdbebf"

                            Rectangle {
                                width: brushSpeed.visualPosition * parent.width
                                height: parent.height
                                color: "#21be2b"
                                radius: 2
                            }
                        }

                        handle: Rectangle {
                            x: brushSpeed.leftPadding + brushSpeed.visualPosition * (brushSpeed.availableWidth - width)
                            y: brushSpeed.topPadding + brushSpeed.availableHeight / 2 - height / 2
                            implicitWidth: 26
                            implicitHeight: 26
                            radius: 13
                            color: brushSpeed.pressed ? "#f0f0f0" : "#f6f6f6"
                            border.color: "#bdbebf"
                        }
                    }
                    Label {
                        id: brushLabel
                        color: "#f9f9f9"
                        text: brushSpeed.value.toFixed(0)
                    }
                }
            }
            /****************End: fourth row*****************/

        }


    }

}


