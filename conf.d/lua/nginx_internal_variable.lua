local x = tonumber(ngx.var.args_x) or 0 
local y = tonumber(ngx.var.args_y) or 0 
ngx.say("sum: ",x+y)