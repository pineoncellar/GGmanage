gapi = require("gocq_api")

local name = string.match(msg.fromMsg, "(.*)", #"设置群名" + 1)
if not name then
    return "请写出新群名"
else
    gapi.http_post("set_group_name", msg.gid, name)
end
