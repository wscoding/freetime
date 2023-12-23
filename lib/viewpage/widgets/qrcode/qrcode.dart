


import 'dart:ui' as ui;



import '../../../export.dart';


/// This is the screen that you'll see when the app starts
class MainScreen extends StatefulWidget {

    final Item item;
  const MainScreen({Key? key, required this.item}) : super(key: key);


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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



Widget buildSubPage() {
  return SizedBox(
width: 300,

child: 
SingleChildScrollView(child:
  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
         children: [
          TextField(
            onChanged: (value) {
              setState(() {
                values = value;
              });
            },
            decoration: InputDecoration(
              labelText: '输入框',
            ),
          ),
          // Container(
          //   child: Center(
          //     child: Text(
          //       inputText, // 在这里替换为生成二维码的代码
          //       style: TextStyle(fontSize: 18),
          //     ),
          //   ),
          // ),
        ],
    
  )
 ,),

  );

}


  @override
  Widget build(BuildContext context) {

    final FutureBuilder<ui.Image> qrFutureBuilder = 
    FutureBuilder<ui.Image>(
      future: _loadOverlayImage(),
      builder: (BuildContext ctx, AsyncSnapshot<ui.Image> snapshot) {
     double size = ((textsize.toDouble())+100)*2;
        if (!snapshot.hasData) {
          return  SizedBox(width: size, 
          height:  60);
        }
        return CustomPaint(
          size:  Size.square(size),
          painter: QrPainter(
            data: values,
            version: QrVersions.auto,
            eyeStyle:  QrEyeStyle(
              eyeShape: QrEyeShape.circle,
              color: colors  ,
            ),
            dataModuleStyle:  QrDataModuleStyle(
              dataModuleShape: QrDataModuleShape.square,
              color: colors,
              //对角
            ),
            // size: 320.0,
            embeddedImage: snapshot.data,
            embeddedImageStyle: const QrEmbeddedImageStyle(
              size: Size.square(30),
            ),
          ),
        );
      },
    );

    return 
      Listener(
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

     Material(
      color: Colors.white,
      child: SafeArea(
        
        child: SingleChildScrollView(child:

        Column(
                crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
           SizedBox(
            width: 80,
height: 30,
           ),
            
               Center(
                child: SizedBox(
                width:250,
                  child: qrFutureBuilder,
                ),
              ),
           
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40)
                  .copyWith(bottom: 1),
              child:  Text(values),
            ),
               Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40)
                  .copyWith(bottom: 20),
              child:   buildSubPage(),

            ),
          ],
        ),
      ),
      ),
 ),
      ),


    );
  }

  Future<ui.Image> _loadOverlayImage() async {
    final Completer<ui.Image> completer = Completer<ui.Image>();
    final ByteData byteData =
    await rootBundle.load('lib/assets/888.png');
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }
}