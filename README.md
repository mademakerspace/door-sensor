# door-sensor
*Adapted from this project: https://github.com/ok1cdj/ESP8266-LUA/tree/master/Thermometer-DS18B20-Thingspeak http://www.instructables.com/id/Low-cost-WIFI-temperature-data-logger-based-on-ESP/*

This project uses an ESP8266-01 & a microswitch- it posts the status of the switch (open or closed) to Thingspeak, a free web service which allows you to monitor and plot your IOT connected sensors. You'll need to make an account, set up a new channel, and take note of your API key. 
The ESP8266 is flashed with the nodeMCU (Lua based) firmware, and the switch is connected between GPIO 2 and ground. The switch is positioned near the front door such that when the door is locked, the switch is closed. This code can be uploaded to the ESP8266 with the ESPlorer tool: http://esp8266.ru/esplorer/

# Usage
Once you have flashed the ESP8266 with nodeMCU firmware and uploaded the two Lua files (init.lua, door.lua), you can check to see if everything is working properly. Log in to Thingspeak, set up the appropriate channel and check if you have new data: https://thingspeak.com/channels



