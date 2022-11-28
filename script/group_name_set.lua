gapi = require("gocq_api")
json = require("json")

local name = string.match(msg.fromMsg, "(.*)", #"设置群名" + 1)
if getUserConf(getDiceQQ(), "群管指令权限开放", false) or getGroupConf(msg.gid, "群管指令权限开放", false) then
    if not name then
        return "请写出新群名"
    else
        stat, respond = gapi.http_post("set_group_name", msg.gid, name)
        responds = json.decode(respond)
        if stat then
            return "成功将群名设置为：" .. name
        else
            return responds["wording"]
        end
    end


elseif msg.grpAuth >= 2 or getUserConf(msg.uid, "trust", 0) >= 4 then
    if not name then
        return "请写出新群名"
    else
        stat, respond = gapi.http_post("set_group_name", msg.gid, name)
        responds = json.decode(respond)
        if stat then
            return "成功将群名设置为：" .. name
        else
            return responds["wording"]
        end
    end
else
    return "{没有权限}"
end
