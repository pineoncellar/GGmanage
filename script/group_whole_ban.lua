gapi = require("gocq_api")

if getUserConf(getDiceQQ(), "群管指令权限开放", false) or getGroupConf(msg.gid, "群管指令权限开放", false) then
	if string.match(msg.fromMsg, "开") then
		gapi.http_post("set_group_whole_ban", msg.gid, true)
		return "全员禁言开启成功"
	elseif string.match(msg.fromMsg, "关") then
		gapi.http_post("set_group_whole_ban", msg.gid, false)
		return "全员禁言关闭成功"
	else
		return "请写出全员禁言开/关"
	end
elseif msg.grpAuth >= 2 or getUserConf(msg.uid, "trust", 0) >= 4 then
	if string.match(msg.fromMsg, "开") then
		gapi.http_post("set_group_whole_ban", msg.gid, true)
		return "全员禁言开启成功"
	elseif string.match(msg.fromMsg, "关") then
		gapi.http_post("set_group_whole_ban", msg.gid, false)
		return "全员禁言关闭成功"
	else
		return "请写出全员禁言开/关"
	end
else
	return "你没有权限哦"
end
