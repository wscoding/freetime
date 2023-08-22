

import '../export.dart';
import 'package:intl/intl.dart';


class ClockPage extends StatefulWidget {

       final Item item;
  const ClockPage({Key? key, required this.item}) : super(key: key);

  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {


  late String _content;
  late int _value;
  late int width;
  late int height;
  late Color color;
  late int textsize;
  late String _title;
 late DateTime _date;
late String sx = "all";
late  DateTime _dateTime;
 late String _timeString;
late Timer _timer; // 定义定时器

  @override
  void initState() {



    _dateTime = DateTime.now();
    _timeString = _formatDateTime(_dateTime);
    //Timer.periodic(Duration(seconds: 1), (Timer t) => _getCurrentTime());
 _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getCurrentTime());
    super.initState();

        _content = widget.item.content;
    _value = widget.item.value;
    width = widget.item.width;
    height = widget.item.height;
    color = widget.item.color;
    textsize = widget.item.textsize;
       _title = widget.item.title;
       _date = widget.item.date;
           sx = widget.item.selectedValuezv;

 applyWindowSettings('window_settings.json');

    ///nongli();
  }
void applyWindowSettings(String path) async {
  WindowSettings settings = await WindowSettings.loadFromFile(path);
 double  mWidth = (width.toDouble()+textsize.toDouble())*3+100;
  double  mheight = (height.toDouble()+textsize.toDouble())*3+100;

  WindowManager.instance.setSize(Size(mWidth, mheight));
 // WindowManager.instance.setTitle(settings.windowTitle);
 // WindowManager.instance.setIcon(settings.windowIcon);
}



  void _getCurrentTime() {
    setState(() {
      _dateTime = DateTime.now();
      _timeString = _formatDateTime(_dateTime);
    
    });
  }

@override
void dispose() {
  // 取消定时器
  _timer?.cancel();
  super.dispose();
}
// void nongli() {
//   final dateString = '2023,7,9,17,17';
//   final format = DateFormat('yyyy,M,d,HH,mm');
//   final dateTime = format.parse(dateString);

//   final lunarCalendar = LunarCalendar(utcDateTime: dateTime.toUtc());
//   print('中国标准时间：${lunarCalendar.cst}');
// }

  String _formatDateTime(DateTime dateTime) {

   
      var lunarCalendarInfo = getLunarCalendarInfo();
var testcj = lunarCalendarInfo['时辰'][0]['凶吉'];
  var eightChar = lunarCalendarInfo['八字'];
    var yuexiang = lunarCalendarInfo['月相'];
       var chjie = lunarCalendarInfo['农历']['是否闰'];
  var phaseOfMoon = lunarCalendarInfo['农历']['农历日期'];
  var twoHourPeriod = lunarCalendarInfo['时辰'][0]['时段'];
  final solarTerms = lunarCalendarInfo['时辰'][0]['朝代'];
    var timeFormat = DateFormat('HH:mm:ss');
    var dateFormat = DateFormat('yyyy年M月d日');
     //var nongli = DateFormat('yyyy,M,d,HH,mm');
    var weekFormat = DateFormat('EEEE', 'zh_CN');
    //var periodFormat = DateFormat('a');
    var timePeriodString = _formatTimePeriod(dateTime);
    var greetingString = _getGreeting(dateTime);
    var timeString = timeFormat.format(dateTime);
    var dateString = dateFormat.format(dateTime);
    var weekString = weekFormat.format(dateTime);
      


print(sx);

  if (sx == "new") {
    return '  $twoHourPeriod $greetingString  $timeString \n$dateString $weekString';
  } else if (sx == "old") {
    // 添加旧日期格式的处理
    return ' $eightChar  $twoHourPeriod, $phaseOfMoon $chjie闰 $yuexiang $timePeriodString $solarTerms $testcj';
  }else if (sx == "all") {
    // 添加旧日期格式的处理
    return '$eightChar  $twoHourPeriod, $phaseOfMoon \n $greetingString  $timeString $timePeriodString\n$dateString $weekString';
  }
   else {
    return "";
  }

//       return
    
// '$eightChar  $twoHourPeriod, $phaseOfMoon \n $greetingString  $timeString $timePeriodString\n$dateString $weekString';
  


  }

  String _formatTimePeriod(DateTime dateTime) {
    int hour = dateTime.hour;
    if (hour >= 23 || hour < 1) {
      return '子时';
    } else if (hour >= 1 && hour < 3) {
      return '丑时';
    } else if (hour >= 3 && hour < 5) {
      return '寅时';
    } else if (hour >= 5 && hour < 7) {
      return '卯时';
    } else if (hour >= 7 && hour < 9) {
      return '辰时';
    } else if (hour >= 9 && hour < 11) {
      return '巳时';
    } else if (hour >= 11 && hour < 13) {
      return '午时';
    } else if (hour >= 13 && hour < 15) {
      return '未时';
    } else if (hour >= 15 && hour < 17) {
      return '申时';
    } else if (hour >= 17 && hour < 19) {
      return '酉时';
    } else if (hour >= 19 && hour < 21) {
      return '戌时';
    } else {
      return '亥时';
    }
  }

  String _getGreeting(DateTime dateTime) {
    int hour = dateTime.hour;
    if (hour < 6) {
      return '凌晨好';
    } else if (hour < 9) {
      return '早上好';
    } else if (hour < 12) {
      return '上午好';
    } else if (hour < 14) {
      return '中午好';
    } else if (hour < 18) {
      return '下午好';
    } else if (hour < 20) {
      return '傍晚好';
    } else if (hour < 22) {
      return '晚上好';
    } else {
      return '夜里好';
    }
  }

  @override
  Widget build(BuildContext context) {
    return     Listener(
      onPointerDown: (PointerDownEvent event) async {
        // if (event.buttons == kPrimaryButton) {
        //   print('Left button clicked');
        //   await windowManager.startDragging();
        // } else
         if (event.buttons == kSecondaryButton) {
          print('Right button clicked');

Navigator.pop(context,true);
        }
      }, 
          child:
          GestureDetector( 
     
       onPanStart: (e) {
            windowManager.startDragging();
          },
          
           child:
           SingleChildScrollView(child: Column(
            children: [
             Column(
      children: [
        SizedBox(
          height: 10,
        ),
Container(
  //color: Colors.blue, // 设置背景颜色
  child: ClockWidget(_dateTime,color: color,),
),
        // ClockWidget(_dateTime),
        // SizedBox(
        //   height: 10,
        // ),
        Container(
          alignment: Alignment.center,
          child:
       Text(
            _formatDateTime(_dateTime),
         style: TextStyle(fontSize: textsize.toDouble(),   color: Colors.blue, 
         // 修改字体颜色为蓝色
          decoration: TextDecoration.none),
     
          ),
          
         
        ),
      ],

    ),
            ],
           ),)

    ),
    );
  }
}

