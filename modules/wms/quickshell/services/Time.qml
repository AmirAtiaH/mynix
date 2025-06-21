// Time.qml
pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root

  function format(fmt: string): string {
    return Qt.formatDateTime(clock.date, fmt);
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}