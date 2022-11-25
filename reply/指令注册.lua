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
    prefix = "踢走"
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
    prefix = "给(.*)设置群名"
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
    prefix = "给(.*)头衔"
  },
  limit = {
    grp_id = { nor = { 0 } }
  },
  echo = {
    lua = "group_title_set"
  }
}

msg_reply.group_title_set = {
  keyword = {
    prefix = "给(.*)头衔"
  },
  limit = {
    grp_id = { nor = { 0 } }
  },
  echo = {
    lua = "group_title_set"
  }
}
