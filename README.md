# door-sensor
This project uses an ESP8266-01 & a microswitch- it posts the status of the switch (open or closed) to a webpage.
The ESP8266 is flashed with the nodeMCU (Lua based) firmware, and the switch is connected between GPIO 2 and ground. The switch is positioned near the front door such that when the door is locked, the switch is closed. This code can be uploaded to the ESP8266 with the ESPlorer tool: http://esp8266.ru/esplorer/

# Usage
Once you have flashed the ESP8266 with nodeMCU firmware and uploaded the two Lua files (init.lua, door.lua), you can check to see if everything is working properly. First, find out if the ESP8266 is connected to your WiFi network with the following command: 
```
print(wifi.sta.getip())
```
This will return three numbers: [current IP, netmask, gateway] Copy and paste the first number (192.168.0.xxx) into your favorite browser, and you should see the blue LED on the ESP flash. If everything worked, you should be looking at a simple page that says "Made is currently OPEN" or "Made is currently CLOSED"!
