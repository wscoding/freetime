import '../export.dart';


class PasswordPage extends StatefulWidget {
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _secretController = TextEditingController();
  bool _passwordValid = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _secretController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          leading: IconButton(
    icon: Icon(Icons.arrow_back),
    color: Colors.black,
    onPressed: () => Navigator.of(context).pop(),
  ),
          backgroundColor: Colors.white,
        title:const Text('发布我的小部件', 
        style: TextStyle(color: Colors.black),
         // 设置标题颜色为黑色
         ),
         // systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
       const     Text(
              '管理员密码 * (仓库密钥) ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: '请输入6-12位密码',
                errorText: _passwordValid ? null : '密码格式不正确',
              ),
            ),
            SizedBox(height: 8),
     const       Text(
              '6-12位字符，可包含字母、数字和特殊字符',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
           const SizedBox(height: 8),
Row(
  children: [


                   Expanded(
                  child: Column(
                    children: [
                      const   Text(
              '免审核口令',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
       const     SizedBox(height: 8),
            TextField(
              controller: _secretController,
              decoration: const InputDecoration(
                hintText: '请输入6-12位口令（选填）',
              ),
            ),
         const   SizedBox(height: 8),
         const   Text(
              '6-12位字符，可包含字母、数字和特殊字符',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            )

                  ,
                    ],
                  ),
                  
                  ),

                   Expanded(
                  child: 
                  Column(
                    children: [
const   Text(
              '备注（选填）',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _secretController,
              decoration: const InputDecoration(
                hintText: '6-12位字符，可包含字母、数字和特殊字符',
              ),
            ),
    const        SizedBox(height: 8),
         const   Text(
              '第三方开发者可在此处填写作者版权&内容信息',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            )

                  ,
                    ],
                  )
                  
       ),
  ],
),


  
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child:const Text('提交'),
                    onPressed: () {
                      // 验证密码格式
                      setState(() {
                        _passwordValid = _validatePassword(_passwordController.text);
                      });
                      if (_passwordValid) {
                        _showSubmitDialog(context);
                      }
                    },
                  ),
                ),
          const      SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    child: Text('获取帮助'),
                    onPressed: () {
                      _launchUrl('http://www.iqg.cc');
                    },
                  ),
                ),
              ],
            ),
             const  SizedBox(height: 20),
           const  SingleChildScrollView(child:          Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      '      使用说明:',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 8),
    Text(
      '该功能仅供内部人员使用，管理员密码用于上传实例测试。',
      style: TextStyle(fontSize: 14),
    ),
    SizedBox(height: 8),
    Text(
      '密钥拥有者为开发者、测试人员、内部人员、团队人员和 Git 仓库管理员。',
      style: TextStyle(fontSize: 14),
    ),
    SizedBox(height: 8),
    Text(
      '密钥基础权限包括编辑主页在线小部件、上传或删除小部件。',
      style: TextStyle(fontSize: 14),
    ),
    SizedBox(height: 8),
    Text(
      '管理员密码为团队成员的 Git 仓库初始 Key 值。若遗忘或丢失，请前往仓库重新生成。',
      style: TextStyle(fontSize: 14),
    ),
    SizedBox(height: 8),
    Text(
      '免审口令为各位参与开发的主页名称。提交时输入该口令可直接在主页显示小部件。',
      style: TextStyle(fontSize: 14),
    ),
    SizedBox(height: 8),
    Text(
      '使用口令可节省在后台的操作时间和步骤。',
      style: TextStyle(fontSize: 14),
    ),
    SizedBox(height: 16),
    Text(
      '该项目暂时处于内测期间，暂不支持用户上传小部件。',
      style: TextStyle(fontSize: 14, color: Colors.red),
    ),
  ],
),),
  


          ],
        ),
      ),
    );
  }

  bool _validatePassword(String password) {
    return RegExp(r'^[a-zA-Z0-9]{6,12}$').hasMatch(password);
  }

  Future<void> _showSubmitDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return  AlertDialog(
          title:const Text('密码校验失败'),
          content:const Text('暂不支持普通用户提交!'),
          actions: <Widget>[
            TextButton(
              child:const Text('确定'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),


          ],
        );
      },
    );
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}