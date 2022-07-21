local method = ngx.req.get_method()

if method ~= "PUT" then
    ngx.exit(405)
end
