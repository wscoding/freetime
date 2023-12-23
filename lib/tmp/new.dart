 import '../export.dart';

class newSubPages extends StatefulWidget {
  @override
  _MySubPageState createState() => _MySubPageState();
}

class _MySubPageState extends State<newSubPages> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String _type = 'a';
  double _size = 50.0;
  Color _color = Colors.blue;
  TimeOfDay _time = TimeOfDay.now();
  List<Map<String, dynamic>> _list = [];

  @override
  void initState() {
    super.initState();
    _loadList();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _loadList() async {
    final prefs = await SharedPreferences.getInstance();
    final listJson = prefs.getString('list');
    if (listJson != null) {
      final list = List<Map<String, dynamic>>.from(
          (json.decode(listJson) as List<dynamic>).cast<Map<String, dynamic>>());
      setState(() {
        _list = list;
      });
    }
  }

  Future<void> _saveList() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('list', json.encode(_list));
  }

  Future<void> _addToList() async {
    final prefs = await SharedPreferences.getInstance();
    final newItem = {
      'title': _titleController.text,
      'type': _type,
      'content': _contentController.text,
      'size': _size.round(),
      'color': _color.value,
      'time': _type == 'a' ? _time.toString() : null,
    };
    setState(() {
      _list.add(newItem);
    });
    await prefs.setString('list', json.encode(_list));
    _titleController.clear();
    _contentController.clear();
    _type = 'a';
    _size = 50.0;
    _color = Colors.blue;
    _time = TimeOfDay.now();
  }

  Future<void> _deleteFromList(int index) async {
    setState(() {
      _list.removeAt(index);
    });
    await _saveList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('子页面'),
      ),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildList() {
    if (_list.isEmpty) {
      return Center(
        child: Text('列表为空'),
      );
    } else {
      return ListView.builder(
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          final item = _list[index];
          return Dismissible(
            key: Key('item-$index'),
            onDismissed: (direction) {
              _deleteFromList(index);
            },
            child: ListTile(
              title: Text(item['title']),
              subtitle: Text(item['type']),
              onTap: () {
                _showEditDialog(item, index);
              },
            ),
          );
        },
      );
    }
  }

  Future<void> _showAddDialog() async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('添加项目'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: '标题',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入标题';
                      } else if (value.length > 50) {
                        return '标题不能超过50个字符';
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Text('类型：'),
                      DropdownButton<String>(
                        value: _type,
                        onChanged: (String? newValue) {
                          setState(() {
                            _type = newValue!;
                          });
                        },
                        items: <DropdownMenuItem<String>>[
                          DropdownMenuItem(
                            value: 'a',
                            child: Text('时间通知'),
                          ),
                          DropdownMenuItem(
                            value: 'b',
                            child: Text('时间1'),
                          ),
                          DropdownMenuItem(
                            value: 'c',
                            child: Text('时间通知2'),
                          ),
                          DropdownMenuItem(
                            value: 'd',
                            child: Text('时间通知3'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: _contentController,
                    decoration: InputDecoration(
                      labelText: '内容',
                    ),
                    validator: _validateContent,
                  ),
                  Row(
                    children: [
                      Text('大小：'),
                      SizedBox(
                        width: 100.0,
                        child: Slider(
                          value: _size,
                          min: 1.0,
                          max: 100.0,
                          divisions: 99,
                          label: _size.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _size = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('颜色：'),
                      SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: _showColorPicker,
                          style: ElevatedButton.styleFrom(
                            primary: _color,
                          ),
                          child: null,
                        ),
                      ),
                    ],
                  ),
                  if (_type == 'a')
                    Row(
                      children: [
                        Text('时间：'),
                        SizedBox(
                          width: 100.0,
                          child: ElevatedButton(
                            onPressed: _showTimePicker,
                            child: Text(_time.format(context)),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('取消'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addToList();
                  Navigator.pop(context);
                }
              },
              child: Text('添加'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showEditDialog(Map<String, dynamic> item, int index) async {
    _titleController.text = item['title'];
    _type = item['type'];
    _contentController.text = item['content'];
    _size = item['size'].toDouble();
    _color = Color(item['color']);
    if (_type == 'a') {
      _time = TimeOfDay(
        hour: int.parse(item['time'].split(':')[0]),
        minute: int.parse(item['time'].split(':')[1]),
      );
    }
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('编辑项目'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: '标题',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入标题';
                      } else if (value.length > 50) {
                        return '标题不能超过50个字符';
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Text('类型：'),
                      DropdownButton<String>(
                        value: _type,
                        onChanged: (String? newValue) {
                          setState(() {
                            _type = newValue!;
                          });
                        },
                        items: <DropdownMenuItem<String>>[
                          DropdownMenuItem(
                            value: 'a',
                            child: Text('时间通知'),
                          ),
                          DropdownMenuItem(
                            value: 'b',
                            child: Text('类型b'),
                          ),
                          DropdownMenuItem(
                            value: 'c',
                            child: Text('类型c'),
                          ),
                          DropdownMenuItem(
                            value: 'd',
                            child: Text('类型d'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: _contentController,
                    decoration: InputDecoration(
                      labelText: '内容',
                    ),
                    validator: _validateContent,
                  ),
                  Row(
                    children: [
                      Text('大小：'),
                      SizedBox(
                        width: 100.0,
                        child: Slider(
                          value: _size,
                          min: 1.0,
                          max: 100.0,
                          divisions: 99,
                          label: _size.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _size = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('颜色：'),
                      SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: _showColorPicker,
                          style: ElevatedButton.styleFrom(
                            primary: _color,
),
child: null,
),
),
],
),
if (_type == 'a')
Row(
children: [
Text('时间：'),
SizedBox(
width: 100.0,
child: ElevatedButton(
onPressed: _showTimePicker,
child: Text(_time.format(context)),
),
),
],
),
],
),
),
),
actions: <Widget>[
ElevatedButton(
onPressed: () {
Navigator.pop(context);
},
child: Text('取消'),
),
ElevatedButton(
onPressed: () {
if (_formKey.currentState!.validate()) {
final updatedItem = {
'title': _titleController.text,
'type': _type,
'content': _contentController.text,
'size': _size.round(),
'color': _color.value,
'time': _type == 'a' ? _time.toString() : null,
};
setState(() {
_list[index] = updatedItem;
});
_saveList();
Navigator.pop(context);
}
},
child: Text('保存'),
),
],
);
},
);
}

Future<void> _showColorPicker() async {
final Color? result = await showDialog<Color>(
context: context,
builder: (BuildContext context) {
return AlertDialog(
title: Text('选择颜色'),
content: SingleChildScrollView(
child: ColorPicker(
pickerColor: _color,
onColorChanged: (Color color) {
_color = color;
},
colorPickerWidth: 300.0,
pickerAreaHeightPercent: 0.7,
enableAlpha: false,
displayThumbColor: true,
showLabel: false,
),
),
actions: <Widget>[
ElevatedButton(
onPressed: () {
Navigator.pop(context);
},
child: Text('取消'),
),
ElevatedButton(
onPressed: () {
Navigator.pop(context, _color);
},
child: Text('确定'),
),
],
);
},
);
if (result != null) {
setState(() {
_color = result;
});
}
}

Future<void> _showTimePicker() async {
final TimeOfDay? result = await showTimePicker(
context: context,
initialTime: _time,
);
if (result != null) {
setState(() {
_time = result;
});
}
}

String? _validateContent(String? value) {
if (_type == 'a') {
return null;
} else if (value == null || value.isEmpty) {
return '请输入内容';
} else if (value.length > 500) {
return '内容不能超过500个字符';
}
return null;
}
}