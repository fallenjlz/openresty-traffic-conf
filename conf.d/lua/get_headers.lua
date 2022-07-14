local arg = ngx.req.get_headers()
for k, v in pairs(arg) do ngx.say('headers: ', k, 'Value: ', v) end
