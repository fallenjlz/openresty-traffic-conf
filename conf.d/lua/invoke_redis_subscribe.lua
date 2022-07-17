local redis = require "redis"
local red = redis:new({timeout = 1000})
local func = red:subscribe("test")
if not func then return nil end

while true do
    func()
    -- if not res then return end
    -- if res == nil or not res or err then func(false) end
    -- ngx.say(res)
end

