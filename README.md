# group_manage

## infomation

集成一些群管指令的 mod，所有功能基于 gocq_api 库。

~~其实绝大多数的功能都是 dice 本身就自带有指令的，也方便不了多少~~

dice 论坛链接：

```json
{
  "mod": "GGmanage",
  "ver": "1.0.0",
  "author": "地窖上的松",
  "dice_build": 612,
  "brief": "使用gocq的api来进行群组管理",
  "repo": "https://ghproxy.com/https://github.com/pineoncellar/GGmanage.git",
  "comment": "歪比歪比",
  "helpdoc": {
    "禁言": "禁言指令：\n禁言[@]x天x小时x分钟x\n解除禁言[@]",
    "踢出": "踢出指令：\n踢出[@]",
    "全员禁言": "全员禁言指令：\n全员禁言开/关",
    "设置管理": "设置管理指令：\n设置管理[@]\n取消管理[@]",
    "设置群名": "设置群名指令：\n设置群名【新群名】\n另，设置群员群名片指令：\n设置群名片[@]【新群名片】",
    "设置群名片": "设置群员群名片指令：\n设置群名片[@]【新群名片】",
    "设置头衔": "设置头衔指令：\n设置头衔[@]【新头衔】",
    "设置精华": "[回复要设精的信息]设为精华",
    "自动审批入群申请": "自动审批入群申请功能：\n自动审批入群申请功能开/关//开关本群骰娘自动审批入群申请功能\n设置入群答案【答案A】|【答案B】....//设置入群问题答案，不同答案间以|分隔，新人入群回答中若匹配到答案之一即通过\n骰娘将每10分钟搜索一次群系统消息列表并执行判断\n若新人入群回答中没有匹配到答案则会被骰娘忽略，此时活人管理可自由处理。\n骰娘在框架启动时才会读取在本群的权限，如果出现权限不足的报错请联系骰主。"
  }
}
```

## install

- Dice 版本 2.6.5beta12(624+)以上安装方法:

  1. 在 `./DiceQQ/conf/mod/source.list`文件内（没有 mod 文件夹和这文件就新建）输入以下内容：

  ```
  https://raw.sevencdn.com/Dice-Developer-Team/DiceModIndex/main/
  https://raw.githubusercontent.com/Dice-Developer-Team/DiceModIndex/main/
  https://ssjskfjdj.netlify.app/Module/
  ```

  2. 使用 `.system load`命令重载 bot，这样做的目的是为了让步骤 1 里的远程地址生效。
  3. 对 bot 发送 `.mod get [功能模块名]`命令，等待安装。
  4. 回到第二步，这样做的目的是为了让 mod 被加载。
  5. Enjoy Your Self!

- Dice 版本 2.6.4b(612+)以上安装方法：

  1. 浏览器访问 `https://github.com/ssJSKFJDJ/GGmanage`并点击绿色按钮 `Code`下的 `Download Zip`按钮下载仓库压缩包。
  2. 解压压缩包，将里面的文件和文件夹全部丢进 `./DiceQQ/mod/`文件夹内。
  3. 使用 `.system load`命令重载。
  4. Enjoy Your Self!
