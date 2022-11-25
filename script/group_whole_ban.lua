gapi = require("gocq_api")

if string.match(msg.fromMsg, "开") then
	gapi.http_post("set_group_whole_ban", msg.gid, true)
	return "全员禁言开启成功"
elseif string.match(msg.fromMsg, "关") then
	gapi.http_post("set_group_whole_ban", msg.gid, false)
	return "全员禁言关闭成功"
else
	return "请写出全员禁言开/关"
end
