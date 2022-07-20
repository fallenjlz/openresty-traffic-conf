local balancer = require "ngx.balancer"

local host = "127.0.0.1"
local port = 82
local log = ngx.log
local ERR = ngx.ERR

local ok,err = balancer.set_current_peer(host,port)
if not ok then
    log(ERR, "failed to set the current peer", err)
    return ngx.exit(500)
end