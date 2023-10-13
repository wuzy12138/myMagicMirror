Item {
    anchors.top: currentWeatherRect.bottom
    anchors.left: currentWeatherRect.left
    width: 140
    height: 240

    Rectangle {
        id: rectangle
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        color: "transparent"

        TableView {
            // frameVisible: false
            anchors.fill: parent
            columnSpacing: 1
            rowSpacing: 1
            clip: true

            model: TableModel {
                TableModelColumn { display: "Date" }
                TableModelColumn { display: "Weather" }
                TableModelColumn { display: "HighTemp" }
                TableModelColumn { display: "LowTemp" }

                rows: [
                    {
                        "Date": forcastDate.d0,
                        "Weather": forcastWeather.w0,
                        "HighTemp": forcastHighTemp.h0,
                        "LowTemp": forcastLowTemp.l0,
                    },
                    {
                        "Date": forcastDate.d1,
                        "Weather": forcastWeather.w1,
                        "HighTemp": forcastHighTemp.h1,
                        "LowTemp": forcastLowTemp.l1,
                    },
                    {
                        "Date": forcastDate.d2,
                        "Weather": forcastWeather.w2,
                        "HighTemp": forcastHighTemp.h2,
                        "LowTemp": forcastLowTemp.l2,
                    },
                    {
                        "Date": forcastDate.d3,
                        "Weather": forcastWeather.w3,
                        "HighTemp": forcastHighTemp.h3,
                        "LowTemp": forcastLowTemp.l3,
                    }
                ]
            }

            delegate: Rectangle {
                implicitHeight: 24
                implicitWidth: 35
                border.width: 0
                color: "transparent"

                Text {
                    color: "white"
                    text: display
                    anchors.centerIn: parent
                }
            }
        }
    }
}