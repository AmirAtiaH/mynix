// Bar.qml
import Quickshell

Scope {
  // no more time object

  Variants {
    model: Quickshell.screens

    PanelWindow {
      property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        bottom: true
      }

      implicitWidth: 30

      ClockWidget {
        anchors.centerIn: parent
      }
    }
  }
}