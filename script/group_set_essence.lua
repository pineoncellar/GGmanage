gapi = require("gocq_api")
json = require("json")

if string.match(msg.fromMsg, "设置精华") then

    if string.match(msg.fromMsg, "-") then
        msg_id = string.match(msg.fromMsg, "-%d+")
    else
        msg_id, _ = string.match(msg.fromMsg, "id=(%d+)")
    end


    if getUserConf(getDiceQQ(), "群管指令权限开放", false) or getGroupConf(msg.gid, "群管指令权限开放",
        false) then
        if not msg_id then
            return "请回复需要设置精华的消息"
        else
            stat, respond = gapi.http_post("set_essence_msg", msg_id)
            responds = json.decode(respond)
            if stat then
                return "{设置精华}"
            else
                return responds["wording"]
            end
        end


    elseif msg.grpAuth >= 2 or getUserConf(msg.uid, "trust", 0) >= 4 then
        if not msg_id then
            return "请回复需要设置精华的消息"
        else
            stat, respond = gapi.http_post("set_essence_msg", msg_id)
            responds = json.decode(respond)
            if stat then
                return "{设置精华}"
            else
                return responds["wording"]
            end
        end
    end
end
