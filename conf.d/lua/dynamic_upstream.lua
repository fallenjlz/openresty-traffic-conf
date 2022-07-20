local balancer = require "ngx.balancer"
local share_dict = ngx.shared.health_check

local host = share_dict:get("host")
local port = share_dict:get("port")
local log = ngx.log
local ERR = ngx.ERR

log(ERR, "\nhost: ",host,"\nport: ",port)

local ok,err = balancer.set_current_peer(host,port)
if not ok then
    log(ERR, "failed to set the current peer", err)
    return ngx.exit(500)
end