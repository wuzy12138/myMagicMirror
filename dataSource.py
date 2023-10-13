import json
import time

class Weather:
    def __init__(self, days):
        self.CD = self.CurrentData()
        self.FC = self.ForecastData()
        self.days = days
    
    class CurrentData:
        def __init__(self):
            self.windSpeed = 0
            self.temp = 0
            self.time = 0
            self.weather = 0
            
        def setWindSpeed(self, windspeed):
            self.windSpeed = windspeed
        
        def setTemp(self, temp):
            self.temp = temp
        
        def setTime(self, time):
            self.time = time
            
        def setWeather(self, weather):
            self.weather = weather
            
            
    class ForecastData:
        def __init__(self):
            self.time = 0
            self.weather = 0
            self.lowTemp = 0
            self.highTemp = 0
        
        def setTime(self, time):
            self.time = time
        
        def setWeather(self, weather):
            self.weather = weather
        
        def setLowTemp(self, lowTemp):
            self.lowTemp = lowTemp
            
        def setHighTemp(self, highTemp):
            self.highTemp = highTemp


    def codeToText(codeList, code):
        for d in codeList:
            if code in d.values():
                print(d['day'])
                break

    def processJson(self, weatherData, codeData):
        infoJs = json.loads(weatherData)
        currentInfo = infoJs['current']
        forecastInfo = infoJs['forecast']
        locationInfo = infoJs['location']
        
        conditionCodes = json.loads(codeData)
        
        current = self.CD
        
        current.setTemp(currentInfo['feelslike_c'])
        current.setWindSpeed(currentInfo['wind_mph'])
        current.setTime(time.strftime("%H:%M", time.gmtime(locationInfo['localtime_epoch'])))
        current.setWeather(currentInfo['condition']['code'])

        forecast = self.FC 

        timeList = []
        weatherList = []
        lowTempList = []
        highTempList = []

        daysInfoList = forecastInfo['forecastday']
        day0 = daysInfoList[0]['day']['maxtemp_c']
        for info in daysInfoList:
            lowTempList.append(info['day']['mintemp_c'])
            highTempList.append(info['day']['maxtemp_c'])
            weatherList.append(info['day']['condition']['code'])
            timeList.append(time.strftime("%a", time.gmtime(info['date_epoch'])))
            
        forecast.setHighTemp(highTempList)
        forecast.setLowTemp(lowTempList)
        forecast.setWeather(weatherList)
        forecast.setTime(timeList)


if __name__ == "__main__":
    numberOfDays = 5

    fWeather = open("weatherData.txt", "r")
    weatherData = fWeather.read()

    fCode = open("conditionCode.txt", "r")
    codeData = fCode.read()

    weather = Weather(numberOfDays)
    weather.processJson(weatherData, codeData)

    current = weather.CD
    forecast = weather.FC

    print("WindSpeed: ", current.windSpeed, "mph\t", "Time: ", current.time)
    print("Weather: ", current.weather, "\t\t", "Feels like: ", current.temp, "°C")

    print("\t\t\t", "weather")
    print("-----------------------------------")
    for i in range(weather.days):
        print("%4s\t%4d\t%4.1f°C\t%4.1f°C\t" % (forecast.time[i], forecast.weather[i], forecast.highTemp[i], forecast.lowTemp[i]))
        # print(forecast.time[i], "\t", forecast.weather[i], "\t", forecast.highTemp[i], "°C\t", forecast.lowTemp[i], "°C")





            
            