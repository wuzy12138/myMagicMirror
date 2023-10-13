import sys
from time import strftime, localtime
# from datetime import datetime

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QTimer, QObject, pyqtSignal
from dataSource import Weather

app = QGuiApplication(sys.argv)

engine = QQmlApplicationEngine()
engine.quit.connect(app.quit)
engine.load('main.qml')


class Backend(QObject):
    updated = pyqtSignal(str, arguments=['time'])
    currentInfo = pyqtSignal(str, str, str, str, arguments=['windSpeed', 'temp', 'time', 'weather'])
    # forecastInfo = pyqtSignal(str, str, str, str, arguments=['time', 'weather', 'lowTemp', 'highTemp'])
    forecastDate = pyqtSignal(str, str, str, str, str, arguments=['d0', 'd1', 'd2', 'd3', 'd4'])
    forecastWeather= pyqtSignal(str, str, str, str, str, arguments=['w0', 'w1', 'w2', 'w3', 'w4'])
    forecastLowTemp= pyqtSignal(str, str, str, str, str, arguments=['l0', 'l1', 'l2', 'l3', 'l4'])
    forecastHighTemp= pyqtSignal(str, str, str, str, str, arguments=['h0', 'h1', 'h2', 'h3', 'h4'])
    def __init__(self):
        super().__init__()
        
        # enable updates in qml
        self.timer = QTimer()
        self.timer.setInterval(100)
        self.timer.timeout.connect(self.update_time)
        self.timer.start() 
        
    def update_time(self):
        curr_time = strftime("%H:%M:%S", localtime())
        self.updated.emit(curr_time)
        
    def update_weather(self):
        numberOfDays = 5

        fWeather = open("weatherData.txt", "r")
        fCode = open("conditionCode.txt", "r")
        weatherData = fWeather.read()
        codeData = fCode.read()

        weather = Weather(numberOfDays)
        weather.processJson(weatherData, codeData)

        current = weather.CD
        forecast = weather.FC
        
        # weatherText = weather.codeToText(current.weather)
        weatherCode = current.weather
        weatherPath = ""
        parentPath = "pic/"
        if weatherCode == 1003:
            weatherPath = parentPath + "cloud.svg"
        elif weatherCode == 1009:
            weatherPath = parentPath + "cloud.svg"
        elif weatherPath == 1063 or weatherPath == 1189:
            weatherPath = parentPath + "rain.svg"
        elif weatherPath == 1195:
            weatherPath = parentPath + "heavy-rain.svg"
        else:
            weatherPath = parentPath + "sun-light.svg"
        print(weatherPath)
        
        windSpeed = "%4dmph" % current.windSpeed
        temperature = "%4d°C" % current.temp
        
        self.currentInfo.emit(windSpeed, temperature, \
            weatherPath, current.time)
        
        timeList = forecast.time
        weatherList = forecast.weather
        highTempList = forecast.highTemp
        lowTempList = forecast.lowTemp
        
        weatherPathes = []
        parentPath = "pic/"
        
        for w in weatherList:
            if w == 1003:
                weatherPath = parentPath + "cloud.svg"
            elif w == 1009:
                weatherPath = parentPath + "cloud.svg"
            elif w == 1063 or weatherPath == 1189:
                weatherPath = parentPath + "rain.svg"
            elif w == 1195:
                weatherPath = parentPath + "heavy-rain.svg"
            else:
                weatherPath = parentPath + "sun-light.svg"
            weatherPathes.append(weatherPath)
            print(weatherPath)
            
        self.forecastDate.emit(timeList[0], timeList[1],\
            timeList[2], timeList[3], timeList[4])
        self.forecastWeather.emit(weatherPathes[0], weatherPathes[1],\
            weatherPathes[2], weatherPathes[3], weatherPathes[4])
        self.forecastHighTemp.emit(str(highTempList[0]), str(highTempList[1]),\
            str(highTempList[2]), str(highTempList[3]), str(highTempList[4]))
        self.forecastLowTemp.emit(str(lowTempList[0]), str(lowTempList[1]),\
            str(lowTempList[2]), str(lowTempList[3]), str(lowTempList[4]))
        print(weatherList)
        print(timeList)
        print(highTempList)
        print(lowTempList)

if __name__ == "__main__":    
    backend = Backend()
    engine.rootObjects()[0].setProperty('backend', backend)
    backend.update_time()
    backend.update_weather()

    sys.exit(app.exec())