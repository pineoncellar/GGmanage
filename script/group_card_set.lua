gapi = require("gocq_api")
json = require("json")

local seter = string.match(msg.fromMsg, "=(%d+)]")
local _, find = string.find(msg.fromMsg, "%d]")
if find then
	local name = string.sub(msg.fromMsg, find + 1, #msg.fromMsg)
	if getUserConf(getDiceQQ(), "群管指令权限开放", false) or getGroupConf(msg.gid, "群管指令权限开放",
		false) then
		if not seter then
			return "{禁言/设置头衔/设置群名片等没有艾特对象}"
		elseif not name then
			return "请写出要改的群名"
		else
			stat, respond = gapi.http_post("set_group_card", msg.gid, seter, name)
			responds = json.decode(respond)
			if stat then
				return "{群名片更改}"
			else
				return responds["wording"]
			end
		end


	elseif msg.grpAuth >= 2 or getUserConf(msg.uid, "trust", 0) >= 4 then
		if not seter then
			return "{禁言/设置头衔/设置群名片等没有艾特对象}"
		elseif not name then
			return "请写出要改的群名"
		else
			stat, respond = gapi.http_post("set_group_card", msg.gid, seter, name)
			responds = json.decode(respond)
			if stat then
				return "{群名片更改}"
			else
				return responds["wording"]
			end
		end
	else
		return "{没有权限}"
	end
else
	return "{禁言/设置头衔/设置群名片等没有艾特对象}"
end
