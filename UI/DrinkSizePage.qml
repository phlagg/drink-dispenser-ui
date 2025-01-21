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
        color: {
            if( drinkIsHot && (systemController.drinkSize === SystemController.MEDIUM))
                return "#F69678"
            else if(!drinkIsHot && (systemController.drinkSize === SystemController.MEDIUM))
                return "#9ECCED"
            else
                return "#C4C4C4"
        }
        anchors.centerIn: parent
        Image {
            id: centerButtonImage
            anchors.centerIn: parent
            width: 110
            height: 110
            source: drinkIsHot ? "qrc:/UI/Assets/coffee-cup.png" : "qrc:/UI/Assets/soda.png"
            Text {
                color: "black"
                font.pixelSize: 28
                text: "Medium"
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.bottom
                    topMargin: 10
                }
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: systemController.setDrinkSize(SystemController.MEDIUM)
        }

    }
    Rectangle {
        id: leftButton
        width: 281
        height: 281
        radius: 281 /2
        color: {
            if( drinkIsHot && (systemController.drinkSize === SystemController.SMALL))
                return "#F69678"
            else if(!drinkIsHot && (systemController.drinkSize === SystemController.SMALL))
                return "#9ECCED"
            else
                return "#C4C4C4"
        }
        anchors {
            right: centerButton.left
            rightMargin: 52
            verticalCenter: centerButton.verticalCenter
        }

        Image {
            id: leftButtonImage
            anchors.centerIn: parent
            width: 75
            height: 75
            source: drinkIsHot ? "qrc:/UI/Assets/coffee-cup.png" : "qrc:/UI/Assets/soda.png"
            Text {
                color: "black"
                font.pixelSize: 28
                text: "Small"
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.bottom
                    topMargin: 10
                }
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: systemController.setDrinkSize(SystemController.SMALL)
        }




    }
    Rectangle {
        id: rightButton
        width: 281
        height: 281
        radius: 281 /2
        color: {
            if( drinkIsHot && (systemController.drinkSize === SystemController.LARGE))
                return "#F69678"
            else if(!drinkIsHot && (systemController.drinkSize === SystemController.LARGE))
                return "#9ECCED"
            else
                return "#C4C4C4"
        }
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
            source: drinkIsHot ? "qrc:/UI/Assets/coffee-cup.png" : "qrc:/UI/Assets/soda.png"
            Text {
                color: "black"
                font.pixelSize: 28
                text: "Large"
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.bottom
                    topMargin: 10
                }
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: systemController.setDrinkSize(SystemController.LARGE)
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
                systemController.setDrinkSize(SystemController.NOSIZE)
                stackView.pop()
            }
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

    Image {
        id: startOverButton
        width: 60
        height: 60
        anchors {
            bottom: startOverText.top
            horizontalCenter: startOverText.horizontalCenter
            bottomMargin: 10
        }
        source: drinkIsHot ? "qrc:/UI/Assets/resetHot.png" : "qrc:/UI/Assets/resetCold.png"
        MouseArea {
            anchors.fill: parent
            onPressed: {startOverButton.width = 58; startOverButton.height = 58}
            onReleased: {startOverButton.width = 60; startOverButton.height = 60}
            onClicked: {
                systemController.setDrinkType("NONE")
                systemController.setDrinkSize(SystemController.NOSIZE)
                systemController.setDrinkTemperature(SystemController.NONE)
                stackView.pop(null)
            }
        }
    }

    Text {
        id: startOverText
        font.pixelSize: 36
        color: drinkIsHot ? "#F69678" : "#9ECCED"
        anchors {
            top: backText.top
            right: rightButton.right
        }
        text: "Start Over"
    }

    Rectangle {
        id: startButton
        width: 125
        height: 125
        radius: 125/2
        color: drinkIsHot ? "#F69678" : "#9ECCED"
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: backButton.verticalCenter
        }

        Text {
            anchors.centerIn: parent
            font.pixelSize: 36
            color: mainBackground.color
            text: "Start"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: stackView.push( "DispensingScreen.qml" )
        }

    }
}

