local redis = require "redis"
local red = redis:new()

local ok, err = red:set("hello", "world")
if not ok then
    ngx.say("failed to set dog: ", err)
    return
end

ngx.say("set result: ", ok)