gapi = require("gocq_api")
json = require("json")

if getUserConf(getDiceQQ(), "群管指令权限开放", false) or getGroupConf(msg.gid, "群管指令权限开放", false) then
	if string.match(msg.fromMsg, "开") then
		respond = gapi.http_post("set_group_whole_ban", msg.gid, true)
		responds = json.decode(respond)
		if responds["status"] == "ok" then
			return "全员禁言开启成功"
		else
			return responds["wording"]
		end

	elseif string.match(msg.fromMsg, "关") then
		respond = gapi.http_post("set_group_whole_ban", msg.gid, false)
		responds = json.decode(respond)
		if responds["status"] == "ok" then
			return "全员禁言关闭成功"
		else
			return responds["wording"]
		end
	else
		return "请写出全员禁言开/关"
	end


elseif msg.grpAuth >= 2 or getUserConf(msg.uid, "trust", 0) >= 4 then
	if string.match(msg.fromMsg, "开") then
		respond = gapi.http_post("set_group_whole_ban", msg.gid, true)
		responds = json.decode(respond)
		if responds["status"] == "ok" then
			return "全员禁言开启成功"
		else
			return responds["wording"]
		end

	elseif string.match(msg.fromMsg, "关") then
		respond = gapi.http_post("set_group_whole_ban", msg.gid, false)
		responds = json.decode(respond)
		if responds["status"] == "ok" then
			return "全员禁言关闭成功"
		else
			return responds["wording"]
		end
	else
		return "请写出全员禁言开/关"
	end
else
	return "你没有权限哦"
end
