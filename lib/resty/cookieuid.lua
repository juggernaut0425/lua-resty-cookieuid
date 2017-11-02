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

function _M.cookieuid(self, cookie_key)
    local ck = require "resty.cookie"
    local cookie = ck:new()

    if not cookie_key then
        cookie_key = "COOKIEUID"
    end
    local cookieuid, err = cookie:get(cookie_key)
    if cookieuid then
        return cookieuid
    end

    local content_type = ngx.var.content_type
    if not content_type or not string.find(content_type, "text") then
        return "-"
    end

    local uuid = require 'resty.jit-uuid'
    cookieuid = uuid()
    cookie:set({
         key = cookie_key, value = cookieuid
    })
    return cookieuid
end

return setmetatable(_M, {
    __call = _M.cookieuid
})