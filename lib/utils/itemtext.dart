import '../export.dart';


class ItemDisplayPage extends StatefulWidget {
  final Item item;

  const ItemDisplayPage({Key? key, required this.item}) : super(key: key);

  @override
  _ItemDisplayPageState createState() => _ItemDisplayPageState();
}

class _ItemDisplayPageState extends State<ItemDisplayPage> {
  late String _content;
  late int _value;
  late int _width;
  late int _height;
  late Color _color;
  late int _textsize;

  @override
  void initState() {
    super.initState();
    _content = widget.item.content;
    _value = widget.item.value;
    _width = widget.item.width;
    _height = widget.item.height;
    _color = widget.item.color;
    _textsize = widget.item.textsize;
  }

  Future<void> _clearItems() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('items');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('小部件   预览'),
      ),
      body: Center(
        child: Container(
         width: _width.toDouble()*10,
         height: _height.toDouble()*10,
          color:Colors.black12,
          child: Center(
            child: Text(
              _content,
              style: TextStyle(
                fontSize: _textsize.toDouble(),
                color:_color,
               
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _clearItems,
        child: Icon(Icons.delete),
      ),
    );
  }
}