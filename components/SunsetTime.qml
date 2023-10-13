import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import Qt.labs.qmlmodels 1.0
import QtQuick.Layouts 1.3


Rectangle{
    width: 65
    height: 30
    color: "transparent"

    Image{
        id: sunset
        anchors {
            left: sunsetRect.left
            top: sunsetRect.top   
        }
        source: '../pic/sea-and-sun.svg'
    }
    ColorOverlay{
        anchors.fill: sunset
        source: sunset
        color: "#ffffff"    
    }
    Text {
        anchors {
            right: sunsetRect.right
            top: sunsetRect.top
            rightMargin: 3
        }
        text: currentInfo.time
        font.pixelSize: 15
        color: "white"
    }
}