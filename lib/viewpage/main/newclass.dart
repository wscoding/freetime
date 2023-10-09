 import 'package:FreeTime/viewpage/widgets/guodu.dart';

import '../../export.dart';


class ItemListPage extends StatefulWidget {
  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  List<Item> _items = [];
  String windowSize = 'Unknown';

  Future<List<Item>> _loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson = prefs.getString('items');
    if (itemsJson != null) {
      final itemsList = (jsonDecode(itemsJson) as List<dynamic>)
          .map((item) => Item.fromMap(item))
          .toList();
         
      return itemsList;
    } else {
      return [];
    }
  }







  Future<void> _saveItems(List<Item> items) async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson = jsonEncode(items.map((item) => item.toMap()).toList());


    await prefs.setString('items', itemsJson);
     // print(updatedItemsJson);

  }

  Future<void> _printItems() async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson = prefs.getString('items');
    if (itemsJson != null) {
      final itemsList = (jsonDecode(itemsJson) as List<dynamic>)
          .map((item) => Item.fromMap(item))
          .toList();
      final jsonData = json.encode(itemsList);
      print(jsonData);
      print('dd');
            await Clipboard.setData(ClipboardData(text: jsonData));

    }
  }

  Future<void> _addItem() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );
    if (selectedDate != null) {
      final newItem = Item(
        id: DateTime.now().toString(),
        title: '',
        content: '',
        type: 'daojishi',
        date: selectedDate,
        color: Colors.blue,
        value: 50,
        height:50,
        width:50, 
        randomString: "un404",
        textsize:15,
        textheme: "ws",
values:"1",
isapp:false,
selectedValuezv:'10',
      );
      final updatedItems = [..._items, newItem];
      await _saveItems(updatedItems);
      setState(() {
        _items = updatedItems;
            
      });
      _editItem(newItem);
    }
  }

Future<void> _editItem(Item item) async {
  final editedItem = await Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => EditItemPage(
      item: item,
    ),
  ));

  if (editedItem != null) {
    // 获取被编辑的项目在 _items 列表中的索引
    final index = _items.indexWhere((i) => i.id == item.id);
    
    // 创建一个新的 _items 列表，该列表包含了被编辑的项目
    final updatedItems = [..._items];
    updatedItems[index] = editedItem;

    // 更新 shared_preferences 中的数据
    await _saveItems(updatedItems);
    
    // 更新 _items 列表，以便反映更改
    setState(() {
      _items = updatedItems;
     // printItems();
    });
  }
}


  Future<void> _confirmDelete(Item item) async {
    final shouldDelete = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('确认删除？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('删除'),
          ),
        ],
      ),
    );

    if (shouldDelete == true) {
      final updatedItems = _items.where((i) => i.id != item.id).toList();
      await _saveItems(updatedItems);
      setState(() {
        _items = updatedItems;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadItems().then((items) {
      setState(() {
        _items = items;
       
      });
    });
  
  }

void navigateAndZoom(BuildContext context,
  Future<dynamic> Function() navigateFunction, {required Item item}) {
  navigateFunction().then((result) async {
    if (result == true) {
      if (Platform.isWindows || Platform.isMacOS) {
        WidgetsFlutterBinding.ensureInitialized();
        await windowManager.ensureInitialized();
        WindowOptions windowOptions = WindowOptions(
          size: Size(600, 650),//宽高
          minimumSize: Size(item.width.toDouble()*2, item.height.toDouble()*2),
          maximumSize: Size(800, 800),
          center: true,
          backgroundColor: Colors.transparent,
          skipTaskbar: false,
          titleBarStyle: TitleBarStyle.normal,
        );
        windowManager.waitUntilReadyToShow(windowOptions, () async {
          await windowManager.show();
          await windowManager.focus();
          print(item.width.toDouble()*2);
            print(item.height.toDouble()*2);
        });
      }
    }
  });
}



  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar:AppBar(
  backgroundColor: Colors.white, // 设置背景颜色为白色
  title: Text(
    '项目列表 (本地)',
    style: TextStyle(color: Colors.black), // 设置标题颜色为黑色
  ),
),
     body: _items.isEmpty
          ? Center(
              child: Text('列表为空'),
            )
          : ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];

          return  GestureDetector(
              onPanStart: (e) {
            windowManager.startDragging();
          },
          child: Dismissible(
            key: Key(item.id),
            onDismissed: (direction) => _confirmDelete(item),
            background: Container(
              color: Colors.red,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child:Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            child:SizedBox( height: 60,  
             child:       
                 ListTile(
              title: Text(item.title),
              subtitle: Text(item.randomString),
             // trailing:Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(item.date)),

 trailing: SingleChildScrollView(   child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        icon: Icon(Icons.edit),
  tooltip: '编辑',
        onPressed: () => _editItem(item),
      ),
      IconButton(
        icon: Icon(Icons.delete),
         tooltip: '删除',
        onPressed: () => _confirmDelete(item),
      ),
      
      IconButton(
        icon: Icon(Icons.info),
        tooltip: '预览',
        onPressed: () {
          Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ItemDisplayPage(item: item)),
          
          );
        },
      ),

          // Navigator.push(
    //           context,
    //          // MaterialPageRoute(builder: (context) => ParentPage(item: item,)),
    //          MaterialPageRoute(builder: (context) => ImagePages(item: item,)),
    //         );

      IconButton(
        icon: Icon(Icons.textsms),
         tooltip: '展示',
        onPressed: () {
navigateAndZoom(context, () => Navigator.push(context, 
MaterialPageRoute(builder: (context) => MySubPage(item: item))), item: item);  

        },
      ),


        IconButton(
                   tooltip: 'widgets',

        icon: Icon(Icons.apps),
   onPressed: () async {

              
navigateAndZoom(context, () => Navigator.push(context, 
MaterialPageRoute(builder: (context) => MySubPage(item: item))), item: item);  

      // await DesktopWindow.setWindowSize(
      //   Size( item.width.toDouble()-50, item.height.toDouble()-50));
                         // Size( size.height - 50 , size.height - 50));
                    
          },
      ),

IconButton(
           tooltip: 'Windows',

  icon: Icon(Icons.window),
  onPressed: () async {
  // 在返回到 _HomePageState 页面时，根据 result 的值更新页面缩放

if (item.type == 'a') {
  navigateAndZoom(context, () => Navigator.push(context,
   MaterialPageRoute(builder: (context) =>
   MyHomePagebak(item: item))), item: item);
} else if (item.type == 'b') {
  navigateAndZoom(context, () => Navigator.push(context,
   MaterialPageRoute(builder: (context) => EditItemPage(item: item))), item: item);
} else if (item.type == 'c') {
  Navigator.push(context, 
  MaterialPageRoute(builder: (context) => 
  EditItemPage(item: item)));
} else {
  Navigator.push(context, 
  MaterialPageRoute(builder: (context) =>
   EditItemPage(item: item)));
}
  },
),

//       IconButton(
//   icon: Icon(Icons.add),
//   onPressed: () async {

//       if (item.type == 'a') {
//         Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePages(item: item)));
//       } else if (item.type == 'b') {
//         Navigator.push(context, MaterialPageRoute(builder: (context) => EditItemPage(item: item)));
//       }
//   }

// ),
    ],
 ),),  

              leading: CircleAvatar(
                backgroundColor: item.color,
                child: Text(
                  item.type.substring(0, 1).toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () => _editItem(item),
            ) ,),
            
 

 ),

          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: Icon(Icons.add),
      ),
    );
  }
}