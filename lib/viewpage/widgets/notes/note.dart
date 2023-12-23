import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyInputPage extends StatefulWidget {
  @override
  _MyInputPageState createState() => _MyInputPageState();
}

class _MyInputPageState extends State<MyInputPage> {
  FocusNode _focusNode = FocusNode();
  TextEditingController _textController = TextEditingController();
  String _lastUpdatedTime = '';
  String _savedTime = '';
  Timer? _timer;
  String _searchText = '';
  bool _isAutoWrapEnabled = true;

  int _charCount = 0;
  int _lineCount = 0;
  String _currentTime = '';


  @override
  void initState() {
    super.initState();
    // 初始化时间戳
    _updateTime();
        _loadSavedTime();

  }

  void _updateTime() {
    setState(() {
      _lastUpdatedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    });
  }

  void _clearAll() {
    _textController.clear();
    setState(() {
      _lineCount = 0;
      _charCount = 0;
    });
  }

  void _deleteAll() {
    final text = _textController.text;
    if (text.isNotEmpty) {
      _textController.text = text.substring(0, text.length - 1);
    }
  }

  void _copyAll() {
    final text = _textController.text;
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('已复制到剪贴板'),
      duration: Duration(seconds: 1),
    ));
  }




  Future<void> _saveText() async {
    // 保存文本并记录保存时间
    final now = DateTime.now();
    final savedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    _savedTime = '保存于 ${_formatDuration(now.difference(DateTime.now()))}前';
    setState(() {});
    // 保存时间到 SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('savedTime', _savedTime);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('已保存'),
      duration: Duration(seconds: 1),
    ));
  }

  Future<void> _loadSavedTime() async {
    // 加载时间从 SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final savedTime = prefs.getString('savedTime');
    if (savedTime != null) {
      setState(() {
        _savedTime = savedTime;
      });
    }
  }

  String _formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return '${duration.inDays}天';
    } else if (duration.inHours > 0) {
      return '${duration.inHours}小时';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes}分钟';
    } else {
      return '${duration.inSeconds}秒';
    }
  }



  void _handleTextChange() {
    int numLines = _textController.text.split('\n').length;
    setState(() {
      _lineCount = numLines;
                 _charCount =  _textController.text.length;
                    _lineCount = '\n'.allMatches( _textController.text).length + 1;
                    _currentTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(
                      DateTime.now());
 
    });
  }



  void _searchTextInInput() {
    final inputText = _textController.text;
    final searchText = _searchText.trim();
    if (searchText.isNotEmpty && inputText.isNotEmpty) {
      final markedText = inputText.replaceAll(searchText, '[[$searchText]]');
      _textController.value = TextEditingValue(
        text: markedText,
        selection: TextSelection.collapsed(offset: markedText.length),
      );
    }
  }



  void _toggleAutoWrap() {
    setState(() {
      _isAutoWrapEnabled = !_isAutoWrapEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_focusNode);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('输入页面'),
        ),
        body: Column(
          children: [
            // 显示一个输入框
            Expanded(
              child: TextField(
                controller: _textController,
                focusNode: _focusNode,
                keyboardType: TextInputType.multiline,
                maxLines: _isAutoWrapEnabled ? null : 1,
                onChanged: (_) => _handleTextChange(),
                decoration: InputDecoration(
                  hintText: '请输入文本',
                  labelText: '输入文本',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text( '保存于 ${_formatDuration(DateTime.now().difference(DateTime.now()))}前'),
            SizedBox(height: 16),
            Text('最后更新时间：$_lastUpdatedTime'),
       

        Text('Characters: $_charCount    Lines: $_lineCount'),
            Text('Last update: $_currentTime'),
            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,

              children:  <Widget>[
                Expanded(
                  child: TextField(
                    onChanged: (text) {
                      _searchText = text;

        setState(() {
                    _charCount = text.length;
                    _lineCount = '\n'.allMatches(text).length + 1;
                    _currentTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
                  });

                    },
                    decoration: InputDecoration(
                      hintText: '搜索文本',
                      labelText: '搜索',
                      border: OutlineInputBorder(),
                    ),
                    
                  ),
                  
                ),
                
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _searchTextInInput,
                  child: Text('搜索'),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: _clearAll,
                icon: Icon(Icons.clear_all),
                tooltip: '清空',
              ),
              IconButton(
                onPressed: _deleteAll,
                icon: Icon(Icons.backspace),
                tooltip: '将文本删除',
              ),
              IconButton(
                onPressed: _copyAll,
                icon: Icon(Icons.copy),
                tooltip: '复制到剪贴板',
              ),
              IconButton(
                onPressed: _toggleAutoWrap,
                icon: Icon(Icons.wrap_text),
                tooltip: '自动换行',
                color: _isAutoWrapEnabled ? Theme.of(context).primaryColor : null,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _saveText();
            _timer?.cancel();
            _timer = Timer(Duration(seconds: 5), () {
              setState(() {
                _savedTime = '';
              });
            });
          },
          child: Icon(Icons.save),
          tooltip: '保存',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    _timer?.cancel();
    super.dispose();
  }
}