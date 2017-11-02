package = "lua-resty-cookieuid"
version = "0.1.0-1"
source = {
   url = "git@radevio.com:lishuangtai/lua-resty-cookieuid.git"
}
description = {
   summary = "在每个请求的Cookie中加入唯一的UUID，有的话则忽略"
}
dependencies = {
   "lua >= 5.1",
   "lua-resty-cookie 0.1.0-1",
   "lua-resty-jit-uuid 0.0.6-1"
}
build = {
   type = "builtin",
   modules = {    
   	["resty.cookieuid"] = "lib/resty/cookieuid.lua"
	}
}
