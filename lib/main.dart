import '../export.dart';

void main() async {
  if (Platform.isWindows || Platform.isMacOS) {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(600, 650),
      minimumSize: Size(500, 400),
      maximumSize: Size(800, 800),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      Tooltip(
        message: "最小化", // 气泡提示信息
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 35, 12, 93).withOpacity(0.9), // 气泡背景色
          borderRadius: BorderRadius.circular(4), // 圆角
        ),
        textStyle: TextStyle(fontSize: 12, color: Colors.white), // 文本样式
        waitDuration: Duration(milliseconds: 100), // 等待时间
        showDuration: Duration(milliseconds: 2000), // 显示时间
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), // 内边距
        // child: YourMinimizeButton(), // 最小化按钮组件
      );
    });
  }

  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting("zh_CN", null);

  //中文本地化
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Free Time',
      theme: ThemeData(

          // colorScheme:
          //ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: Colors.transparent),
          ),
      home: GestureDetector(
        onPanStart: (e) {
          windowManager.startDragging();
        },
        child: SubPage(),
      ),
    );
  }
}
