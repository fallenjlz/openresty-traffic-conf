local verbose = false
local log = ngx.log
local ERR = ngx.ERR
local phase = ngx.get_phase()

log(ERR,"\nphase: ",phase)

if verbose then
    local dump = require "jit.dump"
    dump.on(nil, "/tmp/jit.log")
else
    local v = require "jit.v"
    v.on("/tmp/jit.log")
end

require "resty.core"
