local answer = string.sub(msg.fromMsg, #"设置加群答案" + 1)
msg.answer = answer

if getGroupConf(msg.gid, "自动审批入群申请", false) then
    setGroupConf(msg.gid, "入群问题答案", answer)
    return "{入群问题答案}"
else
    return "自动审批入群申请关"
end
