import QtQuick 2.15
import QtQuick.Controls 2.15
import "../style/Theme.qml" as Theme

Rectangle {
    width: parent.width
    height: 50
    color: "transparent"

    Text {
        id: clockText
        anchors.centerIn: parent
        color: Theme.foreground
        font.pixelSize: 20
        text: Qt.formatDateTime(new Date(), "hh:mm:ss AP")

        Timer {
            interval: 1000
            repeat: true
            running: true
            onTriggered: clockText.text = Qt.formatDateTime(new Date(), "hh:mm:ss AP")
        }
    }
}
