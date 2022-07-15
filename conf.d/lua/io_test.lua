local file = io.open("conf/conf.d/lua/test.txt", "r")

if file == nil then
    local path = os.execute('pwd')
    ngx.say("hello" .. path)
    return
end

for line in file:lines() do ngx.say(line) end

