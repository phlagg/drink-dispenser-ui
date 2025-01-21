import QtQuick 2.15
import Phlagg 1.0

Rectangle {
    property bool drinkIsHot: true

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

    Rectangle {
        id: centerButton
        width: 281
        height: 281
        radius: 281 /2
        color: "#C4c4c4"
        anchors.centerIn: parent
        Image {
            id: centerButtonImage
            anchors.centerIn: parent
            width: 156
            height: 156
            source: drinkIsHot ? "qrc:/UI/Assets/tea.png" : "qrc:/UI/Assets/cold.png"
            Text {
                color: "black"
                font.pixelSize: 28
                text: drinkIsHot ? "Tea" : "Cold Brew"
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.bottom
                    topMargin: 10
                }
            }
        }
        MouseArea {
            anchors.fill: parent
            onPressed: drinkIsHot ? parent.color = "#F69678" : parent.color = "#9ECCED"
            onReleased: parent.color = "#C4c4c4"
            onClicked: {
                drinkIsHot ? systemController.setDrinkType("Tea") : systemController.setDrinkType("Cold Brew")
                stackView.push("qrc:/UI/DrinkSizePage.qml")
            }
        }

    }
    Rectangle {
        id: leftButton
        width: 281
        height: 281
        radius: 281 /2
        color: "#C4c4c4"
        anchors {
            right: centerButton.left
            rightMargin: 52
            verticalCenter: centerButton.verticalCenter
        }

        Image {
            id: leftButtonImage
            anchors.centerIn: parent
            width: 156
            height: 156
            source: drinkIsHot ? "qrc:/UI/Assets/coffee-beans.png" : "qrc:/UI/Assets/softdrinks.png"
            Text {
                color: "black"
                font.pixelSize: 28
                text: drinkIsHot ? "Coffee" : "Soda"
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.bottom
                    topMargin: 10
                }
            }
        }
        MouseArea {
            anchors.fill: parent
            onPressed: drinkIsHot ? parent.color = "#F69678" : parent.color = "#9ECCED"
            onReleased: parent.color = "#C4c4c4"
            onClicked: {
                drinkIsHot ? systemController.setDrinkType("Coffee") : systemController.setDrinkType("Soda")
                stackView.push("qrc:/UI/DrinkSizePage.qml")
            }

        }


    }
    Rectangle {
        id: rightButton
        width: 281
        height: 281
        radius: 281 /2
        color: "#C4c4c4"
        anchors {
            left: centerButton.right
            leftMargin: 52
            verticalCenter: centerButton.verticalCenter
        }
        Image {
            id: rightButtonImage
            anchors.centerIn: parent
            width: 156
            height: 156
            source: "qrc:/UI/Assets/drop.png"
            Text {
                color: "black"
                font.pixelSize: 28
                text: drinkIsHot ? "Hot Water" : "Cold Water"
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.bottom
                    topMargin: 10
                }
            }
        }
        MouseArea {
            anchors.fill: parent
            onPressed: drinkIsHot ? parent.color = "#F69678" : parent.color = "#9ECCED"
            onReleased: parent.color = "#C4c4c4"
            onClicked: {
                drinkIsHot ? systemController.setDrinkType("Hot Water") : systemController.setDrinkType("Cold Water")
                stackView.push("qrc:/UI/DrinkSizePage.qml")
            }
        }

    }

    Image {
        id: backButton
        width: 60
        height: 60
        anchors {
            bottom: parent.bottom
            bottomMargin: 100
            left: leftButton.left
        }
        source: drinkIsHot ? "qrc:/UI/Assets/previousHot.png" : "qrc:/UI/Assets/previousCold.png"
        MouseArea {
            anchors.fill: parent
            onPressed: {backButton.width = 58; backButton.height = 58}
            onReleased: {backButton.width = 60; backButton.height = 60}
            onClicked: {
                systemController.setDrinkType(SystemController.NONE)
                stackView.pop()
            }
        }

        Text {
            id: backText
            font.pixelSize: 36
            color: drinkIsHot ? "#F69678" : "#9ECCED"
            anchors {
                top: backButton.bottom
                topMargin: 10
                horizontalCenter: backButton.horizontalCenter
            }
            text: "Back"
        }
    }


}

