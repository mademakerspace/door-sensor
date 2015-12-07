wifiSSID='made-bcn.org'
wifiPassword='@MADEBCN@'

print("Setting up WIFI...")
wifi.setmode(wifi.STATION)
wifi.sta.config(wifiSSID,wifiPassword)
wifi.sta.connect()

file.remove("door.lc")
node.compile("door.lua") 
dofile("door.lc")
	






     
