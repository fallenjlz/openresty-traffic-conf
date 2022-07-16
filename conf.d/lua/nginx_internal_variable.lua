local log = ngx.log
local ERR = ngx.ERR

local x = tonumber(ngx.var.arg_x) or 0


log(ERR,"x:", x)
local y = tonumber(ngx.var.arg_y) or 0
log(ERR,"y:",y)
ngx.say("sum: ",x+y)


