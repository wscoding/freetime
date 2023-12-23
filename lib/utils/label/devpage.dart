import 'package:FreeTime/export.dart';
import 'package:FreeTime/viewpage/about/amain.dart';
import 'package:FreeTime/viewpage/about/license.dart';
import 'package:FreeTime/list.dart';

class devpage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<devpage> {
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
          ListTile(
            leading: Icon(Icons.person),
            title: Text('图片调试'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImagePickerPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('轻动画'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoveAnimationPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('进度'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProgressPage()),
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
