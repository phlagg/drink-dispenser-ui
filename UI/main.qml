import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import Phlagg 1.0

Window {
    id: root
    width: 1024
    height: 680
    visible: true
    title: qsTr("Drink Dispenser UI")

    SystemController {
        id: systemController


    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem:  "qrc:/UI/HotColdSelectionScreen.qml"
    }

    StatusBar {
        id: statusBar
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter

        }
    }
}
