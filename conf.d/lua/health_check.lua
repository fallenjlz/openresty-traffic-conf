local hc = require "resty.upstream.healthcheck"
local log = ngx.log
local ERR = ngx.ERR

local ok,err = hc.spawn_checker {
    upstream = "upsrv",
    type = "http",
    http_req = "GET /status HTTP/1.0\r\nHost:srv2.test.io\r\n\r\n",
    interval = 3000,
    timeout = 1000,
    fall = 3,
    rise = 2,
    valid_statses = {2000,302},
    concurrency = 10
}

if not ok then
    log(ERR,"faild to spawn health checker: ",error)
    return
end
