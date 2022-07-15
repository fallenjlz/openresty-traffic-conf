
local shell = require "resty.shell"
-- local ok,stdout,_,_,_= shell.run("cd /usr/local/openresty/nginx/conf/conf.d/lua")
-- local _,stdout2 = shell.run("pwd")
local file = io.open("test.txt", "a")
local date = tostring(os.date("now is %x %X"))
file:write(date .. "\n")
if file == nil then
    -- ngx.say(stdout2)
    return
end

for line in file:lines() do ngx.say(line) end
file:close()

