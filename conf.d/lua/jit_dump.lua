local verbose = false
if verbose then
    local dump = require "jit.dump"
    dump.on(nil, "/tmp/jit.log")
else
    local v = require "jit.v"
    v.on("/tmp/jit.log")
end

require "resty.core"
