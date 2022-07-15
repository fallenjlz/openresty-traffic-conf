local file = io.open("con/conf.d/lua/my.lua", "r")

if file == nil then return end

for line in file:lines() do ngx.say(line) end

