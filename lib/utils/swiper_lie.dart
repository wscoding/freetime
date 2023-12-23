import 'package:FreeTime/utils/setting/setting.dart';
import 'package:FreeTime/utils/zanshang/zsmain.dart';
import 'package:FreeTime/viewpage/widgets/heart/love.dart';

import '../export.dart';
import '../viewpage/about/amain.dart';
import '../viewpage/widgets/demo/t1.dart';
import '../viewpage/widgets/notes/note.dart';

class MyListViews extends StatelessWidget {
  const MyListViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        if (index == 0) {
          return ListTile(
            title: Text('   搜索(开发中...)'),
            trailing: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(horizontal: 70.0),
            onTap: () {
              //    createNewWindow(ClockPage());

              // windowManager.startDragging();
              // Navigate to ViewPager1 page
// Navigator.push(context, MaterialPageRoute(builder:
//  (context) => SettingsPage()));
            },
          );
        } else if (index == 1) {
          return ListTile(
            title: Text('   设置'),
            trailing: Icon(Icons.favorite),
            contentPadding: EdgeInsets.symmetric(horizontal: 70.0),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPager2()));
            },
          );
        } else if (index == 2) {
          return ListTile(
            title: Text('   调试'),
            trailing: Icon(Icons.font_download),
            contentPadding: EdgeInsets.symmetric(horizontal: 70.0),
            onTap: () {
              // Navigate to ViewPager3 page
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => zsmPage()));
            },
          );
        } else if (index == 3) {
          return ListTile(
            title: Text('   赞助'),
            trailing: Icon(Icons.font_download),
            contentPadding: EdgeInsets.symmetric(horizontal: 70.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  //builder: (context) => ClockWidget(DateTime.now()),
                  builder: (context) => sz(),
                ),
              );
            },
          );
        } else if (index == 4) {
          return ListTile(
            title: const Text('   实验室'),
            trailing: const Icon(Icons.font_download),
            contentPadding: const EdgeInsets.symmetric(horizontal: 70.0),
            onTap: () {
              // Navigate to ViewPager3 page
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => devpage()));
            },
          );
        } else if (index == 5) {
          return ListTile(
            title: Text('   退出'),
            trailing: Icon(Icons.font_download),
            contentPadding: EdgeInsets.symmetric(horizontal: 70.0),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("请保存后点击 \"i\" 预览 "),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          );
        } else if (index == 6) {
          return ListTile(
            title: Text('   关于'),
            trailing: Icon(Icons.font_download),
            contentPadding: EdgeInsets.symmetric(horizontal: 70.0),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => aboutPage()));

              //   ScaffoldMessenger.of(context).showSnackBar(
              // const  SnackBar(
              //     content: Text("请保存后点击 \"i\" 预览 "),
              //     duration:  Duration(seconds: 1),
              //   ),
              // );
              //Navigator.push(context, MaterialPageRoute(builder: (context) =>
              //TimerBasic(format:CountDownTimerFormat.daysHoursMinutesSeconds,)));
              // Navigator.of(context).pop();
              //Navigator.push(context, MaterialPageRoute(builder: (context) =>
              //AnniversaryPages(item:item)));
            },
          );
        } else if (index == 7) {
          return ListTile(
            title: Text('Language '),
            trailing: Icon(Icons.font_download),
            contentPadding: EdgeInsets.symmetric(horizontal: 70.0),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoveAnimationPage(),
                  ));
            },
          );
        } else if (index == 8) {
          return ListTile(
            title: Text('Freetime  '),
            trailing: Icon(Icons.font_download),
            contentPadding: EdgeInsets.symmetric(horizontal: 70.0),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyInputPage()));
            },
          );
        } else {
          return Container(
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, // 设置线条的颜色
                width: 1, // 设置线条的宽度
              ),
              borderRadius: BorderRadius.circular(10), // 设置卡片的圆角半径
            ),
            child: Card(
              elevation: 0, // 设置卡片的阴影
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // 设置卡片的圆角半径
              ),
              child: Container(
                //  width: 10,

                width: MediaQuery.of(context).size.width / 2, // 设置卡片宽度为父组件宽度的一半
                padding: EdgeInsets.all(10), // 设置卡片内部的边距
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // 将文本和图片水平居中对齐
                  children: [
                    Image.asset(
                      'lib/assets/888.png', // 替换为您的图片路径
                      width: 24, // 设置图片的宽度
                      height: 24, // 设置图片的高度
                    ),
                    SizedBox(width: 8), // 添加一个间距
                    Text(
                      "更多功能开发中...",
                      style: TextStyle(fontSize: 16), // 设置文本的样式
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
