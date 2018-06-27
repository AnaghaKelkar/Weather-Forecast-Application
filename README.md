WeatherForecast Application
----------------------------

Features:

1. Enter location or address in text field and select number of days for which weather forecast you want to check.
2. Once you enter information, click search button.
3. Search displays information either in graphical or tabular form for selected number of days.
  - Graphical information compares high temperature and low temperature for selected number of days using bar graph and line chart.
  - While, tabular information displays information about Low Temperature, High Temperature, Humidity, Pressure, Wind Speed and summary       for that day.

Implementation:

1. Geocoder:
  - Geocoder gem is used to get latitude and longitude of a given address/location.
  - Geocoder.coordinates(address) returns array of latitude and longitude.
2. Dark sky API:
  - Once we get coordinates based on location, we can call dark sky api to get information about weather for selected number of days.
3. Google charts:
  - For graphical representation, I have used google charts to display Bar graph and Line chart.

