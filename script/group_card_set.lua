gapi = require("gocq_api")
json = require("json")

local seter = string.match(msg.fromMsg, "=(%d+)]")
local find, _ = string.find(msg.fromMsg, "%d]")
local name = string.match(msg.fromMsg, "(.*)", find + 1)
if getUserConf(getDiceQQ(), "群管指令权限开放", false) or getGroupConf(msg.gid, "群管指令权限开放", false) then
	if not seter then
		return "请艾特对象"
	elseif not name then
		return "请写出要改的群名"
	else
		respond = gapi.http_post("set_group_card", msg.gid, seter, name)
		if responds["status"] == "ok" then
			return "群名片更改成功"
		else
			return responds["wording"]
		end
	end


elseif msg.grpAuth >= 2 or getUserConf(msg.uid, "trust", 0) >= 4 then
	if not seter then
		return "请艾特对象"
	elseif not name then
		return "请写出要改的群名"
	else
		respond = gapi.http_post("set_group_card", msg.gid, seter, name)
		if responds["status"] == "ok" then
			return "群名片更改成功"
		else
			return responds["wording"]
		end
	end
else
	return "你没有权限哦"
end
