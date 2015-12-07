wifiSSID='your wifi network name'
wifiPassword='your wifi network password'

print("Setting up WIFI...")
wifi.setmode(wifi.STATION)
wifi.sta.config(wifiSSID,wifiPassword)
wifi.sta.connect()

file.remove("door.lc")
node.compile("door.lua") 
dofile("door.lc")
	






     
