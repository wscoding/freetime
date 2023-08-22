

import '../export.dart';
import 'package:http/http.dart' as http;

class MySubPageons extends StatefulWidget {
  const MySubPageons({Key? key}) : super(key: key);

  @override
  _MySubPageState createState() => _MySubPageState();
}

class _MySubPageState extends State<MySubPageons> {
  List<dynamic> _data = [];
  bool _loading = true;


Future<void> _importDataFromClipboard() async {
  final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
  if (clipboardData == null || clipboardData.text == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Failed to import data from clipboard.'),
      ),
    );
    return;
  }
  try {
    final data = jsonDecode(clipboardData.text!);
    setState(() {
      _data = data;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', clipboardData.text!);
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Failed to decode JSON data from clipboard.'),
      ),
    );
  }
}
  Future<void> _deleteItem(int index) async {
    setState(() {
      _data.removeAt(index);
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(_data));
  }

  Future<void> _showItemDetails(int index) async {
    final item = _data[index];
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ItemDetailsPage(item: item),
      ),
    );
  }

  Future<void> _copyItem(int index) async {
    final item = _data[index];
    // final clipboardData =
    //     'ID: ${item['id']}\nTitle: ${item['title']}\nContent: ${item['content']}';
    final clipboardData ='[' + jsonEncode(item) + ']';
await Clipboard.setData(ClipboardData(
  text: clipboardData,
));
    await Clipboard.setData(ClipboardData(text: clipboardData));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item copied to clipboard.'),
      ),
    );
  }

  Future<void> _navigateToPage(Map<String, dynamic> item) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPage(item)),
    );
    if (result != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(result['id'], json.encode(result));
      setState(() {
        final index = _data.indexWhere((e) => e['id'] == result['id']);
        if (index != -1) {
          _data[index] = result;
        } else {
          _data.add(result);
        }
      });
    }
  }

  Future<void> _loadData() async {
    setState(() {
      _loading = true;
    });
final dio = Dio(BaseOptions(
  responseType: ResponseType.bytes,
  headers: {'Accept-Encoding': 'gzip, deflate'},
  contentType: 'application/x-www-form-urlencoded; charset=utf-8',
  validateStatus: (status) {
    return status! < 500;
  },
));

try {
  final response = await dio.get('http://zt.3g.gs/app/free/online.json');
  if (response.statusCode == 200) {
    final jsonString = utf8.decode(response.data);
    final data = jsonDecode(jsonString);
    setState(() {
      _data = data;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonString);
  } else {
    final prefs = await SharedPreferences.getInstance();
    final savedData = prefs.getString('data');
    if (savedData != null) {
      setState(() {
        _data = jsonDecode(savedData);
      });
    }
  }
} catch (e) {
  final prefs = await SharedPreferences.getInstance();
  final savedData = prefs.getString('data');
  if (savedData != null) {
      _data = jsonDecode(savedData);
    // setState(() {
    
    // });
  }
}
    // setState(() {
    
    // });
      _loading = false;
print('End loading data at ${DateTime.now()} with status ${_loading ? "loading" : "not loading"}');
  }



Future<void> loaditemData(int index) async {
  setState(() {
    _loading = true;
  });
  try {
    final response = await http.get(Uri.parse('http://zt.3g.gs/app/free/online.json'));
    if (response.statusCode == 200) {
            final bytes = response.bodyBytes;
      final jsonString = utf8.decode(bytes);


      final data = jsonDecode(jsonString);
      setState(() {
        _data = data;
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('data', response.body);
      final item = Item.fromJson(data[index]);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditItemPage(item: item),
        ),
      );
    } else {
      final prefs = await SharedPreferences.getInstance();
      final savedData = prefs.getString('data');
      if (savedData != null) {
        setState(() {
          _data = jsonDecode(savedData);
        });
      }
    }
  } catch (e) {
    final prefs = await SharedPreferences.getInstance();
    final savedData = prefs.getString('data');
    if (savedData != null) {
      setState(() {
        _data = jsonDecode(savedData);
      });
    }
  }
  setState(() {
    _loading = false;
  });
    print('loaditemData  End loading data at ${DateTime.now()} with status ${_loading ? "loading" : "not loading"}');
}

  Future<void> _editItem(int index) async {
    final item = _data[index];
    final editedItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditItemPages(item: item),
      ),
    );
    if (editedItem != null) {
      setState(() {
        _data[index] = editedItem;
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('data', jsonEncode(_data));
    }
  }

  Future<void> _markItemAsEdited(int index) async {
    setState(() {
      _data[index]['edited'] = true;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(_data));
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.refresh),
          label: 'Reload',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.file_download),
          label: 'Import',
        ),
      ],
    onTap: _handleBottomNavTap,
    );
  }
  void _handleBottomNavTap(int index) {
    switch (index) {
      case 0:
       _loadData();
          
        break;
      case 1:
          _importDataFromClipboard();
        break;
    }
  }


  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Colors.white, // 设置背景颜色为白色
  title: Text(
    '推荐小部件(联网)',
    style: TextStyle(color: Colors.black), // 设置标题颜色为黑色
  ),
),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                final item = _data[index];
                final title = item['title'] ?? item['content'];
                final subtitle = item['randomString'];
                final type = item['type'];
                final color = Color(item['color']);
                final edited = item['edited']?? false;
                return _data.isEmpty
          ? Center(
              child: Text('列表为空'),
            )
          :
                 ListTile(
                  leading: CircleAvatar(
                    backgroundColor: color,
                    child: Text(
                      type,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(title),
                  subtitle: Text(subtitle),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteItem(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.copy),
                        onPressed: () => _copyItem(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.details),
                        onPressed: () => _showItemDetails(index),
                      ),
                  IconButton(
  icon: Icon(Icons.add),
   onPressed: () {

  loaditemData(index); // 将当前列表项的索引位置传递给 loaditemData 方法
        },
),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _editItem(index),
                      ),
                      edited
                          ? GestureDetector(
  onTap: () {
    // 要执行的操作
    _navigateToPage(item);
  },
  child: Icon(
    Icons.edit_outlined,
    color: Colors.green,
  ),
)
                          : SizedBox(),
                    ],
                  ),
                  onTap: () => _markItemAsEdited(index),
                );
              },
            ),
bottomNavigationBar: Stack(
  children: [
    _buildBottomNavigationBar(),
    // Positioned(
    //   bottom: 0,
    //   left: 0,
    //   right: 0,
    //   child: BottomAppBar(
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         IconButton(
    //           icon: Icon(Icons.refresh),
    //           onPressed: _loadData,
    //         ),
    //         IconButton(
    //           icon: Icon(Icons.paste),
    //           onPressed: _importDataFromClipboard,
    //         ),
    //       ],
    //     ),
    //   ),
    // ),
  ],
),
    );
  }
}

class ItemDetailsPage extends StatelessWidget {
  final dynamic item;

  const ItemDetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
      ),
      body: Center(
        child: Text(item.toString()),
      ),
    );
  }
}

class EditItemPages extends StatefulWidget {
  final dynamic item;

  const EditItemPages({Key? key, required this.item}) : super(key: key);

  @override
  _EditItemPageState createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPages> {
  TextEditingController? _titleController;
  TextEditingController? _contentController;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.item['title']);
    _contentController =
        TextEditingController(text: widget.item['content']);
  }

  @override
  void dispose() {
    _titleController?.dispose();
    _contentController?.dispose();
    
    super.dispose();
  }

  Future<void> _saveChanges() async {
    setState(() {
      _saving = true;
    });
    final editedItem = {
      ...widget.item,
      'title': _titleController!.text,
      'content': _contentController!.text,
    };
    Navigator.of(context).pop(editedItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Item'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _saving ? null : _saveChanges,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: 'Content',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
            ),
          ],
        ),
      ),
    );
  }
}