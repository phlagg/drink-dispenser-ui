import QtQuick 2.15
import Phlagg 1.0

Rectangle {
    property bool drinkIsHot: true

    Timer {
        id: finishTimer
        interval: 1500
        running: false
        onTriggered: {
            systemController.setDrinkType("NONE")
            systemController.setDrinkSize(SystemController.NOSIZE)
            systemController.setDrinkTemperature(SystemController.NONE)
            stackView.pop(null)
        }

    }

    Component.onCompleted: finishTimer.start()

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

    Image {
        id: finishImage
        width: 256
        height:  256
        anchors.centerIn: parent
        source: drinkIsHot ? "qrc:/UI/Assets/tickHot.png" : "qrc:/UI/Assets/tickCold.png"
    }

    Text {
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: finishImage.bottom
            topMargin: 20
        }
        font.pixelSize: 96
        color: drinkIsHot ? "#F69678" : "#9ECCED"
        text: "Enjoy!"
    }
}
