local s = "hello"
for i = 1, 100000, 1 do for w in string.gmatch(s, "lo") do ngx.say(w .. i) end end
