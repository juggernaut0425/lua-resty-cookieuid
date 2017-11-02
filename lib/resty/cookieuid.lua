local _M = {
    _VERSION = '0.1.0-1'
}

-- init_worker_by_lua {
--   local cookieuid = require 'resty.cookieuid'
--   uuid.seed()
-- }
function _M.seed(seed)
    local uuid = require 'resty.jit-uuid'
    uuid.seed(seed)
end

function _M.cookieuid()
    local ck = require "resty.cookie"
    local cookie = ck:new()
    local cookieuid, err = cookie:get("COOKIEUID")
    if not cookieuid then
        local uuid = require 'resty.jit-uuid'
        cookieuid = uuid()
        cookie:set({
             key = "COOKIEUID", value = cookieuid
        })
    end
    return cookieuid
end

return setmetatable(_M, {
    __call = _M.cookieuid
})