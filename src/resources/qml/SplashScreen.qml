

import QtQuick 2.5
import "."

Item {
    id: root
    anchors.fill: parent

    property bool appIsReady: false
    property bool splashIsReady: false

    property bool ready: appIsReady && splashIsReady
    onReadyChanged: if (ready) readyToGo();

    signal readyToGo()

    function appReady()
    {
        appIsReady = true
    }

    function errorInLoadingApp()
    {
        Qt.quit()
    }

    function heightForWidth(w, ss)
    {
        return w/ss.width * ss.height;
    }

    Image {
        anchors.centerIn: parent
        width: Math.min(parent.height, parent.width)*0.6
        height: heightForWidth(width, sourceSize)
        source: "qrc:qml/images/login.png"
    }
    Text{
        color: "mintcream"
        anchors.centerIn: parent
        text: "ILIFE Chart Tool"
        font.pointSize: 70
        font.bold: true
    }

    Timer {
        id: splashTimer
        interval: 2000
        onTriggered: splashIsReady = true
    }

    Component.onCompleted: splashTimer.start()
}
