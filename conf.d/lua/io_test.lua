local file = io.open("my.lua", "r")

for line in file:lines() do ngx.say(line) end
