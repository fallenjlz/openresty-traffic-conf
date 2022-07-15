local file = io.open("conf/conf.d/lua/test.txt", "r")

if file == nil then ngx.say(os.execute('pwd')) end

for line in file:lines() do ngx.say(line) end

