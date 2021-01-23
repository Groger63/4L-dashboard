import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

Window {
    id: root
    visible: true
    width: 1200
    height: width/2

    color: "#333333"
    title: "Rono 4L"

    ValueSource {
        id: valueSource
    }

    // Dashboards are typically in a landscape orientation, so we need to ensure
    // our height is never greater than our width.
    Item {
        id: container
        width: root.width
        height: root.height
        anchors.centerIn: parent


        CircularGauge {
            id: speedometer
            value: valueSource.kph
            anchors {
                left: container.left
                top: container.top
                bottom: container.bottom
                right: signals.left
                topMargin: container.width/60
                bottomMargin:  container.width/60
            }
            maximumValue: 180

            width: container.width/2
            height: container.height

            style: Renault4LDashboardGaugeStyle {
                totalKilometers: valueSource.totalKilometers
                tempKilometers: valueSource.tempKilometers
            }
        }


        Item {
            id : signals

            anchors.right : container.right
            width: container.width/2
            height: container.height

            Rectangle {
                id : topRow
                border.color: "black"
                border.width: 3
                color : "transparent"
                anchors {
                    top : signals.top
                    right : signals.right
                    topMargin: signals.height/30
                    rightMargin: signals.height/30
                }
                height: signals.height/5
                width : signals.width
                radius: signals.height/10

                SignalLight {
                    id : glowPlug
                    anchors.right : topRow.right
                    anchors.verticalCenter : topRow.verticalCenter
                    source : "qrc:/images/glow-plug-icon.png"
                    active: valueSource.glowPlug
                    color : "orange"

                    anchors.margins : topRow.height/7
                    width : topRow.width/5 - anchors.margins
                    height: width

                }
                SignalLight {
                    id : blinkers
                    anchors.right : glowPlug.left
                    anchors.verticalCenter : topRow.verticalCenter
                    source : "qrc:/images/blinkers-icon.png"
                    active: valueSource.turnSignal != -1
                    blink : true
                    color : "green"

                    anchors.margins : topRow.height/7
                    width : topRow.width/5 - anchors.margins
                    height: width

                }
                SignalLight {
                    id : fuel
                    anchors.right : blinkers.left
                    anchors.verticalCenter : topRow.verticalCenter
                    source : "qrc:/images/fuel-icon.png"
                    active: valueSource.lowFuel
                    color : "orange"

                    anchors.margins : topRow.height/7
                    width : topRow.width/5 - anchors.margins
                    height: width

                }
            }

            Rectangle {
                id : middleRow
                border.color: "black"
                border.width: 3
                color : "transparent"
                anchors {
                    top : topRow.bottom
                    right : signals.right
                    topMargin: signals.height/15
                    rightMargin: signals.height/30
                }
                height: 2*topRow.height
                width : signals.width *(4/5)
                radius: signals.height/10

                Item {
                    id: topMiddleRow
                    anchors {
                        top : parent.top
                        right : parent.right
                        left : parent.left
                        topMargin: height/15
                    }
                    height : parent.height / 2

                    SignalLight {
                        id : highBeams
                        anchors.right : topMiddleRow.right
                        anchors.verticalCenter : topMiddleRow.verticalCenter
                        source : "qrc:/images/highbeams-icon.png"
                        active: valueSource.highBeams
                        color : "green"

                        anchors.leftMargin : topRow.height/7
                        anchors.rightMargin : topRow.height/14
                        width : topRow.width/5 - anchors.leftMargin
                        height: width

                    }
                    SignalLight {
                        id : rearDefrost
                        anchors.right : highBeams.left
                        anchors.verticalCenter : topMiddleRow.verticalCenter
                        source : "qrc:/images/rear-defrost-icon.png"
                        active: valueSource.rearDefrost
                        color : "orange"

                        anchors.margins : topRow.height/7
                        width : topRow.width/5 - anchors.margins
                        height: width

                    }
                    SignalLight {
                        id : rearFogLights
                        anchors.right : rearDefrost.left
                        anchors.verticalCenter : topMiddleRow.verticalCenter
                        source : "qrc:/images/rear-foglights-icon.png"
                        active: valueSource.rearFogLamp
                        color : "orange"

                        anchors.margins : topRow.height/7
                        width : topRow.width/5 - anchors.margins
                        height: width

                    }
                    SignalLight {
                        id : headLights
                        anchors.right : rearFogLights.left
                        anchors.verticalCenter : topMiddleRow.verticalCenter
                        source : "qrc:/images/headlights-icon.png"
                        active: valueSource.headLights
                        color : "orange"

                        anchors.margins : topRow.height/7
                        width : topRow.width/5 - anchors.margins
                        height: width

                    }
                }
                Item {
                    id: bottomMiddleRow

                    anchors {
                        bottom : parent.bottom
                        right : parent.right
                        left : parent.left
                        topMargin: - height/15
                    }
                    height : parent.height / 2
                    SignalLight {
                        id : hazards
                        anchors.right : bottomMiddleRow.right
                        anchors.verticalCenter : bottomMiddleRow.verticalCenter
                        source : "qrc:/images/hazard-lights-icon.png"
                        active: valueSource.hazardsLights
                        blink : true
                        color : "red"

                        anchors.margins : topRow.height/7
                        width : topRow.width/5 - anchors.margins
                        height: width

                    }
                    SignalLight {
                        id : starter
                        anchors.right : hazards.left
                        anchors.verticalCenter : bottomMiddleRow.verticalCenter
                        source : "qrc:/images/starter-icon.png"
                        active: valueSource.starter
                        color : "orange"

                        anchors.margins : topRow.height/7
                        width : topRow.width/5 - anchors.margins
                        height: width

                    }
                    SignalLight {
                        id : temperature
                        anchors.right : starter.left
                        anchors.verticalCenter : bottomMiddleRow.verticalCenter
                        source : "qrc:/images/temperature2-icon.png"
                        active: valueSource.overheatWater
                        color : "red"

                        anchors.margins : topRow.height/7
                        width : topRow.width/5 - anchors.margins
                        height: width

                    }
                    SignalLight {
                        id : brakepads
                        anchors.right : temperature.left
                        anchors.verticalCenter : bottomMiddleRow.verticalCenter
                        source : "qrc:/images/brakepad-icon.png"
                        active: valueSource.brakepads
                        blink : true
                        color : "orange"

                        anchors.margins : topRow.height/7
                        width : topRow.width/5 - anchors.margins
                        height: width
                    }
                }
            }

            Rectangle {
                id : bottomRow
                border.color: "black"
                border.width: 3
                color : "transparent"
                anchors {
                    top : middleRow.bottom
                    right : signals.right
                    topMargin: signals.height/15
                    bottomMargin: signals.height/30
                    rightMargin: signals.height/30
                }
                height: signals.height/5
                width : signals.width
                radius: signals.height/10

                SignalLight {
                    id : battery
                    anchors.right : bottomRow.right
                    anchors.verticalCenter : bottomRow.verticalCenter
                    source : "qrc:/images/low-battery-icon.png"
                    active: valueSource.battteryAlarm
                    color : "red"

                    anchors.margins : topRow.height/7
                    width : topRow.width/5 - anchors.margins
                    height: width
                }
                SignalLight {
                    id : brakeAlert
                    anchors.right : battery.left
                    anchors.verticalCenter : bottomRow.verticalCenter
                    source : "qrc:/images/brake-alert-icon.png"
                    active: valueSource.brakeAlarm
                    color : "red"

                    anchors.margins : topRow.height/7
                    width : topRow.width/5 - anchors.margins
                    height: width
                }
                SignalLight {
                    id : oilPressure
                    anchors.right : brakeAlert.left
                    anchors.verticalCenter : bottomRow.verticalCenter

                    anchors.margins : topRow.height/7
                    width : topRow.width/5 - anchors.margins
                    source : "qrc:/images/oilpressure-icon.png"
                    active: valueSource.oilPressure
                    color : "red"
                    height: width
                }


                Renault4LFuelGauge {

                    id: fuelGauge
                    value: valueSource.fuel

                    anchors.right : oilPressure.left
                    anchors.verticalCenter : bottomRow.verticalCenter

                    anchors.margins : topRow.height/7
                    width : height*2
                    height: topRow.width/5 -( anchors.margins*2)
                }



            }
        }
    }
}
