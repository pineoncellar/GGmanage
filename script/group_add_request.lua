gapi = require("gocq_api")
json = require("json")


local group_system_msg_list = gapi.http_post("get_group_system_msg")
local group_add_list = json.decode(group_system_msg_list)["data"]["join_requests"] --将加群申请列表取出

for i = 1, #system_msg_list do
    local group_add_table = group_add_list[i] --将列表中单个加群申请事件取出
    local gid = group_add_table["group_id"]
    if getGroupConf(gid, "自动审批入群申请", false) then --如果本群打开了自动审批加群申请，则执行以下操作
        if not group_add_table["checked"] then
            local request_msg = group_add_table["message"]
            local request_id = group_add_table["request_id"]
            local answer = getGroupConf(gid, "入群问题答案", 0)
            if string.match(request_msg, answer) then -- 如果入群验证消息中包含答案，则通过入群申请
                respond = gapi.http_post("set_group_add_request", tostring(request_id), "add", true)
                responds = json.decode(respond)
                if responds["status"] == "ok" then -- 以防万一，留下一个报错方式
                else
                    sendMsg("自动审批加群申请失败！错误信息：" .. responds["wording"], gid, nil)
                end
                -- 如果答案错误，那就直接忽略不管，让群里活人管理去处理
                -- 其实本来是想写写自动拒绝申请并发送拒绝理由的，不过每个群的情况不同，还是放弃了，如果骰主想要有可以联系我。
                -- 或者说想要自动审批入群后给群主或是管理发条信息的也可以联系我
            end
        end
    end
end
