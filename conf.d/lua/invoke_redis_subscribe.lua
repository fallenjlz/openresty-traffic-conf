local redis = require "redis"
local red = redis:new({timeout = 1000})
local func = red:subscribe("test")
if not func then return nil end

while true do
    local res, err = func()
    if not res or err then func(false) end
    ngx.say(res)
end

