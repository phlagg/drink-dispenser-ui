import QtQuick 2.15
import Phlagg 1.0
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Rectangle {
    property bool drinkIsHot: true

    Timer {
        id: dispensingTimer
        interval: 3000
        running: false
        onTriggered: stackView.push("FinishScreen.qml")

    }
    Component.onCompleted: {
        systemController.startOrder()
        dispensingTimer.start()
    }

    id: mainBackground
    color: {
        if (systemController.drinkTemperature === SystemController.HOT){
            drinkIsHot = true
            return "#EE1C25"
        }
        else if (systemController.drinkTemperature === SystemController.COLD){
            drinkIsHot = false
            return "#1BA6DF"
        }
    }

    BusyIndicator {
        id: dispensingBusyIndicator
        anchors.centerIn: parent
        width: 281
        height: 281
        Material.accent: {
            color: drinkIsHot ? "#F69678" : "#9ECCED"
        }

    }

    Text {
        id: dispensingBusyText
        font.pixelSize: 96
        color: drinkIsHot ? "#F69678" : "#9ECCED"
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: dispensingBusyIndicator.bottom
            topMargin: 15

        }

        text: "Dispensing..."
    }

}
