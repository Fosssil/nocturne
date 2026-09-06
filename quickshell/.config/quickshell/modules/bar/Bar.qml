import QtQuick
import Quickshell

PanelWindow {
    implicitHeight: 32
    exclusiveZone: implicitHeight
    color: "#1e1e2e"

    anchors {
        top: true
        left: true
        right: true
    }

    Text {
        anchors.centerIn: parent
        text: "Nocturne"
        color: "#cdd6f4"
    }

}
