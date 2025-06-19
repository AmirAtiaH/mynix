pragma Singleton
import QtQuick 2.15

QtObject {
    property color background: Qt.rgba(0.1, 0.1, 0.1, 0.9)
    property color foreground: "white"
    property color accent: "#4fc3f7" // fallback, Stylix may override via env var
    property int padding: 8
    property int radius: 10
}
