pin = 4
gpio.mode(pin, gpio.INPUT, gpio.PULLUP)
currentStatus=''



function getStatus()
	if gpio.read(4)==1 then
		currentStatus='OPEN'
	else
		currentStatus='CLOSED'
   end
end

function sendData()
getStatus()
print("Sending data to thingspeak.com")
conn=net.createConnection(net.TCP, 0) 
conn:on("receive", function(conn, payload) print(payload) end)
conn:connect(80,'184.106.153.149') 
conn:send("GET /update?key=YOURAPIKEY&field1="..currentStatus.." HTTP/1.1\r\n") 
conn:send("Host: api.thingspeak.com\r\n") 
conn:send("Accept: */*\r\n") 
conn:send("User-Agent: Mozilla/4.0 (compatible; esp8266 Lua; Windows NT 5.1)\r\n")
conn:send("\r\n")
conn:on("sent",function(conn)
                      print("Closing connection")
                      conn:close()
                  end)
conn:on("disconnection", function(conn)
                                print("Got disconnection...")
  end)
end

tmr.alarm(0, 10000, 1, sendData)
