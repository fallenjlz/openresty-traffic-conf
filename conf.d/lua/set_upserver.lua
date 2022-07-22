local shared_dict = ngx.shared.healthcheck
local cjson = require "cjson"

ngx.req.read_body()
-- local arg = ngx.req.get_post_args()
local data = ngx.req.get_body_data()
arg = cjson.decode(data)

--通过post请求体设置
shared_dict:set("host",arg["host"])
shared_dict:set("port",arg["port"])

return "set successful"

-- 通过查询参数设置
-- shared_dict:set("host",ngx.var.arg_host)
-- shared_dict:set("port",ngx.var.arg_port)