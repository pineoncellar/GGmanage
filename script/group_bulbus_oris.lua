gapi = require("gocq_api")

local baner = string.match(msg.fromMsg, "=(%d+)]")
local min = string.match(msg.fromMsg, "(%d+)分") or 0
local hour = string.match(msg.fromMsg, "(%d+)小时") or 0
local date = string.match(msg.fromMsg, "(%d+)天") or 0
local time = min * 60 + hour * 3600 + date * 86400
if getUserConf(getDiceQQ(), "群管指令权限开放", false) or getGroupConf(msg.gid, "群管指令权限开放", false) then
	if not baner then
		return "请艾特对象"
	elseif time ~= 0 then
		return "请写出禁言时长"
	else
		gapi.http_post("set_group_ban", msg.gid, baner, time)
		return "小黑屋收容成功"
	end
elseif msg.grpAuth >= 2 or getUserConf(msg.uid, "trust", 0) >= 4 then
	if not baner then
		return "请艾特对象"
	elseif time ~= 0 then
		return "请写出禁言时长"
	else
		gapi.http_post("set_group_ban", msg.gid, baner, time)
		return "小黑屋收容成功"
	end
else
	return "你没有权限哦"
end
