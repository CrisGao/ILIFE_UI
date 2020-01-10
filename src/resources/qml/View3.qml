/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Charts module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0
//import QtCharts 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.2


Item {
    id: view3
    width: 1280
    height: 720
    anchors.fill: parent

    Rectangle{
        anchors.fill: parent
        color: "#2d3037"

        ColumnLayout {
            y: 8
            // anchors.horizontalCenter: parent.horizontalCenter
            // anchors.centerIn: parent
            anchors.left: parent.left
            anchors.leftMargin: 500
            anchors.top: parent.top
            anchors.topMargin: 50
            // Layout.preferredWidth: 350
            Layout.fillWidth: true
            Layout.fillHeight: true

            Text {
                id: element
                //x: 540
                //y: 88
                color: "#ffffff"
                anchors.centerIn: parent.Center
                text: qsTr("ILIFE Chart Tool")
                horizontalAlignment: Text.AlignLeft
                font.bold: true
                font.pixelSize: 30
            }

            ColumnLayout {
                y: 8
                anchors.top: element.top
                anchors.topMargin: 100
                //                Layout.top: element.top
                //                Layout.topMargin: 100
                Layout.preferredWidth: 350
                Layout.fillWidth: true
                Layout.fillHeight: true

                Text {
                    id: element1
                    // x: 332
                    // y: 236

                    color: "#ffffff"
                    text: qsTr("软件名称: ILIFE TEST TOOL")
                    font.weight: Font.Thin
                    font.family: "Arial"
                    font.pixelSize: 18
                }


                Text {
                    id: element2
                    //  x: 332
                    //  y: 280
                    color: "#ffffff"
                    text: qsTr("版本号： Version 0.0.1")
                    font.family: "Arial"
                    font.weight: Font.Thin
                    font.pixelSize: 18
                }

                Text {
                    id: element3
                    //  x: 332
                    // y: 322
                    color: "#ffffff"
                    text: qsTr("功能介绍： 一款便于操作的软件")
                    font.family: "Arial"
                    font.weight: Font.Thin
                    font.pixelSize: 18
                }

                Text {
                    id: element4
                    //   x: 332
                    //  y: 370
                    color: "#ffffff"
                    text: qsTr("创建日期: 2019.11.15")
                    font.family: "Arial"
                    font.weight: Font.Thin
                    font.pixelSize: 18
                }

                Text {
                    id: element5
                    //  x: 332
                    //  y: 409
                    color: "#ffffff"
                    text: qsTr("更新日期: 2019.11.15")
                    font.family: "Arial"
                    font.weight: Font.Thin
                    font.pixelSize: 18
                }

                Text {
                    id: element6
                    //  x: 332
                    //  y: 451
                    color: "#ffffff"
                    text: qsTr("联络方式: ")
                    font.family: "Arial"
                    font.weight: Font.Thin
                    font.pixelSize: 18
                }

                Text {
                    id: element7
                    //  x: 332
                    //  y: 492
                    color: "#ffffff"
                    text: qsTr("邮箱:  ILIFE@263.com")
                    font.family: "Arial"
                    font.weight: Font.Thin
                    font.pixelSize: 18
                }

                Text {
                    id: element8
                    //   x: 332
                    //  y: 547
                    color: "#ffffff"
                    text: qsTr("电话:  400-963-8886")
                    font.family: "Arial"
                    font.weight: Font.Thin
                    font.pixelSize: 18
                }

                Text {
                    id: element9
                    //   x: 343
                    //   y: 580
                    color: "#ffffff"
                    text: qsTr("微信公众号:  ILIFE智意")
                    font.family: "Arial"
                    font.weight: Font.Thin
                    font.pixelSize: 18
                }

                Text {
                    id: element10
                    //  x: 349
                    //   y: 607
                    color: "#ffffff"
                    text: qsTr("官网: ")
                    font.family: "Arial"
                    font.weight: Font.Thin
                    font.pixelSize: 18
                    Text {
                        anchors.left: element10.right
                        anchors.leftMargin: 5
                        anchors.top: element10.top
                        anchors.topMargin: 5
                        text: '<html></style><a href="https://www.iliferobot.cn/">https://www.iliferobot.cn/</a></html>'
                        MouseArea {
                            anchors.fill: parent;
                            hoverEnabled: true;
                            cursorShape:
                                (containsMouse? Qt.PointingHandCursor: Qt.ArrowCursor);
                            onClicked: Qt.openUrlExternally("https://www.iliferobot.cn/")
                        }

                    }
                }

            }
        }
        Image{
            x: 500
            y: 500
            source: "qrc:/images/ilife.png"
        }
        Text {
            id: element11
            anchors.bottom: parent.bottom
            anchors.bottomMargin:  50
            //anchors.left: parent.left
            // anchors.leftMargin: 500
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#ffffff"
            text: qsTr("COPYRIGHT © 2007-2019 ILIFE ALL RIGHTS RESERVED ")
            font.family: "Times New Roman"
            font.weight: Font.Thin
            font.pixelSize: 18
        }
        //  id:page4
    }

}

