 import '../export.dart';
// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _windowSize = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future getWindowSize() async {
    var size = await DesktopWindow.getWindowSize();
    setState(() {
      _windowSize = '${size.width} x ${size.height}';
    });
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('desktop_window example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$_windowSize\n'),
              TextButton(
                child: Text("更新窗口参数"),
                onPressed: getWindowSize,
              ),
              TextButton(
                child: Text("setMinWindowSize(300,400)"),
                onPressed: () async {
                  await DesktopWindow.setMinWindowSize(Size(300, 400));
                },
              ),
              TextButton(
                child: Text("setMaxWindowSize(800,800)"),
                onPressed: () async {
                  await DesktopWindow.setMaxWindowSize(Size(800, 800));
                },
              ),
              Wrap(
                children: [
                  TextButton(
                    child: Text("小"),
                    onPressed: () async {
                      var size = await DesktopWindow.getWindowSize();
                      await DesktopWindow.setWindowSize(
                          Size(size.width - 50, size.height - 50));
                      await getWindowSize();
                    },
                  ),
                  TextButton(
                    child: Text("大"),
                    onPressed: () async {
                      var size = await DesktopWindow.getWindowSize();
                      await DesktopWindow.setWindowSize(
                          Size(size.width + 50, size.height + 50));
                      await getWindowSize();
                    },
                  ),
                ],
              ),
              Wrap(
                children: [
                  TextButton(
                    child: Text("打开全屏模式"),
                    onPressed: () async {
                      await DesktopWindow.resetMaxWindowSize();
                      await DesktopWindow.toggleFullScreen();
                    },
                  ),
                  Builder(builder: (ctx) {
                    return TextButton(
                      child: Text("是否处于全屏模式"),
                      onPressed: () async {


                        // final isFullScreen =
                        //     await DesktopWindow.getFullScreen();
                        // Scaffold.of(ctx).showSnackBar(SnackBar(
                        //     content: Text('getFullScreen = $isFullScreen'),
                        //     duration: Duration(seconds: 1)));

                        final isFullScreen =
                     
       await      DesktopWindow.getFullScreen();
ScaffoldMessenger.of(ctx).showSnackBar(
  SnackBar(
    content: Text('模式 = $isFullScreen'),
    duration: Duration(seconds: 1)
  ),
);

                            
                      },
                    );
                  }),
                  TextButton(
                    child: Text("全屏模式"),
                    onPressed: () async {
                      await DesktopWindow.setFullScreen(true);
                    },
                  ),
                  TextButton(
                    child: Text("非全屏模式"),
                    onPressed: () async {
                      await DesktopWindow.setFullScreen(false);
                    },
                  ),

                       TextButton(
                    child: Text("非全屏模式"),
                    onPressed: ()  {
                      //await DesktopWindow.setFullScreen(false);

// Navigator.push(
//   context,
//   MaterialPageRoute(
//  builder: (context) => ClockPage(),


//   ),
// );
    
                    },
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}




Future testWindowFunctions() async {
    Size size = await DesktopWindow.getWindowSize();
    print(size);
    await DesktopWindow.setWindowSize(Size(500,500));

    await DesktopWindow.setMinWindowSize(Size(400,400));
    await DesktopWindow.setMaxWindowSize(Size(800,800));

    await DesktopWindow.resetMaxWindowSize();
    await DesktopWindow.toggleFullScreen();
    bool isFullScreen = await DesktopWindow.getFullScreen();
    await DesktopWindow.setFullScreen(true);
    await DesktopWindow.setFullScreen(false);
}