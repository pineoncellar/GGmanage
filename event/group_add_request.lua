event.group_add_request = {
    title = "心跳",
    trigger = {
        cycle = {
            minute = 10, second = 21 --自动审批入群申请的时间周期，设置太高可能会影响使用，太低可能会占用过多硬件资源
        }
    },
    action = { lua = "group_add_request" }
}
