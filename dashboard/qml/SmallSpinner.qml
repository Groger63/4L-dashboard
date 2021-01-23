
import QtQuick 2.0


Item {
    id : root
    height: 48
    width: 32*6
    clip : true
    onValueChanged: {
        digit3.currentIndex = value / Math.pow(10, 4 - 1) % 10;
        digit4.currentIndex = value / Math.pow(10, 3 - 1) % 10;
        digit5.currentIndex = value / Math.pow(10, 2 - 1) % 10;
        digit6.currentIndex = value / Math.pow(10, 1 - 1) % 10;
    }

    property real value: 0
    Rectangle {
        id: list3
        color: "#2E2E2E"
        border.color: "black"
        border.width: 3
        height: parent.height
        width : parent.width/6
        anchors.left : parent.left
        anchors.leftMargin: root.width/15
        ListView {
            id : digit3
            anchors.horizontalCenter: parent.horizontalCenter
//            y : -parent.height * 0.3
            highlightRangeMode: ListView.StrictlyEnforceRange
            preferredHighlightBegin: height/3
            preferredHighlightEnd: height/3
            clip: false
            model: 10
            delegate: Text {
                font.pixelSize: root.height*0.8;
                color: "white";
                text: index;
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            anchors.fill: parent
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#FF000000" }
                GradientStop { position: 0.45; color: "#00000000" }
                GradientStop { position: 0.55; color: "#00000000" }
                GradientStop { position: 1.0; color: "#FF000000" }
            }
        }
    }
    Rectangle {
        id: list4
        color: "#2E2E2E"
        border.color: "black"
        border.width: 3
        height: parent.height
        width : parent.width/6
        anchors.left : list3.right
        anchors.leftMargin: root.width/15
        ListView {
            id : digit4
            anchors.horizontalCenter: parent.horizontalCenter
//            y : -parent.height * 0.3
            highlightRangeMode: ListView.StrictlyEnforceRange
            preferredHighlightBegin: height/3
            preferredHighlightEnd: height/3
            clip: false
            model: 10
            delegate: Text {
                font.pixelSize: root.height*0.8;
                color: "white";
                text: index;
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            anchors.fill: parent
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#FF000000" }
                GradientStop { position: 0.45; color: "#00000000" }
                GradientStop { position: 0.55; color: "#00000000" }
                GradientStop { position: 1.0; color: "#FF000000" }
            }
        }
    }
    Rectangle {
        id: list5
        color: "#2E2E2E"
        border.color: "black"
        border.width: 3
        height: parent.height
        width : parent.width/6
        anchors.left : list4.right
        anchors.leftMargin: root.width/15
        ListView {
            id : digit5
            anchors.horizontalCenter: parent.horizontalCenter
//            y : -parent.height * 0.3
            highlightRangeMode: ListView.StrictlyEnforceRange
            preferredHighlightBegin: height/3
            preferredHighlightEnd: height/3
            clip: false
            model: 10
            delegate: Text {
                font.pixelSize: root.height*0.8;
                color: "white";
                text: index;
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            anchors.fill: parent
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#FF000000" }
                GradientStop { position: 0.45; color: "#00000000" }
                GradientStop { position: 0.55; color: "#00000000" }
                GradientStop { position: 1.0; color: "#FF000000" }
            }
        }
    }
    Rectangle {
        id: list6
        color : "#9c2521"
        border.color: "black"
        border.width: 3
        height: parent.height
        width : parent.width/6
        anchors.left : list5.right
        anchors.leftMargin: root.width/15
        ListView {
            id : digit6
            anchors.horizontalCenter: parent.horizontalCenter
//            y : -parent.height * 0.3
            highlightRangeMode: ListView.StrictlyEnforceRange
            preferredHighlightBegin: height/3
            preferredHighlightEnd: height/3
            clip: false
            model: 10
            delegate: Text {
                font.pixelSize: root.height*0.8;
                color: "white";
                text: index;
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            anchors.fill: parent
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#FF000000" }
                GradientStop { position: 0.45; color: "#00000000" }
                GradientStop { position: 0.55; color: "#00000000" }
                GradientStop { position: 1.0; color: "#FF000000" }
            }
        }
    }
}

