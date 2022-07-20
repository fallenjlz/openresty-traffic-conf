local shared_dict = ngx.shared.healthcheck
ngx.say(shared_dict:get("host"))
ngx.say(shared_dict:get("port"))