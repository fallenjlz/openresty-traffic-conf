
local shell = require "resty.shell"
local ok,stdout,_,_,_= shell.run("pwd;cd /usr/local/openresty/nginx/conf/conf.d/lua")
local file = io.open("conf/conf.d/lua/test.txt", "r")


if file == nil then
    ngx.say(stdout)
    return
end

for line in file:lines() do ngx.say(line) end

