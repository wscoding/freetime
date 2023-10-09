
import 'package:FreeTime/public/daice/dice/papersoft.dart';
import 'package:FreeTime/themeui/m-soft.dart';

import '../../export.dart';
import '../../themeui/mains.dart';
import 'countdown/lanbai.dart';
import 'countdown/lb-soft.dart';
import 'daojishi/tts.dart';
import 'demo/t1.dart';
import 'electron/electron-soft.dart';
import 'jishuqi/jishuqi.dart';
  class MySubPage extends StatelessWidget {
    final Item item;
   MySubPage({Key? key, required this.item}) : super(key: key);
void navigateToPage(BuildContext context, Widget page, Item item) {
  navigateAndZoom(
    context,
    () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    ),
    item: item,
  );
}
//左soft 右Widgets
void navigateToPages(BuildContext context, Item item, 
{bool isapp = false}) {
  switch (item.textheme) {
    case 'defaults':
      navigateToPage(context, isapp ? 
      ImagePagesoft(item: item) : ImagePages(item: item), item);
      break;
    case 'default':
      navigateToPage(context, AnniversaryPage(item: item), item);
      break;
    case 'electron':
      navigateToPage(context, isapp ? 
      Electronsoft(item: item) : MyHomePagebak(item: item), item);
      break;
    case 'lanbai':
      navigateToPage(context,isapp ? 
       lanbaisoft(item: item): AnniversaryPages(item: item), item);
      break;
    case 'shaolou':
      navigateToPage(context,isapp? 
      salosoft(item: item, strokeWidth: 10,): salo(item: item, strokeWidth: 10,), item);
      break;
    case 'shizhong':
      navigateToPage(context, ClockPage(item: item), item);
      break;
    case 'limit':
      navigateToPage(context, jsq(item: item), item);
      break;
    case 'qrcode':
      navigateToPage(context, MainScreen(item: item), item);
      break;
    case 'timetest':
      navigateToPage(context, sz(), item);
      break;
    case 'huanrao':
      navigateToPage(context, isapp ? 
      AltAKeyListenersoft(item: item) : AltAKeyListener(item: item), item);
      break;
 
     case 'huaban':
           navigateToPage(context, isapp ? 
      Papersoft() : Paper(item: item), item);
      break;
    default:
      // do nothing
      break;
  }
}

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(milliseconds: 500), () {

// navigateAndZoom(context, () => Navigator.push(context, 
// MaterialPageRoute(builder: (context) => ImagePages(item: item))), item: item);  

if ( item.isapp == false ){
//navigateToPages(context,  item);
 navigateToPages(context, item, isapp: false);
    print('item:  ${item.isapp}');
}else 
  navigateToPages(context, item, isapp: true);

//navigateToPages(context,  item);
    print('item:  ${item.isapp}');
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ImagePages(item: item),
      //   ),
      // );

    });
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          children: [
Row(
  children: [
          TextButton( onPressed: () {
              // Navigate to ViewPager3 page
 //Navigator.push(context, MaterialPageRoute(builder: (context) => Paper()));
Navigator.pop(context,true);
            },    child: const Text("←返回")),
TextButton(
  onPressed: () {
    print('item.title: ${item.title}');
    print('item.textheme: ${item.textheme}');
navigateToPages(context,  item);
  },
  child: const Text('Widgets'),
),
TextButton(
  onPressed: () {
    print('item.title: ${item.title}');
    print('item.textheme: ${item.textheme}');
        navigateToPages(context, item, isapp: true);

//navigateToPages(context,  item);
  },
  child: const Text('Window soft→'),
),
  ],
),

 const Column(
  children: [
 SizedBox(
  width: 300,
  child: 
  Text('为什么会停留在此页面&异常显示?'),
),
   SizedBox(
 width: 400,
  child: Text('1.所选主题不支持小部件,或者未适配'),
 ),
 SizedBox(
  width: 400,
  child:  Text("2.此页面用于过渡:主程序与小部件之间互相转换,\n3.若过渡窗体页面过大,则过渡失败,请重新过渡"),
),
   SizedBox(
  width: 400,
  child:    Text('* 4.由于不同状态之间切换布局会造成布局混乱,此页作为缓冲区(窗口渲染失败)'),
),
  ],
),
 const  CircularProgressIndicator(),
const Text('等程序完善后,未来会删除该页面'),
const Text('若选择了Window-soft,需重新调节窗口大小'),
          ],
        )
        
      ),
    );
  }

void navigateAndZoom(BuildContext context,
  Future<dynamic> Function() navigateFunction, {required Item item}) {
  navigateFunction().then((result) async {
    if (result == true) {
      if (Platform.isWindows || Platform.isMacOS) {
        WidgetsFlutterBinding.ensureInitialized();
        await windowManager.ensureInitialized();
        WindowOptions windowOptions = WindowOptions(
          size: Size(600, 650),//宽高
          
          minimumSize: Size(item.width.toDouble()*2, item.height.toDouble()*2),
          maximumSize: Size(800, 800),
          center: true,
          backgroundColor: Colors.transparent,
          skipTaskbar: false,
          titleBarStyle: TitleBarStyle.normal,
        );
        windowManager.waitUntilReadyToShow(windowOptions, () async {
          await windowManager.show();
          await windowManager.focus();
          print(item.width.toDouble()*2);
            print(item.height.toDouble()*2);
        });
      }
    }
  });
}
}
