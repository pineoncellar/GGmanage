gapi = require("gocq_api")
json = require("json")

local admin = string.match(msg.fromMsg, "=(%d+)]")
if getUserConf(getDiceQQ(), "群管指令权限开放", false) or getGroupConf(msg.gid, "群管指令权限开放", false) then
	if not admin then
		return "{禁言/设置头衔/设置群名片等没有艾特对象}"
	else
		stat, respond = gapi.http_post("set_group_admin", msg.gid, admin, false)
		responds = json.decode(respond)
		if stat then
			return "{取消管理}"
		else
			return responds["wording"]
		end
	end
elseif msg.grpAuth >= 2 or getUserConf(msg.uid, "trust", 0) >= 4 then
	if not admin then
		return "{禁言/设置头衔/设置群名片等没有艾特对象}"
	else
		stat, respond = gapi.http_post("set_group_admin", msg.gid, admin, false)
		responds = json.decode(respond)
		if stat then
			return "{取消管理}"
		else
			return responds["wording"]
		end
	end
else
	return "{没有权限}"
end
