local log = ngx.log
local ERR = ngx.ERR
ngx.req.read_body()
local args, err = ngx.req.get_uri_args()

local http = require "resty.http" 
local httpc = http.new()
local res,err = httpc:request_uri( "http://127.0.0.1:82/spe_md5",
                                          {method = "POST", body = args.data})

if 200 ~= res.status then ngx.exit(res.status) end
log(ERR,"args key: ", args.key .. "\n", "res.body: ",res.body .. "\n")
if args.key == res.body then
    ngx.say("valid request")
else
    ngx.say("invalid request")
end
