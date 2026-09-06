// import QtQuick
// import Quickshell
// PanelWindow {
//     implicitHeight: 32
//     exclusiveZone: implicitHeight
//     color: "#1e1e2e"
//     anchors {
//         top: true
//         left: true
//         right: true
//     }
//     Text {
//         anchors.centerIn: parent
//         text: "Nocturne"
//         color: "#cdd6f4"
//     }
// }

import QtQuick
import QtQuick.Layouts
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

    RowLayout {
        anchors.fill: parent

        Item {
            Layout.fillWidth: true

            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                text: "LEFT"
                color: "#cdd6f4"
            }

        }

        Item {
            Layout.fillWidth: true

            Text {
                anchors.centerIn: parent
                text: "CENTER"
                color: "#cdd6f4"
            }

        }

        Item {
            Layout.fillWidth: true

            Text {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                text: "RIGHT"
                color: "#cdd6f4"
            }

        }

    }

}
