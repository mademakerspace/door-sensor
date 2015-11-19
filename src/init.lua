wifi.setmode(wifi.STATION)
wifi.sta.config('Your WiFi network name','Your Wifi password')
file.remove("door.lc")
node.compile("door.lua") 
dofile("door.lc")
     
