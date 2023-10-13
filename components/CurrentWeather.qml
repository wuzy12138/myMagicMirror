import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import Qt.labs.qmlmodels 1.0
import QtQuick.Layouts 1.3

Rectangle{
    width: 130
    height: 60
    color: "transparent"

    Image{
        id: currentWeather
        anchors {
            left: currentWeatherRect.left
            top: currentWeatherRect.top   
        }
        source: "../" + currentInfo.weather

        ColorOverlay{
            anchors.fill: currentWeather
            source: currentWeather
            color: "#ffffff"    
        }
    }
    
    Text {
        anchors {
            left: currentWeather.right
            top: currentWeather.top
            rightMargin: 3
        }
        text: currentInfo.temp
        font.pixelSize: 30
        color: "white"
    }
}