local hc = require "resty.upstream.healthcheck"
local log = ngx.log
local ERR = ngx.ERR

local ok, err = hc.spawn_checker {
    shm = "healthcheck",
    upstream = "upsrv",
    type = "http",
    http_req = "GET / HTTP/1.0\r\nHost:srv2.test.io\r\n\r\n",
    interval = 3000,
    timeout = 1000,
    fall = 3,
    rise = 2,
    valid_statses = {200, 302},
    concurrency = 10
}


if ok then
    log(ERR, "success spawn health checker: ")
    return
end
