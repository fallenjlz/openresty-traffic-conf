local _M = {}

local function get_name()
    return "Lucy"
end

function _M.greeting()
    return "hello " .. get_name()
end

return _M