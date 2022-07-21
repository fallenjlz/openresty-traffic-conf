local method = ngx.req.get_method()

if method ~= "POST" then
    ngx.exit(ngx.HTTP_METHOD_NOT_IMPLEMENTED)
end
