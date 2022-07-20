local shared_dict = ngx.shared.healthcheck
shared_dict:set("host",ngx.var.arg_host)
shared_dict:set("port",ngx.var.arg_port)