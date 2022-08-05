local method = ngx.req.get_method()

if method ~= "PUT" then ngx.exit(ngx.HTTP_NOT_ALLOWED) end
