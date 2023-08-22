
import '../../export.dart';


    late final Item item;

class WindowSettings {



  double windowWidth = 200;
  double windowHeight = 150;
 //late String windowTitle;
// late String windowIcon;

  WindowSettings({required this.windowWidth,
  required this.windowHeight,
  // required this.windowTitle,required this.windowIcon
   });

  factory WindowSettings.fromJson(Map<String, dynamic> json) {
    return WindowSettings(
      windowWidth: json['windowWidth'] ?? 800,
      windowHeight: json['windowHeight'] ?? 600,
 //     windowTitle: json['windowTitle'] ?? 'My App',
      //windowIcon: json['windowIcon'] ?? 'assets/dice_1.png',
    );
  }

  Map<String, dynamic> toJson() => {
        'windowWidth': windowWidth,
        'windowHeight': windowHeight,
      //  'windowTitle': windowTitle,
      //  'windowIcon': windowIcon,
      };

  static Future<WindowSettings> loadFromFile(String path) async {
  
      if (Platform.isWindows || Platform.isMacOS) {
        WidgetsFlutterBinding.ensureInitialized();
        await windowManager.ensureInitialized();
        WindowOptions windowOptions = const WindowOptions(
      alwaysOnTop: true,
      skipTaskbar: true,
          center: true,
          backgroundColor: Colors.transparent,
       
          titleBarStyle: TitleBarStyle.hidden,
        );
        windowManager.waitUntilReadyToShow(windowOptions, () async {
          await windowManager.show();
          await windowManager.focus();
      await windowManager.setAsFrameless();  //设置窗口为无边框
        });
      }
    

    try {



      File file = File(path);
      if (await file.exists()) {
        String contents = await file.readAsString();
        Map<String, dynamic> json = jsonDecode(contents);
        return WindowSettings.fromJson(json);
      }
    } catch (e) {
      print(e);
    }
    return WindowSettings(windowWidth:300,windowHeight:300,
    //windowIcon:'assets/dice_1.png',windowTitle:'123'
    ); }

  Future<void> saveToFile(String path) async {
    try {
      File file = File(path);
      await file.writeAsString(jsonEncode(toJson()));
    } catch (e) {
      print(e);
    }
  }

     double relHeight = 300;
  
   Future initWindows( {Size? screenSize}) async {
    
    // 获取屏幕真实大小
    Display primaryDisplay = await screenRetriever.getPrimaryDisplay();
    relHeight = primaryDisplay.size.height * 0.15;
    double relWidth = relHeight;
    final displaySize = Size(relWidth, relHeight);
    WindowManager w = WindowManager.instance;
    await w.ensureInitialized();
    WindowOptions windowOptions = WindowOptions(
        size: displaySize,
        minimumSize: displaySize,
        alwaysOnTop: true, // 设置置顶
        titleBarStyle: TitleBarStyle.hidden, // 去除窗口标题栏
        skipTaskbar: true // 去除状态栏图标
        );
    w.waitUntilReadyToShow(windowOptions, () async {
      double w1 = primaryDisplay.size.width - 100;
      await w.setBackgroundColor(Colors.transparent);
      await w.setPosition(Offset(w1 - relWidth,
       primaryDisplay.size.height - relHeight - 100)); // 位置居中
      await w.show();
      await w.focus();    
      await w.setAsFrameless();  //设置窗口为无边框
    });
  }


  
}