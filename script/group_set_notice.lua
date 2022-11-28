gapi = require("gocq_api")
json = require("json")

content = string.sub(msg.fromMsg, #"发送公告")
image = string.match(msg.fromMsg, "url=(.*)]")

if getUserConf(getDiceQQ(), "群管指令权限开放", false) or getGroupConf(msg.gid, "群管指令权限开放", false) then
    if not content then
        stat, respond = gapi.http_post("_send_group_notice", content, image)
        responds = json.decode(respond)
        if stat then
            return "{发送公告}"
        else
            return responds["wording"]
        end
    end


elseif msg.grpAuth >= 2 or getUserConf(msg.uid, "trust", 0) >= 4 then
    if not content then
        stat, respond = gapi.http_post("_send_group_notice", content, image)
        responds = json.decode(respond)
        if stat then
            return "{发送公告}"
        else
            return responds["wording"]
        end
    end
end
