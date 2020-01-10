
//![1]
import QtQuick 2.0
import QtQuick.Window 2.2

import QtQuick.Controls 2.12

//Item {
//    width: 1280
//    height: 720
Window{
    id: rootWindow
    visible: true
    width: 1280
    height: 720


    signal indexChanged(variant index)

    MainForm {
        id: mainwindow
        anchors.fill: parent

        onCurrentIndexChanged: {
            emit: indexChanged(mainwindow.currentIndex);
        }

    }
    //    Rectangle {
    //        id: wroot
    //        visible: true
    //        anchors.fill: parent
    //        gradient: Gradient {
    //            GradientStop {
    //                position: 0.00;
    //                color: "#000000";
    //            }
    //            GradientStop {
    //                position: 0.89;
    //                color: "#808080";
    //            }
    //        }

    //        Loader {
    //            id: splashLoader
    //            anchors.fill: parent
    //            source: "SplashScreen.qml"
    //            asynchronous: false
    //            visible: true

    //            onStatusChanged: {
    //                if (status === Loader.Ready) {
    //                    appLoader.setSource("MainForm.ui.qml");
    //                }
    //            }
    //        }

    //        Connections {
    //            target: splashLoader.item
    //            onReadyToGo: {
    //                appLoader.visible = true
    //                appLoader.item.init()
    //                splashLoader.visible = false
    //                splashLoader.setSource("")
    //                appLoader.item.forceActiveFocus();
    //            }
    //        }

    //        Loader {
    //            id: appLoader
    //            anchors.fill: parent
    //            visible: false
    //            asynchronous: true
    //            onStatusChanged: {
    //                if (status === Loader.Ready)
    //                    splashLoader.item.appReady()
    //                if (status === Loader.Error)
    //                    splashLoader.item.errorInLoadingApp();
    //            }
    //        }

    //    }

}
//引用了MainForm.ui.qml的内容
//    MainForm {
//        id: mainwindow
//        anchors.fill: parent

//    }



