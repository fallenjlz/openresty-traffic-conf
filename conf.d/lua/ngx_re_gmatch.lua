local s = "hello"
local re_gmatch = ngx.re.gmatch
                    
for i = 1,100000,1 do
    local iterator, err = re_gmatch(s, "lo", "jo")
    local it, err = iterator()
    if not it then return end
         ngx.say(it[0] .. i)
    end 