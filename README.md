# lingdong

A new Flutter project.

## Getting Started 

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

   column 报错解决
   SingleChildScrollView 包裹column
  
  flutter 弹窗
        ScaffoldMessenger.of(context).showSnackBar(
      const  SnackBar(
          content: Text("请保存后点击 \"i\" 预览 "),
          duration:  Duration(seconds: 1),
        ),
      );

  how use sp?  
import 'package:shared_preferences/shared_preferences.dart';

  void main() {
//获取共享首选项实例。  

  final SharedPreferences prefs = await SharedPreferences.getInstance();

 //存储用户名。

  prefs.setString('name', 'John Doe');

  //检索用户名。

  final String name = prefs.getString('name');

//打印用户名。
  print('The user's name is $name');
}


  简单捕获异常demo
 setState(() {
         try {
  // 可能会引发异常的代码
durations = int.parse(_textEditingController.text);
  throw Exception(durations);
} catch (e) {
  // 处理异常的代码
     // durations= 10;  
  print('捕获到异常：$e');
}
                  print('保存或更新值: $durations');
                  });
