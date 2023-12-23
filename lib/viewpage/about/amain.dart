import 'package:flutter/material.dart';



class aboutPage extends StatelessWidget {
  void _showLicensePage(BuildContext context) {
    showLicensePage(
      context: context,
      applicationName: 'My App',
      applicationVersion: '1.0.0',
      applicationIcon: Icon(Icons.info),
      applicationLegalese: '版权所有 © 2023 Your Company',
    );
  }

  void _showPrivacyPolicy(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('隐私政策'),
          content: Text('这是隐私政策的内容。'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('关闭'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Page'),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                                SizedBox(height: 20),

                Icon(
                  Icons.info,
                  size: 100,
                  color: Colors.blue,
                ),
                SizedBox(height: 20),
                Text(
                  '版权信息',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '版权所有 © 2023 Your Company',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 30),
                Text(
                  '软件信息',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'App名称: My App',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '版本号: 1.0.0',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 30),
                Text(
                  '开发者信息',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '开发者: Your Name',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '联系方式: your@email.com',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    _showLicensePage(context);
                  },
                  child: Text('软件协议'),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () {
                    _showPrivacyPolicy(context);
                  },
                  child: Text('隐私政策'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Center(
            child: Text(
              '个性信息',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}