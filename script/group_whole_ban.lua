gapi = require("gocq_api")
json = require("json")

if getUserConf(getDiceQQ(), "群管指令权限开放", false) or getGroupConf(msg.gid, "群管指令权限开放", false) then
	if string.match(msg.fromMsg, "开") then
		stat, respond = gapi.http_post("set_group_whole_ban", msg.gid, true)
		responds = json.decode(respond)
		if stat then
			return "{全员禁言开}"
		else
			return responds["wording"]
		end

	elseif string.match(msg.fromMsg, "关") then
		stat, respond = gapi.http_post("set_group_whole_ban", msg.gid, false)
		responds = json.decode(respond)
		if stat then
			return "{全员禁言关}"
		else
			return responds["wording"]
		end
	else
		return "请写出全员禁言开/关"
	end


elseif msg.grpAuth >= 2 or getUserConf(msg.uid, "trust", 0) >= 4 then
	if string.match(msg.fromMsg, "开") then
		stat, respond = gapi.http_post("set_group_whole_ban", msg.gid, true)
		responds = json.decode(respond)
		if stat then
			return "{全员禁言开}"
		else
			return responds["wording"]
		end

	elseif string.match(msg.fromMsg, "关") then
		stat, respond = gapi.http_post("set_group_whole_ban", msg.gid, false)
		responds = json.decode(respond)
		if stat then
			return "{全员禁言关}"
		else
			return responds["wording"]
		end
	else
		return "请写出全员禁言开/关"
	end
else
	return "{没有权限}"
end
