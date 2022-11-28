if getUserConf(getDiceQQ(), "群管指令权限开放", false) or getGroupConf(msg.gid, "群管指令权限开放", false) then
    if string.match(msg.fromMsg, "关") then
        setGroupConf(msg.gid, "自动审批入群申请", false)
        return "{自动审批入群申请关}"
    elseif string.match(msg.fromMsg, "开") then
        setGroupConf(msg.gid, "自动审批入群申请", true)
        return "{自动审批入群申请开}"
    else
        return "请写出自动审批入群申请开/关"
    end
elseif msg.grpAuth >= 2 or getUserConf(msg.uid, "trust", 0) >= 4 then
    if string.match(msg.fromMsg, "关") then
        setGroupConf(msg.gid, "自动审批入群申请", false)
        return "{自动审批入群申请关}"
    elseif string.match(msg.fromMsg, "开") then
        setGroupConf(msg.gid, "自动审批入群申请", true)
        return "{自动审批入群申请开}"
    else
        return "请写出自动审批入群申请开/关"
    end
else
    return "{没有权限}"
end
