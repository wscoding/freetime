import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MyCustomPage extends StatefulWidget {
  @override
  _MyCustomPageState createState() => _MyCustomPageState();
}

class _MyCustomPageState extends State<MyCustomPage> {
  TextEditingController _controller = TextEditingController();
  int _charCount = 0;
  int _lineCount = 0;
  String _currentTime = '';
  String _lastUpdatedTime = '';
  int _numLines = 0;
  Timer? _timer;
  String _savedTime = '';
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // 初始化时间戳
    _updateTime();
  }

  void _updateTime() {
    setState(() {
      _lastUpdatedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    });
  }

  void _clearAll() {
    _controller.clear();
    setState(() {
      _numLines = 0;
    });
  }

  void _deleteAll() {
    final text = _controller.text;
    if (text.isNotEmpty) {
      _controller.text = text.substring(0, text.length - 1);
    }
  }

  void _copyAll() {
    final text = _controller.text;
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('已复制到剪贴板'),
      duration: Duration(seconds: 1),
    ));
  }

  void _saveText() {
    // 保存文本并记录保存时间
    final now = DateTime.now();
    final savedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    _savedTime = '保存于 ${_formatDuration(now.difference(DateTime.now()))}前';
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('已保存'),
      duration: Duration(seconds: 1),
    ));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Custom Page')),
      body: 
         GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: (text) {
                  setState(() {
                    _charCount = text.length;
                    _lineCount = '\n'.allMatches(text).length + 1;
                    _currentTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(
                      DateTime.now());
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Tap anywhere to start typing'),
              ),
            ),
            Text('Characters: $_charCount    Lines: $_lineCount'),
            Text('Last update: $_currentTime'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller.clear();
                      _charCount = 0;
                      _lineCount = 0;
                      _currentTime = '';
                    });
                  },
                  child: Text('Clear'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: _controller.text));
                  },
                  child: Text('Copy'),
                ),




              ],
              
            ),
  
       
          
    
          
          ],


        ),

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


    );
  }



    @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _timer?.cancel();
    super.dispose();
  }
}