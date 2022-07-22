local shared_dict = ngx.shared.healthcheck
local cjson = require "cjson"

ngx.req.read_body()
-- local arg = ngx.req.get_post_args()
local data = ngx.req.get_body_data()
local arg
if data ~= nil then
    arg = cjson.decode(data)
else 
    arg = ngx.req.get_uri_args()
end


--通过post请求体设置
shared_dict:set("host",arg["host"])
shared_dict:set("port",arg["port"])

ngx.say("set successful")

-- 通过查询参数设置
-- shared_dict:set("host",ngx.var.arg_host)
-- shared_dict:set("port",ngx.var.arg_port)