if not msg.gid and getUserConf(msg.uid, "trust", 0) >= 5 then
    if string.match(msg.fromMsg, "开放") then
        setUserConf(getDiceQQ(), "群管指令权限开放", true)
        return "{开放全局群管指令权限}"
    elseif string.match(msg.fromMsg, "收回") then
        setUserConf(getDiceQQ(), "群管指令权限开放", false)
        return "{收回全局群管指令权限}"
    end
elseif msg.gid and msg.grpAuth >= 2 then
    if string.match(msg.fromMsg, "开放") then
        setGroupConf(msg.gid, "群管指令权限开放", true)
        return "{开放本群群管指令权限}"
    elseif string.match(msg.fromMsg, "收回") then
        setGroupConf(msg.gid, "群管指令权限开放", false)
        return "{收回本群群管指令权限}"
    end
end
