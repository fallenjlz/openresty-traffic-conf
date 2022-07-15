local file = io.open("test.txt", "r")

if file == nil then return end

for line in file:lines() do ngx.say(line) end

