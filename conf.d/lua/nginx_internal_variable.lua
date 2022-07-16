local x = tonumber(ngx.var.args_x) or 0 
ngx.log(ngx.INFO,"x:", x)
ngx.log(ngx.ERR,"x:", x)
local y = tonumber(ngx.var.args_y) or 0 
ngx.log(ngx.INFO,"y:",y)
ngx.log(ngx.ERR,"y:",y)
ngx.say("sum: ",x+y)