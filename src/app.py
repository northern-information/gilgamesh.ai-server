from flask import Flask
from os import environ
import requests

app = Flask(__name__)

API_KEY = environ['API_KEY']

@app.route('/')
def index():
    return 'App Works!'

@app.route('/<string:city>/<string:country>/')
def weather_by_city(country, city):

    url = 'https://samples.openweathermap.org/data/2.5/weather'
    params = dict(
        q=city + "," + country,
        appid= API_KEY,
    )

    response = requests.get(url=url, params=params)
    data = response.json()
    return data

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000)
