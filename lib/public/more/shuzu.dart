import 'package:flutter/material.dart';

class CheckboxListPage extends StatefulWidget {
  @override
  _CheckboxListPageState createState() => _CheckboxListPageState();
}

class _CheckboxListPageState extends State<CheckboxListPage> {
  List<String> list1 = ['a1', 'b2', 'c3', '4d', '4e', '5f', '6g', '7h', '8h'];
  List<String> list1Titles = ['落雪', '谷物', '起伏', '快乐', '在途', '祈福'];
  
  Map<String, String> list2 = {
  'aa': '完整支持',
  'be': '支持',
  'cr': '不完整体验',
  'dd': '适配中',
  'es': '开发中',
  'fs': '暂不支持',
  'ha': '空白',
};
  String selectedValue = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox List'),
      ),
      body: ListView.builder(
        itemCount: list1.length,
        itemBuilder: (context, index) {
          return
        
           CheckboxListTile(
            title: Text('${list1[2]} ${list1Titles[1]}'),
            subtitle: Text('${list2[1]} ${list2[2]}'),
            value: selectedValue == list1[index],
            onChanged: (value) {
              setState(() {
                selectedValue = list1[index];
              });
            },
          );
            
        },
      ),
    );
  }
}
