import requests

api_key = '3fbb9aab72d14ed9bca184056231110'

city = 'Auburn Hills'

numOfDays = 5
ifAqi = "no"
ifAlerts = "no"

url = f'http://api.weatherapi.com/v1/forecast.json?key={api_key}&q={city}&days={numOfDays}&aqi={ifAqi}&alerts={ifAlerts}'
print("Getting info from...")
print("    ",url)
response = requests.get(url)

if response.status_code == 200:
    data = response.json()
    print(data)