local file = io.open("./my.lua", "r")

if file == nil then return end

for line in file:lines() do ngx.say(line) end

