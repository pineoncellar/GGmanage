gapi = require("gocq_api")
json = require("json")

local admin = string.match(msg.fromMsg, "=(%d+)]")
if getUserConf(getDiceQQ(), "群管指令权限开放", false) or getGroupConf(msg.gid, "群管指令权限开放", false) then
	if not admin then
		return "请艾特对象"
	else
		respond = gapi.http_post("set_group_admin", msg.gid, admin, true)
		responds = json.decode(respond)
		if responds["status"] == "ok" then
			return "设置管理成功"
		else
			return responds["wording"]
		end
	end
elseif msg.grpAuth >= 2 or getUserConf(msg.uid, "trust", 0) >= 4 then
	if not admin then
		return "请艾特对象"
	else
		respond = gapi.http_post("set_group_admin", msg.gid, admin, true)
		responds = json.decode(respond)
		if responds["status"] == "ok" then
			return "设置管理成功"
		else
			return responds["wording"]
		end
	end
else
	return "你没有权限哦"
end
