msg_reply.group_manage_limit = {
  keyword = {
    prefix = "群管指令权限"
  },
  echo = {
    lua = "group_manage_limit"
  }
}

msg_reply.group_bulbus_oris = {
  keyword = {
    prefix = "禁言"
  },
  limit = {
    grp_id = { nor = { 0 } }
  },
  echo = {
    lua = "group_bulbus_oris"
  }
}

msg_reply.group_kick = {
  keyword = {
    prefix = "踢出"
  },
  limit = {
    grp_id = { nor = { 0 } }
  },
  echo = {
    lua = "group_kick"
  }
}

msg_reply.group_whole_ban = {
  keyword = {
    prefix = "全员禁言"
  },
  limit = {
    grp_id = { nor = { 0 } }
  },
  echo = {
    lua = "group_whole_ban"
  }
}

msg_reply.group_admin_set = {
  keyword = {
    prefix = "设置管理"
  },
  limit = {
    grp_id = { nor = { 0 } }
  },
  echo = {
    lua = "group_admin_set"
  }
}

msg_reply.group_admin_delete = {
  keyword = {
    prefix = "取消管理"
  },
  limit = {
    grp_id = { nor = { 0 } }
  },
  echo = {
    lua = "group_admin_delete"
  }
}

msg_reply.group_card_set = {
  keyword = {
    prefix = "设置群名片"
  },
  limit = {
    grp_id = { nor = { 0 } }
  },
  echo = {
    lua = "group_card_set"
  }
}

msg_reply.group_name_set = {
  keyword = {
    prefix = "设置群名"
  },
  limit = {
    grp_id = { nor = { 0 } }
  },
  echo = {
    lua = "group_name_set"
  }
}

msg_reply.group_title_set = {
  keyword = {
    prefix = "设置头衔"
  },
  limit = {
    grp_id = { nor = { 0 } }
  },
  echo = {
    lua = "group_title_set"
  }
}

msg_reply.group_set_essence = {
  keyword = {
    prefix = "[CQ:reply"
  },
  limit = {
    grp_id = { nor = { 0 } }
  },
  echo = {
    lua = "group_set_essence"
  }
}

--[[msg_reply.group_set_notice = {
  keyword = {
    prefix = "发送公告"
  },
  limit = {
    grp_id = { nor = { 0 } }
  },
  echo = {
    lua = "group_set_notice"
  }
}
]]

msg_reply.group_add_request_switch = {
  keyword = {
    prefix = "自动审批入群申请"
  },
  limit = {
    grp_id = { nor = { 0 } }
  },
  echo = {
    lua = "group_add_request_switch"
  }
}

msg_reply.group_add_request_answer = {
  keyword = {
    prefix = "设置入群答案"
  },
  limit = {
    grp_id = { nor = { 0 } }
  },
  echo = {
    lua = "group_add_request_answer"
  }
}

msg_reply.group_add_request_start = {
  keyword = {
    prefix = "开始审批入群申请"
  },
  limit = {
    user_var = { trust = { at_least = 4 } }
  },
  echo = {
    lua = "group_add_request"
  }
}

msg_reply.group_bulbus_oris_not = {
  keyword = {
    prefix = "解除禁言"
  },
  limit = {
    grp_id = { nor = { 0 } }
  },
  echo = {
    lua = "group_bulbus_oris_not"
  }
}
