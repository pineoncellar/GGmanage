gapi = require("gocq_api")
json = require("json")

local baner = string.match(msg.fromMsg, "=(%d+)]")
local min = string.match(msg.fromMsg, "(%d+)分")
if not min then
	min = 0
end
local hour = string.match(msg.fromMsg, "(%d+)小时")
if not hour then
	hour = 0
end
local date = string.match(msg.fromMsg, "(%d+)天")
if not date then
	date = 0
end
local time = min * 60 + hour * 3600 + date * 86400


if getUserConf(getDiceQQ(), "群管指令权限开放", false) or getGroupConf(msg.gid, "群管指令权限开放", false) then
	if not baner then
		return "{禁言/设置头衔/设置群名片等没有艾特对象}"
	elseif time == 0 then
		return "请写出禁言时长"
	else
		stat, respond = gapi.http_post("set_group_ban", msg.gid, baner, time)
		responds = json.decode(respond)
		if stat then
			return "{禁言成功}"
		else
			return responds["wording"]
		end
	end


elseif msg.grpAuth >= 2 or getUserConf(msg.uid, "trust", 0) >= 4 then
	if not baner then
		return "{禁言/设置头衔/设置群名片等没有艾特对象}"
	elseif time == 0 then
		return "请写出禁言时长"
	else
		stat, respond = gapi.http_post("set_group_ban", msg.gid, baner, time)
		responds = json.decode(respond)
		if stat then
			return "{禁言成功}"
		else
			return responds["wording"]
		end
	end
else
	return "{没有权限}"
end
