gapi = require("gocq_api")

local kicker = string.match(msg.fromMsg, "=(%d+)]")
if not kicker then
	return "请艾特对象"
elseif string.match(msg.fromMsg, "不允许再入群") then
	gapi.http_post("set_group_kick", msg.gid, kicker, true)
	return "成功踢出并设置不再接受此人入群申请"
else
	gapi.http_post("set_group_kick", msg.gid, kicker)
	return "成功踢出"
end
