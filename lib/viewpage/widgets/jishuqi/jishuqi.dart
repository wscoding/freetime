

import "package:FreeTime/export.dart";


class jsq extends StatefulWidget {

    final Item item;
   jsq({Key? key, required this.item}) : super(key: key);


  @override
  State<jsq> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<jsq> {
  late int count = 0;

  late String _content;
  late int values;
  late int width;
  late int height;
  late Color _color;
  late int textsize;
  late String _title;
 late DateTime _date;


  @override
  void initState()  {

    super.initState();
        _content = widget.item.content;
  //  _count = widget.item.values;
    width = widget.item.width;
    height = widget.item.height;
    _color = widget.item.color;
    textsize = widget.item.textsize;
       _title = widget.item.title;
       _date = widget.item.date;



//类型转换
//count = int.parse(widget.item.values);
//count = int(widget.item.values);
try {
    count = int.parse(widget.item.values);
} catch (e) {
  // 异常处理代码
  print('发生异常：$e');
  // 在这里可以执行适当的错误处理操作，如设置默认值或给出提示信息
  count = 1;
}


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




  final DigitalPath digitalPath = DigitalPath();

  @override
  Widget build(BuildContext context) {
    return    Listener(
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
      backgroundColor: _color,

        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            count++;
            setState(() {});

          },
        ),
        body: Center(
            child:
            // SingleDigitalWidget(
            //   color: Colors.black,
            //   width: 104,
            //   value: 8,
            // )
        //
            MultiDigitalWidget(
              colors: [Colors.red,Colors.orange,Colors.yellow,Colors.green,Colors.blue,Colors.indigo,Colors.purple,Colors.black],
          width: 76,
          spacing: 16,
          count: 8,
          value: count,
        )

            // Wrap(
            //   spacing: 26,
            //   children: [
            //     // DigitalWidget(
            //     //   width: 124,
            //     //   value: 8,
            //     //   color: Colors.blue,
            //     //   digitalPath: digitalPath,
            //     // ),
            //     SingleDigitalWidget(
            //       width: 54,
            //       value: tenBit,
            //       digitalPath: digitalPath,
            //     ),
            //     SingleDigitalWidget(
            //       color: Colors.red,
            //       width: 54,
            //       value: oneBit,
            //       digitalPath: digitalPath,
            //     ),
            //   ],
            // ),
            ),
      ),
              ),
      
    );
  }
}