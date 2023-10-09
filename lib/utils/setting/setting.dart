import 'package:FreeTime/export.dart';
import 'package:FreeTime/viewpage/about/amain.dart';
import 'package:FreeTime/viewpage/about/license.dart';
import 'package:FreeTime/list.dart';




class SettingsPage extends StatefulWidget {

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _currentTipIndex = 0;


  void _changeTip() {
    setState(() {
      _currentTipIndex = (_currentTipIndex + 1) % tips.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10,),
 ElevatedButton(
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20), // 设置按钮的圆角半径
    ),
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // 设置按钮的内边距
    textStyle: TextStyle(fontSize: 16), // 设置按钮文本的样式
    primary: Colors.lightBlue, // 设置按钮的背景颜色为浅蓝色
    minimumSize: Size(MediaQuery.of(context).size.width / 2, 0), // 设置按钮宽度为父容器宽度的一半
  ),
  child: Text(tips[_currentTipIndex]),
  onPressed: _changeTip,
),


          ListTile(
            leading: Icon(Icons.person),
            title: Text('调试信息'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OtherPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('安全设置'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => oldtestSubPageon()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('通知设置'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => licensePage()),
              );
            },
          ),



          ListTile(
            leading: Icon(Icons.palette),
            title: Text('外观设置'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppearancePage()),
              );
            },

     

          ),

          ListTile(
            leading: Icon(Icons.language),
            title: Text('语言设置'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LanguagePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('删除数据'),
            onTap: () {
              // 处理退出登录的逻辑
            },
          ),
        ],
      ),
    );
  }
  

}

// 以下是每个选项对应的新页面的示例，您可以根据需要自定义每个页面的内容和布局





class AppearancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('外观设置'),
      ),
      body: Center(
        child: Text('外观设置页面'),
      ),
    );
  }
}





class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('语言设置'),
      ),
      body: Center(
        child: Text('语言设置页面'),
      ),
    );
  }
}