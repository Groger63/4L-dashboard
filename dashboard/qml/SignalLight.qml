import QtQuick 2.0

Item {
    id : root


    property bool active : false
    property bool blink: false
    property alias source : icon.source
    property alias color : container.color


    Rectangle {
        id : iconBackground
        anchors.centerIn: parent
        radius : height
        height : parent.height
        width: parent.height
        clip : true
        color : "black"

        border.color: "black"
        border.width: 3
    }

    Rectangle {
        id : container
        anchors.centerIn: parent
        radius : height
        height : parent.height
        width: parent.height
        clip : true
        color : "black"

        opacity: icon.active == true ? 1 : 0.15
        border.color: "black"
        border.width: 3
        Image {
            id :icon
            clip : true

    //        height: parent.height *2/3
            width: container.width *4/6
            height: container.height *4/6
    //        width : parent.width
            property bool active : false

            anchors.centerIn: parent
        }
    }


    Rectangle {
        id : roundThingy
        anchors.centerIn: parent
        radius : height
        height : parent.height
        width: parent.height
        clip : true
        color : "transparent"

        border.color: "black"
        border.width: 3
    }


    Timer {
        id : blinkTimer
        interval: 500
        repeat: true
        running: root.active && root.blink
        onTriggered: icon.active = !icon.active
    }

    onActiveChanged : icon.active = root.active

}
