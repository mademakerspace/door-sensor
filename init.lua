wifi.setmode(wifi.STATION)
wifi.sta.config('made-bcn.org','@MADEBCN@')
file.remove("door.lc")
node.compile("door.lua") 
dofile("door.lc")
     
