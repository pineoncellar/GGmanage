gapi = require("gocq_api")
json = require("json")

local kicker = string.match(msg.fromMsg, "=(%d+)]")

if getUserConf(getDiceQQ(), "群管指令权限开放", false) or getGroupConf(msg.gid, "群管指令权限开放", false) then
	if not kicker then
		return "{禁言/设置头衔/设置群名片等没有艾特对象}"
	elseif string.match(msg.fromMsg, "不允许再入群") then
		stat, respond = gapi.http_post("set_group_kick", msg.gid, kicker, true)
		responds = json.decode(respond)
		if stat then
			return "{踢出且不再接受此人入群申请}"
		else
			return responds["wording"]
		end
	else
		stat, respond = gapi.http_post("set_group_kick", msg.gid, kicker)
		responds = json.decode(respond)
		if stat then
			return "{踢出}"
		else
			return responds["wording"]
		end
	end


elseif msg.grpAuth >= 2 or getUserConf(msg.uid, "trust", 0) >= 4 then
	if not kicker then
		return "{禁言/设置头衔/设置群名片等没有艾特对象}"
	elseif string.match(msg.fromMsg, "不允许再入群") then
		stat, respond = gapi.http_post("set_group_kick", msg.gid, kicker, true)
		responds = json.decode(respond)
		if stat then
			return "{踢出且不再接受此人入群申请}"
		else
			return responds["wording"]
		end
	else
		stat, respond = gapi.http_post("set_group_kick", msg.gid, kicker)
		responds = json.decode(respond)
		if stat then
			return "{踢出}"
		else
			return responds["wording"]
		end
	end
else
	return "{没有权限}"
end
