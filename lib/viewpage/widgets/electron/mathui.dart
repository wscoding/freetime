import '../../../export.dart';

class MyHomePagebak extends StatefulWidget {

    final Item item;
  const MyHomePagebak({Key? key, required this.item}) : super(key: key);

  @override
  State<MyHomePagebak> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePagebak> {


  late String _content;
  late int _value;
  late int width;
  late int height;
  late Color _color;
  late int textsize;
  late String _title;
 late DateTime _date;
late String values;
  late  Timer _timer;
    late String type;
  bool _isTimerPaused = false;
bool _isDisposed = false ;
    int currentTime = 1;
    int currentTimes= 1;
  List<String> valueList = [];
  List<int> intList = [];
  List<int> intLists = [0,0,1,0];

  @override
  void initState() {


     super.initState();
        _content = widget.item.content;
    _value = widget.item.value;
    width = widget.item.width;
    height = widget.item.height;
    _color = widget.item.color;
    textsize = widget.item.textsize;
       _title = widget.item.title;
       _date = widget.item.date;
values = widget.item.values;
     type = widget.item.type;

           RawKeyboard.instance.addListener(_handleKeyEvent);
   startTimer();
    applyWindowSettings('window_settings.json');
  }

void applyWindowSettings(String path) async {
  WindowSettings settings = await WindowSettings.loadFromFile(path);
 double  mWidth = (width.toDouble()+textsize.toDouble())*3+100;
  double  mheight = (height.toDouble()+textsize.toDouble())*3+100;

  WindowManager.instance.setSize(Size(mWidth, mheight));
 // WindowManager.instance.setTitle(settings.windowTitle);
 // WindowManager.instance.setIcon(settings.windowIcon);
}

  void _handleKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent && event.logicalKey == LogicalKeyboardKey.space) {
      print(_color);
    }
  }

    @override
  void dispose() {
    RawKeyboard.instance.removeListener(_handleKeyEvent);

    if (_timer != null) {
      _timer.cancel();
    }
        _isDisposed = true;
    super.dispose();
  }

  Widget buildMultiDigitalWidget() {
    return MultiDigitalWidget(
      colors: [
        if (_color != null) _color, // 如果 _color 不为 null，则将其添加到颜色列表中
        // Colors.green,
      ],
      width: textsize.toDouble(),
      spacing: 10,
      count: 6,
      value: currentTimes ?? 1,
    );
  }

Widget zt(){
return   FloatingActionButton(
          child: const Icon(Icons.play_arrow),
      onPressed: () {
    if (_timer != null) {
      setState(() {
        _isTimerPaused = !_isTimerPaused;
        if (_isTimerPaused) {
          // 如果定时器已经暂停，则重新启动定时器
      
           _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (!_isDisposed && !_isTimerPaused) {
    
          currentTimes++;
   
      }
    });     
  // currentTimes++;       
        } else {
          // 如果定时器正在运行，则暂停定时器
          _timer.cancel();
        }
      });
    }
    },
        );
}


  void startTimer() {
    final item = widget.item;
    values = item.values;
    valueList = values.split(',');

// if (intList is List) {
 // intList = valueList.map((str) => int.parse(str)).toList();
try {
  intList = valueList.map((str) => int.parse(str)).toList();
} catch (e) {
  // 异常处理代码
  print('发生异常：$e');
  // 在这里可以执行适当的错误处理操作，如设置默认值或给出提示信息
  intList = [0, 0, 1, 0];
}

// } else {
//   intList = [0, 0, 1, 0];
// }

  //  intList = valueList.map((str) => int.parse(str)).toList();
 //   print(values);
   // print(intList[0]*86400+intList[1]*3600+intList[2]*60+intList[3]);
    
if (type == "daojishi") {
print('daojishi');
currentTimes =  intList[0]*86400+intList[1]*3600+intList[2]*60+intList[3];

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
//currentTimes =  intList[0]*86400+intList[1]*3600+intList[2]*60+intList[3];
if (currentTimes >= 1){
currentTimes--;

}
 currentTime = int.parse(getDateAndTime().replaceAll(RegExp(r'[^0-9]'), ''));

      });
    });
}else if  (type == "guding") {
print('guding');
        currentTime = int.parse(getDateAndTime().replaceAll(RegExp(r'[^0-9]'), ''));
   
       currentTimes = int.parse(getDateAndTimes().replaceAll(RegExp(r'[^0-9]'), ''));
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentTimes = int.parse(getDateAndTimes().replaceAll(RegExp(r'[^0-9]'), ''));
 currentTime = int.parse(getDateAndTime().replaceAll(RegExp(r'[^0-9]'), ''));

      });
    });

}else if (type == "miaobiao"){
print('miaobiao');
        currentTime = int.parse(getDateAndTime().replaceAll(RegExp(r'[^0-9]'), ''));
   
       currentTimes = 0;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      
        if (!_isDisposed && !_isTimerPaused) {
        setState(() {
          currentTimes++;
        });
      }
    });

}
  }

   //  String result = '$monthStr${dayStr}0$weekdayStr$hourStr$minuteStr$secondStr';

  String getDateAndTime() {
    DateTime now = DateTime.now();
    int month = now.month;
    int day = now.day;
    int weekday = now.weekday;
    int hour = now.hour;
    int minute = now.minute;
    int second = now.second;
    String monthStr = month.toString().padLeft(2, '0');
    String dayStr = day.toString().padLeft(2, '0');
    String weekdayStr = weekday.toString();
    String hourStr = hour.toString().padLeft(2, '0');
    String minuteStr = minute.toString().padLeft(2, '0');
    String secondStr = second.toString().padLeft(2, '0');
    String result = '$monthStr${dayStr}0$weekdayStr';

    return result;
  }

    String getDateAndTimes() {
    DateTime now = DateTime.now();
    int month = now.month;
    int day = now.day;
    int weekday = now.weekday;
    int hour = now.hour;
    int minute = now.minute;
    int second = now.second;
    String monthStr = month.toString().padLeft(2, '0');
    String dayStr = day.toString().padLeft(2, '0');
    String weekdayStr = weekday.toString();
    String hourStr = hour.toString().padLeft(2, '0');
    String minuteStr = minute.toString().padLeft(2, '0');
    String secondStr = second.toString().padLeft(2, '0');
    String result = '$hourStr$minuteStr$secondStr';
    return result;
  }
//07215032714
//072105 
//032714
//072105
//031160
  final DigitalPath digitalPath = DigitalPath();
  @override
  Widget build(BuildContext context) {
    return  Listener(
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
        
      child: Scaffold(
         backgroundColor: Colors.transparent,
        floatingActionButton: type == "miaobiao"
  ? zt()
  : null,

        body: Center(
            child:
            Column(children: [
              SizedBox(height: 10,),

MultiDigitalWidget(
  
  colors: [
   // if (_color != null) _color, // 如果 _color 不为 null，则将其添加到颜色列表中
   Colors.green,
    Colors.green,
        Color.fromARGB(255, 7, 132, 36),
        Color.fromARGB(255, 7, 132, 36),
    Color.fromARGB(255, 28, 99, 8),
    //    Colors.orange,
    Color.fromARGB(255, 28, 99, 8),
    
    Colors.indigo,
    Colors.purple,
    Colors.black,
  ],
  width: textsize.toDouble(),
  spacing: 10,
  count: 6,
  value: currentTime ?? 1,
),
SizedBox(height: 20,),
   buildMultiDigitalWidget() ,

            ],)
            ),
      ),
    ),
    );
  }
}
