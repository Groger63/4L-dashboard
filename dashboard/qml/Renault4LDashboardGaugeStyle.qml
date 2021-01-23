    /****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.2
import QtQuick.Controls.Styles 1.4

CircularGaugeStyle {
    id : root
    tickmarkInset:  outerRadius * 0.3

    property real totalKilometers: 0
    property real tempKilometers: 0
//    tickmarkCount: 10
    tickmark: Loader {

        sourceComponent: styleData.value === 0 ? tata : styleData.value % 20 == 0 ? toto : titi

        Component {
            id : titi
            Rectangle {
                y : -tickmarkInset
                antialiasing: true
                width : 5
                height : tickmarkInset + 5
            }
        }        Component {
            id : toto
            Rectangle {
                antialiasing: true
                width : 10
                height : 45
                color : "#dbb33b"
            }
        }
        Component {
            id : tata
            Item {

                y : 40
                x : -milieu.width/2
                Rectangle {
                    id : gauche
                    rotation : -6
                    anchors.right : milieu.left
                    anchors.bottomMargin: -milieu.height
                    anchors.bottom : milieu.top
                    antialiasing: true
                    width : 4
                    height : 40
                    color : "#dbb33b"
                }
                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter
                    id : milieu
                    antialiasing: true
                    width : 50
                    height : 4
                    color : "#dbb33b"
                }
                Rectangle {
                    id : droite
                    rotation : 8
                    anchors.left : milieu.right
                    anchors.bottomMargin: -milieu.height
                    anchors.bottom : milieu.top
                    antialiasing: true
                    width : 5
                    height : 40
                    color : "#dbb33b"
                }
            }
        }
    }

    minimumValueAngle : -160
    maximumValueAngle : 160
    minorTickmark: Rectangle {
        visible : false
    }

    tickmarkLabel:  Text {
        font.pixelSize: outerRadius * 0.14
        font.bold: false
        font.weight: Font.DemiBold
        font.kerning : false
        scale : 1.1
        font.family: "Noto sans"
        text: styleData.value
        color: "#e5e5e5"
        antialiasing: true
    }

    minorTickmarkInset: 0
    labelStepSize: 20
    labelInset: outerRadius*0.15
//        0// toPixels(0.23)

    property real width
    property real height
    property real xCenter: outerRadius
    property real yCenter: outerRadius
    property real needleLength: outerRadius - tickmarkInset * 1.25
    property real needleTipWidth: toPixels(0.02)
    property real needleBaseWidth: toPixels(0.06)
    property bool halfGauge: false

    function toPixels(percentage) {
        return percentage * outerRadius;
    }

    function degToRad(degrees) {
        return degrees * (Math.PI / 180);
    }

    function radToDeg(radians) {
        return radians * (180 / Math.PI);
    }

    function paintBackground(ctx) {
        if (halfGauge) {
            ctx.beginPath();
            ctx.rect(0, 0, ctx.canvas.width, ctx.canvas.height / 2);
            ctx.clip();
        }

        root.width = ctx.canvas.width
        root.height = ctx.canvas.height

        ctx.beginPath();
        ctx.fillStyle = "black";
        ctx.ellipse(0, 0, ctx.canvas.width, ctx.canvas.height);
        ctx.fill();

//        ctx.beginPath();
//        ctx.lineWidth = tickmarkInset;
//        ctx.strokeStyle = "black";
//        ctx.arc(xCenter, yCenter, outerRadius - ctx.lineWidth / 2, outerRadius - ctx.lineWidth / 2, 0, Math.PI * 2);
//        ctx.stroke();

//        ctx.beginPath();
//        ctx.lineWidth = tickmarkInset / 2;
//        ctx.strokeStyle = "black";
//        ctx.arc(xCenter, yCenter, outerRadius - ctx.lineWidth / 2, outerRadius - ctx.lineWidth / 2, 0, Math.PI * 2);
//        ctx.stroke();

        ctx.beginPath();
        var gradient = ctx.createRadialGradient(xCenter, yCenter, 0, xCenter, yCenter, outerRadius);
        gradient.addColorStop(0, Qt.rgba(1, 1, 1, 0.3));
//        gradient.addColorStop(0.999, Qt.rgba(1, 1, 1, 0.13));
        gradient.addColorStop(1, Qt.rgba(1, 1, 1, 0));
        ctx.fillStyle = gradient;
        ctx.arc(xCenter, yCenter, outerRadius , outerRadius , 0, Math.PI * 2);
        ctx.fill();
    }

    background: Canvas {
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            paintBackground(ctx);
        }

        Spinner {
            id: odometer
            value : totalKilometers
            width : (parent.height/17.5)*6
            height : (parent.height/11.2)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: toPixels(0.17)
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom : odometer.top
            text : "TURBO-4L"
            font.bold: true
            color : "white"
            height: odometer.height * 0.8
            font.pixelSize: height* 0.6
//            width : rowSpinner.width
            verticalAlignment: Text.AlignVCenter
        }
        Rectangle {
            id : bouboule1
            height:outerRadius*0.1
            width : height
            radius : height
            border.color: "#555555"
            color : "black"
            border.width: 3
            anchors.verticalCenter: parent.verticalCenter
            anchors.right : parent.horizontalCenter
            anchors.rightMargin : outerRadius*0.2
        }
        Rectangle {
            id : bouboule2
            height:outerRadius*0.1
            width : height
            radius : height
            border.color: "#555555"
            color : "black"
            border.width: 3
            anchors.verticalCenter: parent.verticalCenter
            anchors.left : parent.horizontalCenter
            anchors.leftMargin : outerRadius*0.2
        }

        SmallSpinner {
            id : smolspinner
            value : tempKilometers
            width : (parent.height/17.5)*6
            height : (parent.height/11.2)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter
            anchors.topMargin: toPixels(0.17)
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom : buttonReset.top
//            anchors.bottomMargin: parent.height * 0.02
            text : "km/h"
            color : "white"
            height: odometer.height * 0.8
            font.pixelSize: height* 0.6
//            width : rowSpinner.width
            verticalAlignment: Text.AlignVCenter
        }
        Rectangle {
            id : buttonReset
            height : parent.height*0.1 - (2*anchors.bottomMargin)
            width : height
            clip : true
            radius : height
            border.color: "black"
            color : "#4d4d4d"
            border.width : 2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom : parent.bottom
            anchors.bottomMargin: parent.height * 0.03
        }


    }
    needle: Item {
        rotation : -90
        Rectangle {
            id : needleFixation
            border.color : "#151515"
            color: "black"
            border.width: 4
            anchors.centerIn: parent
            width: outerRadius*0.2
            height: width
            radius: height
        }
        Rectangle {
            id : needle
            border.color: "black"
            border.width: 2
            antialiasing: true
            anchors.verticalCenter: parent.verticalCenter
            width: outerRadius
            height: width* 0.05
            x : -needleFixation.width * 0.85
            color : "#c9910e"
            Rectangle {
                antialiasing: true
                anchors.fill : parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#FF000000" }
                    GradientStop { position: 0.16; color: "#00000000" }
                    GradientStop { position: 0.84; color: "#00000000" }
                    GradientStop { position: 1.0; color: "#FF000000" }
                }
            }
        }
    }

    foreground: null
}
