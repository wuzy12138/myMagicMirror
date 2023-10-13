import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import Qt.labs.qmlmodels 1.0
import QtQuick.Layouts 1.3
import "components"
// import wind

ApplicationWindow {
    visible: true
    width: 800
    height: 500
    title: "MagicMirror"
    property QtObject backend
    property string currTime: "00:00:00"
    property var currentInfo: {'windSpeed': '0', 'temp': '0', "weather": 'pic/rain.svg', 'time': '0'}
    property var forecastDate: {'d0': "0", 'd1': '0', 'd2': '0', 'd3': '0', 'd4': '0'}
    property var forecastWeather: {'w0': "pic/rain.svg", 'w1': 'pic/rain.svg', 'w2': 'pic/rain.svg', 'w3': 'pic/rain.svg', 'w4': 'pic/rain.svg'}
    property var forecastHighTemp: {'h0': "0", 'h1': '0', 'h2': '0', 'h3': '0', 'h4': '0'}
    property var forecastLowTemp: {'l0': "0", 'l1': '0', 'l2': '0', 'l3': '0', 'l4': '0'}

    Rectangle {
        anchors.fill: parent
        
        Background{
            sourceSize.width: parent.width
            sourceSize.height: parent.height
        }

        TimeBlock{
            anchors.fill: parent
        }

        WindComponent{
            id: windRect
        }

        SunsetTime{
            id: sunsetRect
            anchors.left: windRect.right
            anchors.top: windRect.top
        }

        CurrentWeather{
            id: currentWeatherRect
            anchors.left: windRect.left
            anchors.top: windRect.bottom
        }

        ForecastWeatherList{
            anchors.top: currentWeatherRect.bottom
            anchors.left: currentWeatherRect.left
        }
    }

    Connections{
        target: backend

        function onUpdated(msg) {
            currTime = msg;
        }

        function onCurrentInfo(windSpeed, temp, weather, time){
            currentInfo = {'windSpeed': windSpeed, 'temp': temp, 'weather': weather, 'time': time}
        }

        function onForecastDate(d0, d1, d2, d3, d4){
            forecastDate = {'d0': d0, 'd1': d1, 'd2': d2, 'd3': d3, 'd4': d4}
        }

        function onForecastWeather(w0, w1, w2, w3, w4){
            forecastWeather = {'w0': w0, 'w1': w1, 'w2': w2, 'w3': w3, 'w4': w4}
        }

        function onForecastHighTemp(h0, h1, h2, h3, h4){
            forecastHighTemp = {'h0': h0, 'h1': h1, 'h2': h2, 'h3': h3, 'h4': h4}
        }

        function onForecastLowTemp(l0, l1, l2, l3, l4){
            forecastLowTemp = {'l0': l0, 'l1': l1, 'l2': l2, 'l3': l3, 'l4': l4}
        }
    }

}