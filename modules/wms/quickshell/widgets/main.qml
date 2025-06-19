import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "modules"
import "style/Theme.qml" as Theme

ApplicationWindow {
    visible: true
    width: 300
    height: 600
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint
    color: "transparent"

    Rectangle {
        anchors.fill: parent
        color: Theme.background
        radius: Theme.radius

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: Theme.padding
            spacing: Theme.padding

            Clock { Layout.fillWidth: true }
            // Add more modules here
        }
    }
}
