local x = tonumber(ngx.var.args_x) or 0 
ngx.log(ngx.INFO,"x:" .. x)
local y = tonumber(ngx.var.args_y) or 0 
ngx.log(ngx.INFO,"\ny:" .. y)
ngx.say("sum: ",x+y)