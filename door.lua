gpio.mode(4, gpio.INPUT, gpio.PULLUP)
srv=net.createServer(net.TCP) 
door='null'
srv:listen(80,function(conn) conn:on("receive",function(conn,payload)
if gpio.read(4)==gpio.LOW then
     door ="OPEN"  
else 
     door="CLOSED" 
end
conn:send("Made is " .. door ..".")
end)
conn:on("sent",function(conn) conn:close() end)
end)
