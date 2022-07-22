local ngx = require "ngx"
local redis = require "resty.redis"
local http = require "resty.http"
local httpc = http.new()

local a = ngx.var.arg_a
local b = ngx.var.arg_b
local c = ngx.var.arg_c
local d = ngx.var.arg_d

local getdata = function(key, timeout)
    local red = redis:new()
    red:set_timeout(timeout)
    local ok, err = red:connect("172.20.0.18", 6379)
    if not ok then
        ngx.say("failed to connect: ", err)
        return
    end
    ngx.say("key ",key)

    local data, err = red:get(key)
    local ok, err = red:set_keepalive(10000, 100)
    if err then ngx.say(err) end
    return data
end

local say = function(b)
    ngx.sleep(1)
    return b
end

local captrue_req_http = function()
    local res = ngx.location.capture('/dynamic')
    return res.body
end

local cosocket_req_http = function(timeout)
    local httpc = http.new()
    httpc:set_timeout(timeout)
    local res, err = httpc:request_uri("http://127.0.0.1:81/set", {
        method = "PUT",
        query = "host=127.0.0.1&port=82",
        keepalive_timeout = 60,
        keepalive_pool = 10
    })
    return res.body
end

local threads = {}
local i = 1

if a then
    local a_thread = ngx.thread.spawn(getdata, a, 1000)
    threads[i] = a_thread
    i = i + 1
end

if b then
    local b_thread = ngx.thread.spawn(say, "b")
    threads[i] = b_thread
    i = i + 1
end

if c then
    local c_thread = ngx.thread.spawn(captrue_req_http)
    threads[i] = c_thread
    i = i + 1
end

if d then
    local d_thread = ngx.thread.spawn(cosocket_req_http, 1)
    threads[i] = d_thread
    i = i + 1
end

for i = 1, #threads do
    local ok, res = ngx.thread.wait(threads[i])
    if not ok then
        ngx.say(i, ": failed to run: ", res)
    else
        ngx.say(i, " res: ", res)
    end
end

