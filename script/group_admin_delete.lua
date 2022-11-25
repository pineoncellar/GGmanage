gapi = require("gocq_api")

local admin = string.match(msg.fromMsg, "=(%d+)]")
if not admin then
	return "请艾特对象"
else
	gapi.http_post("set_group_admin", msg.gid, admin, false)
	return "取消管理成功"
end
