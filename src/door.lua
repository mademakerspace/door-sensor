thingspeakAPIkey='SXKXJPI02VMMMRTS'
pin = 4
wifiSSID='made-bcn.org'
wifiPassword='@MADEBCN@'

gpio.mode(pin, gpio.INPUT, gpio.PULLUP)
currentStatus='OPEN'
currentValue=1


function getStatus()
	if gpio.read(4)==1 then
		currentStatus='OPEN'
		currentValue=1
	else
		currentStatus='CLOSED'
		currentValue=0
   end
end

function sendData()
getStatus()
print(currentStatus)
conn=net.createConnection(net.TCP, 0) 
conn:on("receive", function(conn, payload)  end)
conn:connect(80,'184.106.153.149') 
conn:send("GET /update?key="..thingspeakAPIkey.."&field1="..currentValue.." HTTP/1.1\r\n") 
conn:send("Host: api.thingspeak.com\r\n") 
conn:send("Accept: */*\r\n") 
conn:send("User-Agent: Mozilla/4.0 (compatible; esp8266 Lua; Windows NT 5.1)\r\n")
conn:send("\r\n")
conn:on("sent",function(conn)
                      
                      conn:close()
                  end)
conn:on("disconnection", function(conn)
                                
  end)
end

function connectTowifi()
	if wifi.sta.getip()== nil then
	wifi.sta.config(wifiSSID,wifiPassword)
	wifi.sta.connect()
		print("IP unavaiable, Waiting...")
	else
		print("Currently connected: IP is "..wifi.sta.getip())
		sendData()
	end
end

tmr.alarm(0, 120000, 1, connectTowifi)
