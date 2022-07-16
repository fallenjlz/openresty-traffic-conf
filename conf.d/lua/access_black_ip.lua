local black_ips = {["127.0.0.1"] = true}
local ip = ngx.var.remote_addr
ngx.log(ngx.ERR,"remote_addr",ip)
if true == black_ips[ip] then ngx.exit(ngx.HTTP_FORBIDDEN) end
