import 'package:FreeTime/export.dart';




class AltAKeyListenersoft extends StatefulWidget {
        final Item item;
  const AltAKeyListenersoft({Key? key, required this.item}) : super(key: key);

  
 
  @override
  State<AltAKeyListenersoft> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AltAKeyListenersoft> {
  final CountDownController _controller = CountDownController();
  TextEditingController _textEditingController = TextEditingController();


late  String values = '无书';

  late String _content;
  //late String values;
  late int width;
  late int height;
   late Color colors ; 
   int textsize = 300;
  late String _title;
 late DateTime _date;

String contents = "circle";

  @override
  void initState()  {

    super.initState();
        _content = widget.item.content;
    values = widget.item.values;
    width = widget.item.width;
    height = widget.item.height;
    colors = widget.item.color;
    textsize = widget.item.textsize;
       _title = widget.item.title;
       _date = widget.item.date;

}




   int durations = 10;


  bool isPlaying = false;


  void _togglePlayback() {
    if (isPlaying) {
      _controller.pause();
    } else {
      _controller.resume();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Listener(
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
     // backgroundColor: Colors.transparent,

      body: Center(
        
        child: Column(children: [
                   TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                     filled: true,
    fillColor: Colors.white, // 设置背景颜色
       //  fillColor: const Color.fromARGB(255, 1, 24, 35), // 设置背景颜色

                  hintText: 'Enter a number',
                ),
              ),
              SizedBox(height: 10),
           
                Text("读秒: "+durations.toString()+" s"),
                   SizedBox(height: 30),
          CircularCountDownTimer(
          // Countdown duration in Seconds.
          duration: durations,

          // Countdown initial elapsed Duration in Seconds.
          initialDuration: 0,

          // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
          controller: _controller,

          // Width of the Countdown Widget.
          width: MediaQuery.of(context).size.width / 2,

          // Height of the Countdown Widget.
          height: MediaQuery.of(context).size.height / 2,

          // Ring Color for Countdown Widget.
          ringColor: Colors.grey[300]!,

          // Ring Gradient for Countdown Widget.
          ringGradient: null,

          // Filling Color for Countdown Widget.
          fillColor: Colors.purpleAccent[100]!,

          // Filling Gradient for Countdown Widget.
          fillGradient: null,

          // Background Color for Countdown Widget.
          backgroundColor: Colors.purple[500],

          // Background Gradient for Countdown Widget.
          backgroundGradient: null,

          // Border Thickness of the Countdown Ring.
          strokeWidth: 20.0,

          // Begin and end contours with a flat edge and no extension.
          strokeCap: StrokeCap.round,

          // Text Style for Countdown Text.
          textStyle: const TextStyle(
            fontSize: 33.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),

          // Text Align for Countdown Text.
     //     textAlign: TextAlign.justify,

          // Format for the Countdown Text.
          textFormat: CountdownTextFormat.S,

          // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
          isReverse: false,

          // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
          isReverseAnimation: false,

          // Handles visibility of the Countdown Text.
          isTimerTextShown: true,

          // Handles the timer start.
          autoStart: false,

          // This Callback will execute when the Countdown Starts.
          onStart: () {
            // Here, do whatever you want
            debugPrint('Countdown Started');
          },

          // This Callback will execute when the Countdown Ends.
          onComplete: () {
            // Here, do whatever you want
            debugPrint('Countdown Ended');
          },

          // This Callback will execute when the Countdown Changes.
          onChange: (String timeStamp) {
            // Here, do whatever you want
            debugPrint('Countdown Changed $timeStamp');
          },

          /* 
            * Function to format the text.
            * Allows you to format the current duration to any String.
            * It also provides the default function in case you want to format specific moments
              as in reverse when reaching '0' show 'GO', and for the rest of the instances follow 
              the default behavior.
          */
          timeFormatterFunction: (defaultFormatterFunction, duration) {
            if (duration.inSeconds == 0) {
              // only format for '0'
              return "Start";
            } else {
              // other durations by it's default format
              return Function.apply(defaultFormatterFunction, [duration]);
            }
          },
        ),
        ],)
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 30,
          ),
          _button(
            title: "Start",
           // onPressed: () => _controller.start(),
             onPressed: () => _controller.restart(duration: durations),
          ),
        
  
  const SizedBox(
            width: 10,
          ),
              ElevatedButton(
 style:ButtonStyle(   backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 20, 180, 97)),
),
                onPressed: _togglePlayback,
                child: Text(isPlaying ? 'Pause' : 'Resume'),
              ),
  const SizedBox(
            width: 10,
          ),
   _button(
                title: "Save and Update",

                onPressed: () {
                  // 获取输入框的值
                  setState(() {
         try {
  // 可能会引发异常的代码
durations = int.parse(_textEditingController.text);
  throw Exception(durations);
} catch (e) {
  // 处理异常的代码
     // durations= 10;  
  print('捕获到异常：$e');
}

                  print('保存或更新值: $durations');

                  });
                  // 在这里执行保存或更新逻辑
                },
             //  Text('Save and Update'),
              ),
          // const SizedBox(
          //   width: 10,
          // ),
          // _button(
          //   title: "Restart",
          //   onPressed: () => _controller.restart(duration: durations),
          // ),
        ],
      ),
       ),
        ),
    );
  }

  Widget _button({required String title, VoidCallback? onPressed}) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}