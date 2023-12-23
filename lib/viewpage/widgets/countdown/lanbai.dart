import 'dart:ui';

import 'package:FreeTime/export.dart';
import 'package:flutter/cupertino.dart';

// buildTimerBasic(
//   format: CountDownTimerFormat.daysHoursMinutesSeconds,
//   inverted: true,
// ),
class AnniversaryPages extends StatefulWidget {


    final Item item;
  const AnniversaryPages({Key? key, required this.item}) : super(key: key);


  @override
  _AnniversaryPages createState() => _AnniversaryPages();

}


class _AnniversaryPages extends State<AnniversaryPages> {

  int _currentIndex = 0; // 当前显示的 TimerFrame 的索引

  late String _content;
  late int _value;

  late int width;
  late int height;
  late Color _color;
  late int textsize;
  late String values;
 late DateTime _date;

  List<String> valueList = [];
  List<int> intList = [];




  @override
  void initState()  {

    super.initState();
        _content = widget.item.content;
    _value = widget.item.value;
    width = widget.item.width;
   

    height = widget.item.height;
    _color = widget.item.color;
    textsize = widget.item.textsize;
       values = widget.item.values;
       _date = widget.item.date;
     
   // 在 initState 中调用 qt 函数


    final item = widget.item;
    values = item.values;
    valueList = values.split(',');
    intList = valueList.map((str) => int.parse(str)).toList();
    print(values);
    print(intList[0]*86400+intList[1]*3600+intList[2]*60+intList[3]);
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




Widget buildTimerBasic({
  required CountDownTimerFormat format,
  bool inverted = false,
}) {
  return TimerCountdown(

    
    format: format,
    endTime: DateTime.now().add(
      Duration(
        days: intList[0],
        hours: intList[1],
        minutes: intList[2],
        seconds: intList[3],
      ),
    ),
    onEnd: () {
      print("Timer finished");
    },
    timeTextStyle: TextStyle(
      color: (inverted) ? purple : CupertinoColors.white,
      fontWeight: FontWeight.w300,
      fontSize: 40,
      fontFeatures: <FontFeature>[
        FontFeature.tabularFigures(),
      ],
    ),
    colonsTextStyle: TextStyle(
      color: (inverted) ? purple : CupertinoColors.white,
      fontWeight: FontWeight.w300,
      fontSize: 40,
      fontFeatures: <FontFeature>[
        FontFeature.tabularFigures(),
      ],
    ),
    descriptionTextStyle: TextStyle(
      color: (inverted) ? purple : CupertinoColors.white,
      fontSize: 10,
      fontFeatures: <FontFeature>[
        FontFeature.tabularFigures(),
      ],
    ),
    spacerWidth: 0,
    daysDescription: "days",
    hoursDescription: "hours",
    minutesDescription: "minutes",
    secondsDescription: "seconds",
  );
}
///ios black
///          navigationBar: CupertinoNavigationBar(
  //  leading: CupertinoNavigationBarBackButton(
  //           onPressed: () => Navigator.of(context).pop(),
  //         ),       ),   middle: Text('My App'),

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
 //Navigator.push(context, MaterialPageRoute(builder: (context,) => ItemListPage()) ,);
        }
      }, 

          child:
          GestureDetector( 
     
       onPanStart: (e) {
            windowManager.startDragging();
          },
          
           child:

     CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(      
        //brightness: Brightness.light,
        barBackgroundColor:Colors.transparent,

      ),
      home: CupertinoPageScaffold(
        backgroundColor:Colors.transparent,

        child: SafeArea(
          minimum: EdgeInsets.zero,
          child: 
          PageView(
  children: [
    ListView(
      children: [  
        TimerFrame(description: 'Customized Timer Countdown', timer: 
        buildTimerBasic(format: CountDownTimerFormat.daysHoursMinutesSeconds)),
        SizedBox(height: 20),
        TimerFrame(inverted: true, description: 'without seconds', timer:
         buildTimerBasic(format: CountDownTimerFormat.daysHoursMinutes, inverted: true)),
        SizedBox(height: 20),
        TimerFrame(description: 'whitout minutes & seconds', timer: 
        buildTimerBasic(format: CountDownTimerFormat.daysHours)),
        SizedBox(height: 20),
        TimerFrame(inverted: true, description: 'only days', timer: 
        buildTimerBasic(format: CountDownTimerFormat.daysOnly, inverted: true)),
        SizedBox(height: 20),
        TimerFrame(description: 'only hours', timer: 
        buildTimerBasic(format: CountDownTimerFormat.hoursOnly)),
        SizedBox(height: 20),
        TimerFrame(inverted: true, description: 'only minutes', timer:
         buildTimerBasic(format: CountDownTimerFormat.minutesOnly, inverted: true)),
        SizedBox(height: 20),
        TimerFrame(description: 'only seconds', timer: 
        buildTimerBasic(format: CountDownTimerFormat.secondsOnly)),
       SizedBox(height: 10),
      ],
    ),

  ],
),
          
          
          
          
          // ListView(
          //   children: [
          //     SizedBox(
          //       height: 20,
          //     ),
          //     TimerFrame(
          //       description: 'Customized Timer Countdown',
          //       timer: buildTimerBasic(
          //         format: CountDownTimerFormat.daysHoursMinutesSeconds,
          //       ),
          //     ),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     TimerFrame(
          //       inverted: true,
          //       description: 'without seconds',
          //       timer: buildTimerBasic(
          //         format: CountDownTimerFormat.daysHoursMinutes,
          //         inverted: true,
          //       ),
          //     ),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     TimerFrame(
          //       description: 'whitout minutes & seconds',
          //       timer: buildTimerBasic(
          //         format: CountDownTimerFormat.daysHours,
          //       ),
          //     ),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     TimerFrame(
          //       inverted: true,
          //       description: 'only days',
          //       timer: buildTimerBasic(
          //         format: CountDownTimerFormat.daysOnly,
          //         inverted: true,
          //       ),
          //     ),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     TimerFrame(
          //       description: 'only hours',
          //       timer: buildTimerBasic(
          //         format: CountDownTimerFormat.hoursOnly,
          //       ),
          //     ),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     TimerFrame(
          //       inverted: true,
          //       description: 'only minutes',
          //       timer: buildTimerBasic(
          //         format: CountDownTimerFormat.minutesOnly,
          //         inverted: true,
          //       ),
          //     ),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     TimerFrame(
          //       description: 'only seconds',
          //       timer: buildTimerBasic(
          //         format: CountDownTimerFormat.secondsOnly,
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
       ),
      ),
    );
  }
}
