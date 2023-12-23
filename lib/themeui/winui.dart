
 import '../export.dart';
import 'package:intl/intl.dart';


class ParentPage extends StatefulWidget {
  final Item item;
  const ParentPage({Key? key, required this.item}) : super(key: key);

  @override
  _ItemDisplayPageState createState() => _ItemDisplayPageState();
}

class _ItemDisplayPageState extends State<ParentPage> {
    
  late String _content;
  late int _value;
  late int _width;
  late int _height;
  late Color _color;
  late int _textsize;
  late String _title;
 late DateTime _date;



  @override
  void initState() {
    super.initState();
    _content = widget.item.content;
    _value = widget.item.value;
    _width = widget.item.width;
    _height = widget.item.height;
    _color = widget.item.color;
    _textsize = widget.item.textsize;
       _title = widget.item.title;
       _date = widget.item.date;


       
  }

  Future<void> _clearItems() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('items');
    Navigator.of(context).pop();
  }


//标题
  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
              onPanStart: (e) {
            windowManager.startDragging();
          },child:
    Scaffold(
      appBar: AppBar(
        title: Text('小部件预览'),
      ),
      body: Center(
        child: Container(
          width: _width.toDouble()*8,
          height: _height.toDouble()*8,
          color:Colors.black12,
          child: Center(
            child: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
       _title,
        style: TextStyle(fontSize: _textsize.toDouble()*0.5,   color:_color),
      ),

       // Text(
      //   '这是第三个文本框',
      //   style: TextStyle(fontSize: 20,   color:_color),
      // ),
  //    SizedBox(height: 16),
      Text(
        DateFormat('yyyy-MM-dd HH:mm:ss').format(_date),
        style: TextStyle(fontSize: _textsize.toDouble()*0.4,   color:_color),
      ),
      //SizedBox(height: 8),
  Text(_content,
              style: TextStyle(
                fontSize: _textsize.toDouble(),
                color:_color,              
              ),
            ),
    ],
  ),
),
            
      
          ),
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
               onPressed: ()  {


          },
            tooltip: '开发中...',
              heroTag: 'hero_1', 
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              // Do something
      //  Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) => ClockPage()),
          
      //     );
            },
            tooltip: '开发中...',
             heroTag: 'hero_2', 
            child: Icon(Icons.edit),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              // Do something
              _clearItems();
            },
            tooltip: '开发中...',
             heroTag: 'hero_3', 
            child: Icon(Icons.delete),
          ),
        ],
      ),
    
      
      ),

      
    );
  }
}