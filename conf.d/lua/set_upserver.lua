local shared_dict = ngx.shared.healthcheck

ngx.req.read_body()
local arg = ngx.req.get_post_args()

--通过post请求体设置
shared_dict:set("host",arg["host"])
shared_dict:set("port",arg["port"])


-- 通过查询参数设置
-- shared_dict:set("host",ngx.var.arg_host)
-- shared_dict:set("port",ngx.var.arg_port)