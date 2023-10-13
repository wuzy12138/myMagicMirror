import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import Qt.labs.qmlmodels 1.0
import QtQuick.Layouts 1.3
Rectangle {
    color: "transparent"

    Text {
        anchors {
            top: parent.top
            topMargin: 12
            left: parent.left
            leftMargin: 12
        }
        text: currTime
        font.pixelSize: 48
        color: "white"
    }

}