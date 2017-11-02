local _M = {
    _VERSION = '0.1.0-1'
}

function _M.cookieuid()
    local ck = require "resty.cookie"
    local cookie = ck:new()
    local cookieuid, err = cookie:get("COOKIEUID")
    if not cookieuid then
        local uuid = require 'resty.jit-uuid'
        cookie:set({
             key = "COOKIEUID", value = uuid()
        })
    end
    return cookieuid
end

