

import '../export.dart';

class TypeSelectionPage extends StatefulWidget {
  final String selectedOption; // 定义 selectedOption 成员变量

  const TypeSelectionPage({Key? key, required this.selectedOption}) : super(key: key);


  @override
  _TypeSelectionPageState createState() => _TypeSelectionPageState();
}

class _TypeSelectionPageState extends State<TypeSelectionPage> {


  List<Map<String, dynamic>> _filteredOptions = [];

  String _selectedOptionTitle = "";

  @override
  void initState() {
    _filteredOptions = options;
  _selectedOptionTitle = widget.selectedOption ?? _filteredOptions[0]["title"];  super.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: TextField(
  onChanged: (value) {
    setState(() {
      _filteredOptions = options.where((option) =>
          option["title"].contains(value) ||
          option["value"].contains(value) ||
          option["description"].contains(value)).toList();
    });
  },
  decoration: InputDecoration(
    hintText: "搜索 (标题, 描述, value)",
    border: InputBorder.none,
  ),
),
        actions: [
          IconButton(
            icon: Icon(Icons.developer_mode),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("如何开发小部件"),
 content: Text("暂时不支持用户开发\n下面列表中写着\'开发中\'的小部件都会逐一开发的\n不支持的小部件暂时没有加入清单\n请大家耐心等待开发 "),
                    actions: [
                      TextButton(
                        child: Text("取消"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text("确定"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body:
 


    ListView.builder(
      itemCount: _filteredOptions.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildCard(
          context,
          _filteredOptions[index]["title"],
          _filteredOptions[index]["description"],
          _filteredOptions[index]["value"],
          _filteredOptions[index]["icon"],



          
        );
      },
    ),



    );
  }

Widget _buildCard(
  BuildContext context, 
  String title, 
  String description,
  String value, 
  IconData icon) {
  
  bool isDisabled = title.endsWith("(开发中...)"); // 检查选项是否处于 "开发中" 状态

  return Card(
    child: InkWell(
      onTap: isDisabled ? null : () { // 如果选项处于 "开发中" 状态，则禁用 onTap 回调
        setState(() {
          _selectedOptionTitle = value;
        });
        Navigator.of(context).pop({
          "title": title,
          "value": value,
        });
      },
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (_selectedOptionTitle == value) Icon(Icons.check),
            if (isDisabled) Icon(Icons.lock), // 如果选项处于 "开发中" 状态，则显示一个不可点击的锁图标
          ],
        ),
      ),
    ),
  );
}
}

