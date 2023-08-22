//import '../list.dart';
import 'package:intl/intl.dart';

import '../export.dart';

//   buildCheckboxList(jindu, jindutheme,leftValue),
List<String> leftValues = [
  "default",
  "electron",
  "shizhong",
  "dig",
  "electrons",
  "111"
];
///左起  可选值  可选对应标题  不可选值   不可选对应标题

List<String> leftValue = [
  "111",
  "default",
  "dig",
  "shizhong",
  "electron",
  "electrons",
  "111"
];
List<String> time = ["default", "electron", "shizhong", "timetest"];
List<String> timetitle = [ "默认", "电子液晶管","时钟","调试(勿选)"];
List<String> timex = ["luoxue", "nitai", "lanbai"];
List<String> timextitle = [ "落雪","拟态", "蓝白"];



List<String> rightValues = ["luoxue", "nitai", "shizhong"];
List<String> daoshuriX = [ "落雪","拟态", "时钟"];
List<String> daoshurititle = ["默认", "电子液晶管", "蓝白"];
List<String> daoshurititle1 = ["默认", ];

List<String> daojishititle = ["默认", "电子液晶管", "蓝白",  "沙漏"];

List<String> miaobiao = [ 
   "huanrao",
  "electron",
];
List<String> miaobiaotite = [ 
   "环绕",
  "电子液晶管",
];

List<String> qrv = [ 
   "qrcode",
];
List<String> qrt = [ 
   "默认",
];

List<String> daojishi = [ 
   "default",
  "electron",
  "lanbai",
  "shaolou",];

List<String> jsqv = [ 
   "default",
  "limit",
];
List<String> jsqt = [ 
   "默认",
  "计数器主题",
];


List<String> ttitle = [ 
   "default",
  "shizhong",
  "timetest",];

List<String> tts = [ 
   "默认",
  "时钟",
  "调试(勿选)",
];

  List<String> daojishi1 = [ 
   "default",
  "lanbai",
  "timetest",];


List<String> daoshuri = [
  "default",
  "electron",
  "shaolou",
  "luoxue",
];

List<String> jindu = ["默认", "电子液晶管", "拟态", "时钟", "孤鹜", "落雪"];
List<String> jindutheme = ["默认123", "电子液晶管", "拟态", "时钟", "孤鹜", "落雪11"];
List<String> jindus = ["默认", "电子液晶管", "拟态", "时钟", "孤鹜", "落雪"];
List<String> all = ["默认", "电子液晶管", "拟态", "时钟", "孤鹜"];
List<String> alls = ["默认", "电子液晶管", "拟态", "时钟", "孤鹜", "落雪"];
List<String> selectedItems = ["默认", "电子液晶管", "拟态"];
List<String> guding = ["默认", "电子液晶管", "孤鹜"];
List<String> shipei = [
  '❤️❤️❤️❤️❤️❤️',
  '❤️❤️❤️❤️❤️',
  '❤️❤️❤️❤️',
  '❤️❤️❤️',
  '❤️❤️',
  '❤️',
  '空白',
];

List<Map<String, dynamic>> options = [
  {
    "title": "倒数日",
    "description": "倒计时到某个重要日子",
    "value": "daoshuri",
    "icon": Icons.access_time
  },
  {
    "title": "Time",
    "description": "*推荐 时间显示器",
    "value": "time",
    "icon": Icons.calendar_today
  },
  {
    "title": "秒表",
    "description": "计时器，计算时间的流逝",
    "value": "miaobiao",
    "icon": Icons.timer
  },
  {
    "title": "计数器",
    "description": "用于对某个事件进行累加计数",
    "value": "jishuqi",
    "icon": Icons.add
  },
  {
    "title": "倒计时",
    "description": "倒计时到某个时间点",
    "value": "daojishi",
    "icon": Icons.hourglass_empty
  },
  {
    "title": "进度",
    "description": "记录每天的进度",
    "value": "jindu",
    "icon": Icons.insert_chart
  },
  {
    "title": "图片",
    "description": "以图片为背景的桌面小部件",
    "value": "tupian",
    "icon": Icons.image
  },
      {
    "title": "备忘录",
    "description": "每日备忘录",
    "value": "notes",
    "icon": Icons.note
  },
    {
    "title": "二维码",
    "description": "输入文字或URL转换成二维码",
    "value": "qrcode",
    "icon": Icons.qr_code
  },
 {
    "title": "画板",
    "description": "五颜六色的画板",
    "value": "huaban",
    "icon": Icons.brush
  },


  {
    "title": "万花筒(开发中...)",
    "description": "绽放的花朵,动态主题",
    "value": "wanhuatong",
    "icon": Icons.follow_the_signs
  },
  {
    "title": "365爱心(开发中...)",
    "description": "365天组成一颗爱心,每天自动叠加一颗",
    "value": "aixin365",
    "icon": Icons.favorite
  },
  {
    "title": "抽签(开发中...)",
    "description": "抽取你的幸运签",
    "value": "chouqian",
    "icon": Icons.shuffle
  },
  {
    "title": "键盘(开发中...)",
    "description": "模拟键盘输入法",
    "value": "jianpan",
    "icon": Icons.keyboard
  },

 
  {
    "title": "复古游戏机(开发中...)",
    "description": "小时候玩过的掌上游戏机",
    "value": "fugugame",
    "icon": Icons.videogame_asset
  },
  {
    "title": "风车(开发中...)",
    "description": "小风车,呼呼呼",
    "value": "eco ",
    "icon": Icons.eco
  },
  {
    "title": "箭头(开发中...)",
    "description": "输入文字或URL转换成二维码",
    "value": "jiantou",
    "icon": Icons.arrow_back_ios
  },
  {
    "title": "星座(开发中...)",
    "description": "每日星座运势",
    "value": "xingzuo",
    "icon": Icons.stars
  },
  {
    "title": "尺子(开发中...)",
    "description": "直尺,圆尺,三角尺",
    "value": "chizi",
    "icon": Icons.straighten
  },
  {
    "title": "瓶子(开发中...)",
    "description": "一个小水瓶",
    "value": "pingzi",
    "icon": Icons.local_drink
  },
  {
    "title": "快捷方式(开发中...)",
    "description": "点击直接打开某个网页",
    "value": "url",
    "icon": Icons.link
  },
  {
    "title": "天气(开发中...)",
    "description": "获取当前城市的天气信息",
    "value": "tianqi",
    "icon": Icons.cloud
  },
  {
    "title": "一言(开发中...)",
    "description": "获取一句有趣的语录",
    "value": "yihua",
    "icon": Icons.format_quote
  },
  {
    "title": "随机点名(开发中...)",
    "description": "从名单中随机选择一个人",
    "value": "dianming",
    "icon": Icons.person
  },
  {
    "title": "罗盘(开发中...)",
    "description": "罗盘、罗经、罗庚,罗经盘等",
    "value": "luopan",
    "icon": Icons.golf_course_rounded
  },
  {
    "title": "卦象(开发中...)",
    "description": "八卦之象",
    "value": "guaxiang",
    "icon": Icons.fmd_good
  },
  {
    "title": "翻译(开发中...)",
    "description": "输入汉字翻译",
    "value": "fanyi",
    "icon": Icons.charging_station
  },

    {
    "title": "电脑配置(开发中...)",
    "description": "输入汉字翻译",
    "value": "peizhi",
    "icon": Icons.all_inbox
  },
    {
    "title": "喝水提醒(开发中...)",
    "description": "今天喝水了吗",
    "value": "water",
    "icon": Icons.water
  },
    {
    "title": "井字棋(开发中...)",
    "description": "九宫格井字棋",
    "value": "liziqi",
    "icon": Icons.check_box_rounded
  },
    {
    "title": "测手速(开发中...)",
    "description": "测测你的手速有多快",
    "value": "ceshousu",
    "icon": Icons.speed
  },

    {
    "title": "提词器(开发中...)",
    "description": "作者还没有想好要写什么",
    "value": "tici",
    "icon": Icons.tips_and_updates
  },

    {
    "title": "放大镜(开发中...)",
    "description": "作者还没有想好要写什么",
    "value": "fanyi",
    "icon": Icons.gavel
  },

  
    {
    "title": "开关(开发中...)",
    "description": "作者还没有想好要写什么",
    "value": "swich",
    "icon": Icons.app_blocking
  },

      {
    "title": "滚动字幕(开发中...)",
    "description": "作者还没有想好要写什么",
    "value": "swich",
    "icon": Icons.font_download_outlined
  },
      {
    "title": "CSS/JS(开发中...)",
    "description": "网页控制器",
    "value": "browser",
    "icon": Icons.browse_gallery_rounded
  },



  {
    "title": "自定义挂件(开发中...)",
    "description": "自定义倒计时挂件",
    "value": "gj",
    "icon": Icons.widgets
  },
];

// 向上箭头：Icons.arrow_drop_up
// 向下箭头：Icons.arrow_drop_down
// 向左箭头：Icons.arrow_back
// 向右箭头：Icons.arrow_forward
// 双向箭头：Icons.compare_arrows
// 循环箭头：Icons.loop

List<DropdownMenuItem<String>> allshuxin = [
  //must
  {"value": "all", "icon": Icons.all_out, "text": "all"},
  {"value": "custom", "icon": Icons.dashboard_customize_sharp, "text": "默认"},

  {"value": "new", "icon": Icons.open_in_browser, "text": "公历"},
  {"value": "old", "icon": Icons.unfold_less_double_outlined, "text": "农历"},

  /// {"value": "10", "icon": Icons.unfold_less_double_outlined, "text": "农历2"},
//秒表
//计时器
  {"value": "s", "icon": Icons.timeline, "text": "v.vv秒"},
  {"value": "m", "icon": Icons.timeline, "text": "v分v秒vv"},
  {"value": "h", "icon": Icons.timeline, "text": "小时"},
// qrcode
  {"value": "3f1y", "icon": Icons.shape_line, "text": "方圆(开发中..)"},
  {"value": "3y1f", "icon": Icons.shape_line_outlined, "text": "圆方(开发中..)"},
  {"value": "1y1y", "icon": Icons.shape_line_outlined, "text": "圆圆(开发中..)"},
//方方

//进度
    {"value": "work", "icon": Icons.work_history, "text": "工作进度"},
    {"value": "timeup", "icon": Icons.timeline, "text": "时间进度"},
//倒计时
    {"value": "times", "icon": Icons.work_history, "text": "空格 触发"},


]
    .map((item) => DropdownMenuItem<String>(
          value: item['value'] as String,
          child: Row(
            children: [
              Icon(item['icon'] as IconData),
              SizedBox(width: 8),
              Text(item['text'] as String),
            ],
          ),
        ))
    .toList();


Map<String, dynamic> getLunarCalendarInfo() {

  final dateString = '2023,7,9,17,17';
  final format = DateFormat('yyyy,M,d,HH,mm');
  final dateTime = format.parse(dateString);
  final lunarCalendar = LunarCalendar(utcDateTime: dateTime.toUtc());
  final twoHourPeriodsString = lunarCalendar.twoHourPeriodList
      .map((e) =>
          '${e.twoHourPeriodIndex}: ${e.nameInTheDay} (${e.nameInHanDynasty}) ${e.meridian} ${e.isLuckyName}')
      .toList();
  return {
    '中国标准时间': lunarCalendar.cst,
    '当地时间': lunarCalendar.localTime,
    '是否cn时区': lunarCalendar.useCSTToCalculate,
    '春节': lunarCalendar.chineseNewYearString,
    '农历': {
      '年': lunarCalendar.lunarDate.year,
      '月': lunarCalendar.lunarDate.month,
      '日': lunarCalendar.lunarDate.day,
      '是否闰': lunarCalendar.lunarDate.isLeapMonth,
      '农历日期': lunarCalendar.lunarDate.fullCNString,
    },
    '八字': lunarCalendar.eightChar,
    '星期几': lunarCalendar.weekDayCN,
    '月相': lunarCalendar.phaseOfMoon,
    '节气': lunarCalendar.solarTerms.values
        .map((value) => {
              '名称': value.name,
              '时间': value.getTime(useCSTToCalculate: lunarCalendar.useCSTToCalculate),
            })
        .toList(),
    '今天节气': lunarCalendar.todaySolarTerm,
    '周期': {
      '当前': lunarCalendar.twoHourPeriod.steamName,
      'name': lunarCalendar.twoHourPeriod.name,
      'keName': lunarCalendar.twoHourPeriod.ke.name,
    },
    '时辰': lunarCalendar.twoHourPeriodList
        .map((e) => {
              '索引': e.twoHourPeriodIndex,
              '名称': e.nameInTheDay,
              '时段': e.nameInHanDynasty,
              '朝代': e.meridian,
              '凶吉': e.isLuckyName,
            })
        .toList(),
            '所有时辰': twoHourPeriodsString,
// 打印所有时辰的朝代和凶吉信息
// lunarCalendar.twoHourPeriodList.forEach((e) {
//   print('${e.meridian} ${e.isLuckyName}');
// });

// // 打印指定索引的时辰的朝代和凶吉信息，例如第一个时辰
// print('${lunarCalendar.twoHourPeriodList[0].meridian} 
// ${lunarCalendar.twoHourPeriodList[0].isLuckyName}');
  // 本日时辰
  /// https://pub.dev/packages/chinese_lunar_calendar/example
  };
}

Map<String, String> zhtai = {
  'aa': '完整支持',
  'be': '支持',
  'cr': '不完整体验',
  'dd': '适配中',
  'es': '开发中',
  'fs': '暂不支持',
  'ha': '空白',
};
