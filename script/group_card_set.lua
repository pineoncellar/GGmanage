gapi = require("gocq_api")

local seter = string.match(msg.fromMsg, "=(%d+)]")
local find, _ = string.find(msg.fromMsg, "群名")
local name = string.match(msg.fromMsg, "(.*)", find + 1)
if not seter then
	return "请艾特对象"
elseif not name then
	return "请写出要改的群名"
else
	gapi.http_post("set_group_card", msg.gid, seter, name)
	return "群名片更改成功"
end
