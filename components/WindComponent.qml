import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import Qt.labs.qmlmodels 1.0
import QtQuick.Layouts 1.3

Rectangle{
    
    x: 600
    y: 24
    width: 65
    height: 30
    color: "transparent"  

    Image{
        id: wind
        anchors {
            left: windRect.left
            top: windRect.top   
        }
        source: '../pic/wind.svg'
    }
    ColorOverlay{
        anchors.fill: wind
        source: wind
        color: "#ffffff"    
    }

    Text {
        anchors {
            right: windRect.right
            top: windRect.top
            rightMargin: 3
        }
        text: currentInfo.windSpeed
        font.pixelSize: 15
        color: "white"
    }
}