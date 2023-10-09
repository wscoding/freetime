import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../export.dart';
import '../../../utils/items.dart';

class AnniversaryPage extends StatefulWidget {


    final Item item;
  const AnniversaryPage({Key? key, required this.item}) : super(key: key);





  @override
  _AnniversaryPageState createState() => _AnniversaryPageState();
}

class _AnniversaryPageState extends State<AnniversaryPage> {

  late String _content;
  late int _value;
  late int width;
  late int height;
  late Color _color;
  late int textsize;
  late String _title;
 late DateTime date = DateTime.parse('2023-07-20T00:00:00.000');

  final DateTime anniversaryDate = DateTime.parse('2023-07-20T00:00:00.000');
    //final DateTime  
  late Timer _timer;
  late String _timeLeft;

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
       date = widget.item.date;
       
 applyWindowSettings('window_settings.json');
    _updateTimeLeft();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _updateTimeLeft();
      });
    });
  }





void applyWindowSettings(String path) async {
  WindowSettings settings = await WindowSettings.loadFromFile(path);
 double  mWidth = (width.toDouble()+textsize.toDouble())*3+100;
  double  mheight = (height.toDouble()+textsize.toDouble())*3+100;

  WindowManager.instance.setSize(Size(mWidth, mheight));
 // WindowManager.instance.setTitle(settings.windowTitle);
 // WindowManager.instance.setIcon(settings.windowIcon);
}



  void _updateTimeLeft() {
    final Duration duration = date.difference(DateTime.now());
    _timeLeft = duration.isNegative
        ? _formatDuration(duration.abs(), '距今已过去\n')
        : _formatDuration(duration, '距今还有\n');
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return   Listener(
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
    
     Scaffold(
        backgroundColor: Colors.transparent,

      body: Center(
        child: Column(
          children: [
                 Text(
          _title,
          style: TextStyle(fontSize: textsize.toDouble(),color: _color),
        ),
            Text(
          _content,
          style: TextStyle(fontSize: textsize.toDouble(),color: _color),
        ),
               Text(
        DateFormat('yyyy-MM-dd HH:mm:ss').format(date),
          style: TextStyle(fontSize: textsize.toDouble(),color: _color),
        ),
            Text(
          _timeLeft,
          style: TextStyle(fontSize: textsize.toDouble(),color: _color),
        ),


          ],
        )
      ),

         ),
        ),
    );
  }

  String _formatDuration(Duration duration, String prefix) {
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;
    //final milliseconds = duration.inMilliseconds % 1000;
    return '$prefix $days 天 $hours 小时 $minutes 分钟 $seconds 秒';
  }
}