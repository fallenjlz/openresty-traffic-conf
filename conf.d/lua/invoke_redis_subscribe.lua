local redis = require "redis"
local red = redis:new({timeout = 1000})
local func = red:subscribe("test")
if not func then return nil end

while true do
    local res, err = func()
    if err then func(false) end
end

return cbfunc