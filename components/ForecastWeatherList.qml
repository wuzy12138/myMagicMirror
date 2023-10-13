import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import Qt.labs.qmlmodels 1.0
import QtQuick.Layouts 1.3


ColumnLayout{
    RowLayout{
        Text{
            text: forecastDate.d0
            color: "#ffffff"   
        }
        Image{
            id: rowWeather0
            source: "../" + forecastWeather.w0
            ColorOverlay{
                anchors.fill: rowWeather0
                source: rowWeather0
                color: "#ffffff"    
            }
        }
        
        Text{
            text: forecastHighTemp.h0
            color: "#ffffff"
        }
        Text{
            text: forecastLowTemp.l0
            color: "#ffffff"
        }
    }

    RowLayout{
        Text{
            text: forecastDate.d1
            color: "#ffffff"
        }
        Image{
            id: rowWeather1
            source: "../" + forecastWeather.w1
            ColorOverlay{
                anchors.fill: rowWeather1
                source: rowWeather1
                color: "#ffffff"    
            }
            
        }
        
        Text{
            text: forecastHighTemp.h1
            color: "#ffffff"
        }
        Text{
            text: forecastLowTemp.l1
            color: "#ffffff"
        }
    }


    RowLayout{
        Text{
            text: forecastDate.d2
            color: "#ffffff"
        }
        Image{
            id: rowWeather2
            source: "../" + forecastWeather.w2
            ColorOverlay{
                anchors.fill: rowWeather2
                source: rowWeather2
                color: "#ffffff"    
            }
        }
        
        Text{
            text: forecastHighTemp.h2
            color: "#ffffff"
        }
        Text{
            text: forecastLowTemp.l2
            color: "#ffffff"
        }
    }

    
    RowLayout{
        Text{
            text: forecastDate.d3
            color: "#ffffff"
        }
        Image{
            id: rowWeather3
            source: "../" + forecastWeather.w3
            ColorOverlay{
                anchors.fill: rowWeather3
                source: rowWeather3
                color: "#ffffff"    
            }
        }
        Text{
            text: forecastHighTemp.h3
            color: "#ffffff"
        }
        Text{
            text: forecastLowTemp.l3
            color: "#ffffff"
        }
    }

    RowLayout{
        Text{
            text: forecastDate.d4
            color: "#ffffff"
        }
        Image{
            id: rowWeather4
            source: "../" + forecastWeather.w4
            ColorOverlay{
                anchors.fill: rowWeather4
                source: rowWeather4
                color: "#ffffff"    
            }
        }
        
        Text{
            text: forecastHighTemp.h4
            color: "#ffffff"
        }
        Text{
            text: forecastLowTemp.l4
            color: "#ffffff"
        }
    }

}
