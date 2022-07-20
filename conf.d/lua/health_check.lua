local hc = require "resty.upstream.healthcheck"
local log = ngx.log
local ERR = ngx.ERR

local ok, err = hc.spawn_checker {
    shm = "healthcheck",
    upstream = "upsrv",
    type = "http",
    http_req = "GET /health HTTP/1.0\r\nHost:health.test.io\r\n\r\n",
    interval = 3000,
    timeout = 1000,
    fall = 3,
    rise = 2,
    valid_statuses = {200,302},
    concurrency = 1
}

if err == nil then
    log(ERR, "success spawn health checker: ")
    return
end

local ok, err = hc.spawn_checker {
    shm = "healthcheck",
    upstream = "upsrv1",
    type = "http",
    http_req = "GET /health HTTP/1.0\r\nHost:health.test.io\r\n\r\n",
    interval = 3000,
    timeout = 1000,
    fall = 3,
    rise = 2,
    valid_statuses = {200,302},
    concurrency = 1
}



if err == nil then
    log(ERR, "success spawn health checker: ")
    return
end
