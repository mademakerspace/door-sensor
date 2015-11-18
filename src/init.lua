wifiSSID='made-bcn.org'
wifiPassword='@MADEBCN@'

print("Setting up WIFI...")
wifi.setmode(wifi.STATION)
wifi.sta.config(wifiSSID,wifiPassword)
wifi.sta.connect()
tmr.alarm(1, 1000, 1, function()
if wifi.sta.getip()== nil then
print("IP unavaiable, Waiting...")
else
tmr.stop(1)
print("Config done, IP is "..wifi.sta.getip())
file.remove("door.lc")
node.compile("door.lua") 
dofile("door.lc")
end
end)


     
