package = "lua-resty-cookieuid"
version = "0.1.0-1"
source = {
   url = "git@github.com:juggernaut0425/lua-resty-cookieuid.git"
}
description = {
   summary = "add UID if not exists"
}
dependencies = {
   "lua >= 5.1",
   "lua-resty-cookie >= 0.1.0-1",
   "lua-resty-jit-uuid >= 0.0.6-1"
}
build = {
   type = "builtin",
   modules = {
       ["resty.cookieuid"] = "lib/resty/cookieuid.lua"
   }
}
