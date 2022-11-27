gapi = require("gocq_api")
json = require("json")

local baner = string.match(msg.fromMsg, "=(%d+)]")

if getUserConf(getDiceQQ(), "群管指令权限开放", false) or getGroupConf(msg.gid, "群管指令权限开放", false) then
    if not baner then
        return "请艾特对象"
    else
        respond = gapi.http_post("set_group_ban", msg.gid, baner, 0)
        responds = json.decode(respond)
        if responds["status"] == "ok" then
            return "{解除禁言}"
        else
            return responds["wording"]
        end
    end


elseif msg.grpAuth >= 2 or getUserConf(msg.uid, "trust", 0) >= 4 then
    if not baner then
        return "请艾特对象"
    else
        respond = gapi.http_post("set_group_ban", msg.gid, baner, 0)
        responds = json.decode(respond)
        if responds["status"] == "ok" then
            return "{解除禁言}"
        else
            return responds["wording"]
        end
    end
else
    return "你没有权限哦"
end
