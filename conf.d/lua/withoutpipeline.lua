local redis = require "resty.redis"
local red = redis:new()

red:set_timeout(1000) -- 1 sec

-- or connect to a unix domain socket file listened
-- by a redis server:
--     local ok, err = red:connect("unix:/path/to/redis.sock")

local ok, err = red:connect("172.20.0.18", 6379)
if not ok then
    ngx.say("failed to connect: ", err)
    return
end

local ok, err = red:set("cat", "Marry")
ngx.say("set result: ", ok)

local res, err = red:get("cat")
ngx.say("cat: ", res)


ok, err = red:set("horse", "Bob")
ngx.say("set result: ", ok)
res, err = red:get("horse")
ngx.say("horse: ", res)

-- put it into the connection pool of size 100,
-- with 10 seconds max idle time
local ok, err = red:set_keepalive(10000, 100)
if not ok then
    ngx.say("failed to set keepalive: ", err)
    return
end

