local answer = string.sub(msg.fromMsg, #"设置加群答案" + 1)
msg.answer = answer

if getUserConf(getDiceQQ(), "群管指令权限开放", false) or getGroupConf(msg.gid, "群管指令权限开放", false) then
    if getGroupConf(msg.gid, "自动审批入群申请", false) then
        setGroupConf(msg.gid, "入群问题答案", answer)
        return "{入群问题答案}"
    else
        return "自动审批入群申请未打开"
    end
elseif msg.grpAuth >= 2 or getUserConf(msg.uid, "trust", 0) >= 4 then
    if getGroupConf(msg.gid, "自动审批入群申请", false) then
        setGroupConf(msg.gid, "入群问题答案", answer)
        return "{入群问题答案}"
    else
        return "自动审批入群申请未打开"
    end
else
    return "{没有权限}"
end
