gapi = require("gocq_api")
json = require("json")

msg_id = string.match(msh.fromMsg, "[CQ:reply,id=(%d+)]")

if getUserConf(getDiceQQ(), "群管指令权限开放", false) or getGroupConf(msg.gid, "群管指令权限开放", false) then
    if not msg_id then
        return "请回复需要设置精华的消息"
    else
        respond = gapi.http_post("set_essence_msg", msg_id)
        if responds["status"] == "ok" then
            return "{设置精华}"
        else
            return responds["wording"]
        end
    end


elseif msg.grpAuth >= 2 or getUserConf(msg.uid, "trust", 0) >= 4 then
    if not msg_id then
        return "请回复需要设置精华的消息"
    else
        respond = gapi.http_post("set_essence_msg", msg_id)
        if responds["status"] == "ok" then
            return "{设置精华}"
        else
            return responds["wording"]
        end
    end
end
