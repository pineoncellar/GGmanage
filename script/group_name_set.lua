gapi = require("gocq_api")

local name = string.match(msg.fromMsg, "(.*)", #"设置群名" + 1)
if getUserConf(getDiceQQ(), "群管指令权限开放", false) or getGroupConf(msg.gid, "群管指令权限开放", false) then
    if not name then
        return "请写出新群名"
    else
        gapi.http_post("set_group_name", msg.gid, name)
    end
elseif msg.grpAuth >= 2 or getUserConf(msg.uid, "trust", 0) >= 4 then
    if not name then
        return "请写出新群名"
    else
        gapi.http_post("set_group_name", msg.gid, name)
    end
else
    return "你没有权限哦"
end
