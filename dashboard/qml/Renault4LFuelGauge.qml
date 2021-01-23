import QtQuick 2.0
import QtQuick.Shapes 1.12

Item {
    id : root
    property real value: 0



    Rectangle {
        id : container

        anchors.centerIn: parent
        radius : height
        height : parent.height
        width: parent.width
        clip : true
        color : "transparent"

        border.color: "black"
        border.width: 1

        Item {
            id : thingy
            anchors.fill : parent
            Rectangle {
                id : reserve
                color : "#880000"
                radius : 3
                height : container.height/2 - ( container.height * 0.10 )
                width: container.width/8
                anchors.bottom : thingy.verticalCenter
                x : container.width/7
            }
            Rectangle {
                id : ligneHorizontale
                color : "#BBBBBB"
                height: 4
                width : container.width *2/5
                anchors {
                    left : reserve.right
                    leftMargin: 4
                    bottom : thingy.verticalCenter
                }
            }
            Rectangle {
                id : ligneQuiPartYOLO
                antialiasing: true
                color : "#BBBBBB"
                width : container.width/20
                height: 4
                rotation: -60
                anchors {
                    left : ligneHorizontale.right
                    leftMargin: -4
                }
                y : (container.height* 0.41)
            }
            Image {
                id : logoPompe
                source : "qrc:/images/fuel-icon.png"
                anchors {
                    horizontalCenter: thingy.horizontalCenter
                    top: ligneHorizontale.bottom
                    topMargin: height/3
                }
                width : thingy.width/7
                height: width* 1.2
            }
            Rectangle {
                id : bitonio1
                color : "#BBBBBB"
                height : thingy.height/5
                width : 10
                anchors {
                    bottom : ligneHorizontale.top
                    bottomMargin: 10
                    left : logoPompe.left
                }
            }
            Rectangle {
                id : bitonio2
                color : "#BBBBBB"
                height : thingy.height/5
                width : 10
                anchors {
                    bottom : ligneHorizontale.top
                    bottomMargin: 10
                    left : bitonio1.right
                    leftMargin: 5
                }
            }
            Rectangle {
                id : bitonio3
                color : "#BBBBBB"
                clip : true
//                height: 18
                width : 18
                Rectangle {
                    rotation : 20
                    y : -5
                    x : 8
                    color : "black"
                    width : 5
                    height: 40
                }

                anchors {
                    top : bitonio1.top
                    bottom : ligneQuiPartYOLO.top
                    bottomMargin: 10
                    left : ligneQuiPartYOLO.right
//                    leftMargin: -5
                }
            }
        }

        Item {
            id : indicator
            anchors.bottom : container.bottom
            anchors.left : parent.left
            anchors.right : parent.right

            height : container.height

            Rectangle {
                antialiasing: true
                height : 15
                border.color: "black"
                border.width: 2
                anchors.horizontalCenter: indicator.horizontalCenter
                width : indicator.height *2
                color : "#F3BE10"
                rotation: -55 + (root.value * 105) - 90
                y : 25 * 5

                Rectangle {
                    antialiasing: true
                    anchors.fill : parent
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#FF000000" }
                        GradientStop { position: 0.2; color: "#00000000" }
                        GradientStop { position: 0.8; color: "#00000000" }
                        GradientStop { position: 1.0; color: "#FF000000" }
                    }
                }
            }
        }
    }
    Rectangle {
        id : mask

        anchors.centerIn: parent
        radius : height
        height : parent.height
        width: parent.width
        clip : true
        color : "#33000000"

        border.color: "black"
        border.width: 3


        gradient : RadialGradient {
            GradientStop { position: 0; color: "#FF000000" }
            GradientStop { position: 0.15; color: "#00000000" }
//            GradientStop { position: 0.1; color: "#00000000" }
        }
    }
}
