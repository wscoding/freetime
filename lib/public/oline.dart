import '../export.dart';
import 'package:http/http.dart' as http;
class MySubPageon extends StatefulWidget {
  @override
  _MySubPageState createState() => _MySubPageState();
}

class _MySubPageState extends State<MySubPageon> {
  List<Map<String, dynamic>> _jsonData = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
 final response = await http.get(Uri.parse('http://zt.3g.gs/app/free/online.json'));

if (response.statusCode == 200) {
  final contentType = response.headers['content-type'];
  if (contentType != null && contentType.contains('application/json')) {
    final data = json.decode(response.body) as List<dynamic>;
    setState(() {
      _jsonData = data.cast<Map<String, dynamic>>();
    });
  } else {
    final bytes = response.bodyBytes;
    final data = utf8.decode(bytes);
    final jsonDecoded = json.decode(data) as List<dynamic>;
    setState(() {
      _jsonData = jsonDecoded.cast<Map<String, dynamic>>();
    });
  }
} else {
  throw Exception('Failed to load data');
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Sub Page'),
      ),
      body: _jsonData.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _buildListView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: _jsonData.length,
      itemBuilder: (context, index) {
        final item = _jsonData[index];
        final title = item['title'] ?? item['content'];
        final subtitle = item['randomString'];
        return ListTile(
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
                icon: Icon(Icons.arrow_forward),
                onPressed: () => _navigateToPage(item),
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () => _shareItem(item),
              ),
              IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () => _showItemInfo(item),
              ),
            ],
          ),
        );
      },
    );
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
        _fetchData();
        break;
      case 1:
        _importData();
        break;
    }
  }

  Future<void> _importData() async {
    final clipboardData = await Clipboard.getData('text/plain');
    if (clipboardData != null) {
      final jsonString = clipboardData.text;
      try {
        final data = json.decode(jsonString!) as List<dynamic>;
        final jsonData = data.cast<Map<String, dynamic>>();
        setState(() {
          _jsonData = jsonData;
        });
        _saveData(jsonData);
      } catch (e) {
        print('Failed to parse JSON data: $e');
      }
    }
  }

  Future<void> _deleteItem(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_jsonData[index]['id']);
    setState(() {
      _jsonData.removeAt(index);
    });
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
        final index = _jsonData.indexWhere((e) => e['id'] == result['id']);
        if (index != -1) {
          _jsonData[index] = result;
        } else {
          _jsonData.add(result);
        }
      });
    }
  }


  Future<void> _shareItem(Map<String, dynamic> item) async {
    final jsonString = json.encode(item);
    
    await Clipboard.setData(ClipboardData(text: jsonString));
    print('JSON data copied to clipboard: $jsonString');
  }

  Future<void> _showItemInfo(Map<String, dynamic> item) async {
    final id = item['id'];
    final title = item['title'] ?? '';
    final content = item['content'] ?? '';
    final message = 'ID: $id\nTitle: $title\nContent: $content';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Item Info'),
        content: Text(message),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Future<void> _saveData(List<Map<String, dynamic>> jsonData) async {
    final prefs = await SharedPreferences.getInstance();
    for (final item in jsonData) {
      await prefs.setString(item['id'], json.encode(item));
    }
  }
}