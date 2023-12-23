import  '../export.dart';
import 'package:intl/intl.dart';
class EditItemPage extends StatefulWidget {
  final Item item;
  
   EditItemPage({
    Key? key,
    required this.item,
  }) : super(key: key);


  @override
  _EditItemPageState createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
    String _selectedOptionTitle = '选择小部件的类型';

  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late String _type;
  late DateTime _date;
  late Color _color;
  late int _value;
  late int _width; // 新增宽状态变量
  late int _height; // 新增高状态变量
  late int  _textsize;
  late String textheme;  //theme
   late TextEditingController _values;
    // late String  _zv;
late String selectedValuezv ;
 bool isapps = false;
 //late String selectedValuezt;


  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.item.title);
    _contentController = TextEditingController(text: widget.item.content);
    _type = widget.item.type;
    _date = widget.item.date;
    _color = widget.item.color;
    _value = widget.item.value;
      _width = widget.item.width; // 初始化宽状态变量
    _height = widget.item.height; // 初始化高状态变量
    _textsize = widget.item.textsize; // 初始化高状态变量
      _values = TextEditingController(text: widget.item.values);
// _zv ='${_values.text}$selectedValue';
//编辑参数  _values 
selectedValuezv =  widget.item.selectedValuezv;
//所选参数
textheme = widget.item.textheme;
//textheme= selectedValuezt;
//主题
isapps = widget.item.isapp;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }



Future<void> saveItem(Item item) async {
  final prefs = await SharedPreferences.getInstance();
  final itemsJson = prefs.getString('items');
  final itemsList = itemsJson != null
      ? (jsonDecode(itemsJson) as List<dynamic>)
          .map((item) => Item.fromMap(item))
          .toList()
      : <Item>[];
  itemsList.add(item);
  final updatedItemsJson = jsonEncode(itemsList.map((item) => item.toMap()).toList());
  await prefs.setString('items', updatedItemsJson);
}



  Future<void> saveChanges( bool shouldPop) async {


          final prefs = await SharedPreferences.getInstance();

       final itemsJson = prefs.getString('items');
//final itemsJson = jsonEncode(items.map((item) => item.toMap()).toList());
      final itemsList = itemsJson != null
      ? (jsonDecode(itemsJson) as List<dynamic>)
          .map((item) => Item.fromMap(item))
          .toList()
      : <Item>[];
      
final now = DateTime.now();
final itemCount = itemsList.length;
final randomString =
 '${now.year}_${now.month}_${now.day}_${now.hour}_${now.minute}_${now.second}pure${itemCount + 1}';

    final updatedItem = Item(
      id: widget.item.id,
      title: _titleController.text,
      content: _contentController.text,
      type: _type,
      date: _date,
      color: _color,
      value: _value,
      width: _width, // 更新宽属性
      height: _height, 
      isapp:isapps,
      randomString: _type+randomString, // 更新高属性
textsize: _textsize, 
values:_values.text,
selectedValuezv:selectedValuezv,
textheme:textheme,
    );

  await saveItem(updatedItem);
    //Navigator.of(context).pop(updatedItem);
    


  if (shouldPop) {
    Navigator.of(context).pop(updatedItem); // 调用方法2
  } else {
 Navigator.of(context).pop(updatedItem); // 调用方法2

  }


  }




  Future<void> saveChs() async {

          final prefs = await SharedPreferences.getInstance();

       final itemsJson = prefs.getString('items');
//final itemsJson = jsonEncode(items.map((item) => item.toMap()).toList());
      final itemsList = itemsJson != null
      ? (jsonDecode(itemsJson) as List<dynamic>)
          .map((item) => Item.fromMap(item))
          .toList()
      : <Item>[];
      
final now = DateTime.now();
final itemCount = itemsList.length;
final randomString =
 '${now.year}_${now.month}_${now.day}_${now.hour}_${now.minute}_${now.second}pure${itemCount + 1}';

    final updatedItem = Item(
      id: widget.item.id,
      title: _titleController.text,
      content: _contentController.text,
      type: _type,
      date: _date,
      color: _color,
      value: _value,
      width: _width, // 更新宽属性
      height: _height, 
      isapp:isapps,
      randomString: _type+randomString, // 更新高属性
textsize: _textsize, 
values:_values.text,    
selectedValuezv:selectedValuezv,
textheme:textheme,
    );
    
  await saveItem(updatedItem);

Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => NextPage(updatedItem: updatedItem),
  ),
);
    
  }
  
  void _showEditPage(BuildContext context, String type, String selectedValuezt,  
  TextEditingController values, String selectedValue) {
    showDialog(
      context: context,
      builder: (_) => EditPage(
        type: type,
        initialValue: values.text,
        initialSelectedValue: selectedValue,
        selectedValuezt:selectedValuezt,
        selectedValue: selectedValuezt, 
        onSave: (value,selectedValue,selectedValuezt) {
          // 处理保存逻辑     
          values.text = value; // 更新 values 的值
          selectedValuezv = selectedValue; // 更新 selectedValuezv 的值
           textheme = selectedValuezt;  // 更新 textheme 的值
        //  selectedValuezt = textheme; // 更新全局变量的值
  print('保存成功：$type ,$value, $selectedValue, $textheme和$selectedValuezt');
          Navigator.pop(context); // 关闭对话框
                setState(() {
            //selectedValuezt = textheme;
            textheme;
           // otherText = '$value, $selectedValue, $selectedValuezt';
          });
        }, 
      ),
    );

  }


    // 计算新的颜色值
  Color _calculateColor() {
    final alphaValue = (_value * 255 / 100).toInt();


    return _color.withAlpha(alphaValue);
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(

          leading: IconButton(
    icon: Icon(Icons.arrow_back),
    color: Colors.black,
    onPressed: () => Navigator.of(context).pop(),
  ),
          backgroundColor: Colors.white,
        title: Text('编辑项目  😘  beta(仅实验功能)', 
        style: TextStyle(color: Colors.black),
         // 设置标题颜色为黑色
         ), systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
      

// 定义一个变量来保存选择的值
//int _selectedValue = 1;

Column(
  children: [
    Row(
      children: [
        Expanded(
          child: TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: '标题',
            ),
          ),
        ),
     
Expanded(child: 

ElevatedButton(
  child: Text('属性编辑&操作说明'),
       onPressed: () {
         _showEditPage(context, _type, textheme, _values, selectedValuezv);

              //  Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => RadioPage(),
              //     ),
              //   );
          
          },

),

),


      ],
    ),
  ],
),
         
          SizedBox(height: 16.0),
        Row(children: [
          Expanded(flex: 4,  child:   TextField(
            controller: _contentController,
            decoration: InputDecoration(
              labelText: '内容',
            ),
          ),),
Expanded(flex: 1, child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'app:',
               // style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 16),
              Switch(
                value: isapps,
                onChanged: (value) {
                  setState(() {
                    isapps = value;

   

                  });
                },
              ),
             
            ],
          ),),
Expanded( flex: 2, child:  Text(
                isapps ? 'Window-soft' : 'Widgets',
                style: TextStyle(fontSize: 20),
              ),),
        ],),
    
          SizedBox(height: 16.0),
           Text('点击选择类型 :                        ''个性主题textheme:  '+textheme,),
   

    Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: [

ElevatedButton(
  child: Text(_selectedOptionTitle), // 使用 _selectedOptionTitle 来更新按钮的文本
  onPressed: () async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
       TypeSelectionPage(selectedOption: _type)),
    );
if (result != null) {
  setState(() {
    _type = result["value"]; // 获取选中选项的 value 值
    _selectedOptionTitle = result["title"]; // 获取选中选项的标题
  });
}
  },
),

Container(
 width: 100,
  height: 100,
  decoration: BoxDecoration(
    color: _color,
    shape: BoxShape.circle,
  ),
  child: Center(
    child: Container(
      width: _width.toDouble(),
      height: _height.toDouble(),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
      ),
      child: Center(
        child: Text(
          '8',
          style: TextStyle(
            color: _color,
            fontSize: _textsize.toDouble()-5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ),
),

Text("属性zv"),
Text('$selectedValuezv '),

    // Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
    //         children: [
    //                  // Text(''),
    //           DropdownButton<String>(
    //             value: textheme,
    //             onChanged: (value) => setState(() => textheme = value!),
    //             items: [
    //               DropdownMenuItem(
    //                 value: 'ws',
    //                 child: Text('默认(系统)'),
    //               ),
    //               DropdownMenuItem(
    //                 value: 'dig',
    //                 child: Text('电子液晶管'),
    //               ),
    //                 DropdownMenuItem(
    //                 value: 'shizhong',
    //                 child: Text('机械时钟'),
    //               ),
    //                  DropdownMenuItem(
    //                 value: 'electron',
    //                 child: Text('电子时钟'),
    //               ),
    //            DropdownMenuItem(
    //                 value: 'guwu',
    //                 child: Text('孤鹜'),
    //               ),


    //               DropdownMenuItem(
    //                 value: 'kfz',
    //                 child: Text('(更多)开发中'),
    //               ),
             

    //             ],
               
    //           ),
    //         ],),

            ],
          ),
          
          //SizedBox(height: 16.0),
          Text('日期'),
          Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    // Text(
    //   DateFormat('yyyy-MM-dd HH:mm:ss').format(_date),
    //   style: TextStyle(fontSize: 16.0),
    // ),
    ElevatedButton(
      onPressed: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: _date,
          firstDate: DateTime(2021),
          lastDate: DateTime(2025),
        );
        if (selectedDate != null) {
          final selectedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(_date),
          );
          if (selectedTime != null) {
            setState(() {
              
              _date = DateTime(
                selectedDate.year,
                selectedDate.month,
                selectedDate.day,
                selectedTime.hour,
                selectedTime.minute,
              //  selectedTime.second,
              );
            });
          }
        }
      },
      child: Text(
          DateFormat('yyyy-MM-dd HH:mm:ss').format(_date),
      style: TextStyle(fontSize: 16.0),

      ),
    ),

   SizedBox(
      child: 
      Text(
      '小部件type:   ' +   _type,
      style: TextStyle(fontSize: 16.0),
      ),
    ),
  ],
),


       SizedBox(height: 16.0),
          Text('点击圆圈选择组件颜色'),
            SizedBox(height: 16.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Row(children: [
              GestureDetector(
                onTap: () async {
                  final selectedColor = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('选择颜色'),
                      content: SingleChildScrollView(
                        
                        child: BlockPicker(
                          pickerColor: _color,
                          onColorChanged: (color) {
                             setState(() {
                                _color = color;
                                _color = _calculateColor(); // 更新颜色值
                              });
                          Navigator.of(context).pop(color);
                          }
                              ,
                        ),
                      ),
                    ),
                  );
                  if (selectedColor != null) {
                    setState(() {
                      _color = selectedColor;
 _color = _calculateColor();

                    } );
                  }
                },
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                  color: _calculateColor(),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),

 SizedBox(height: 29.0,width: 30,),

          Text('透明度'),
          Slider(value: _value.toDouble(),
min: 1,
max: 100,
divisions: 99,
label: '$_value',
onChanged: (double value) => 
setState(() {

 _value = value.toInt();
   _color = _calculateColor();
}

),
),



              ],),

Row(
  children: [
 Text('字体大小'),
Expanded(child: 
   Slider(
      value: _textsize.toDouble(),
      min: 1,
      max: 100,
      divisions: 99,
      label: '$_textsize',
      onChanged: (double value) => setState(() => _textsize = value.toInt()),
    ),
),
  Text('$_textsize'),
SizedBox(
  width: 30,
),
Expanded(child: 
        Text('mheight和mwidth为窗口宽高'),
),




  ],
),


            ],       
          ),
       
SizedBox(height: 16.0),
Column(
  children: [
    Row(
      children: [
        Text('mHeight( 3x(字体大小+高)+100 )'),
        Expanded(
          child: Slider(
            value: _height.toDouble(),
            min: 1,
            max: 100,
            divisions: 99,
            label: '$_height %',
           // label: '${(_height + _textsize)*2+100}',

            onChanged: (double value) => setState(() => _height = value.toInt()),
          ),
        ),
        Text('实际高:${(_height + _textsize)*3+100} px'),
      ],
    ),
    Row(
      children: [
        Text('mWidth(  3x(字体大小+宽)+100)'),
        Expanded(
          child: Slider(
            value: _width.toDouble(),
            min: 1,
            max: 100,
            divisions: 99,
            label: '$_width %',
            onChanged: (double value) => setState(() => _width = value.toInt()),
          ),
        ),
         Text('实际宽:${(_width + _textsize)*3+100} px'),
      ],
    ),
  ],
),

// 
Row(
  children: [
Expanded(child: 
   SizedBox(
      width: 10,
    ),
),

Expanded(child: 
ElevatedButton(
        onPressed: () {
        //  Navigator.pop(context, selectedValuezt);
 saveChanges(false);
 //saveChs();
        },
child: Text('保存'),
),
),

Expanded(child: 
   SizedBox(
      width: 10,
    ),
),


   SizedBox(
      width: 30,
    ),
  ],
),

SizedBox(height: 10.0

),
Text('初次使用,不建议调节子宽高(mHeight...) ,默认就行,设置不合理的值可能导致挂件周围显示异常闪退或者无法点击'),
// SizedBox(height: 16.0),
Row(
  
  children: <Widget>[

    SizedBox(width: 10),


Expanded(child: 
  ElevatedButton(
      onPressed: null, // 无法点击
      child: Text('导出'),
    ),
),
    SizedBox(width: 10),

Expanded(child: 
    ElevatedButton(
      onPressed: () {
        // 处理点击事件

      ScaffoldMessenger.of(context).showSnackBar(
      const  SnackBar(
          content: Text("请保存后点击 \"i\" 预览 "),
          duration:  Duration(seconds: 1),
        ),
      );

    
      },
      child: Text('预览'),
    ),
),
    SizedBox(width: 10),


Expanded(child: 
     ElevatedButton(
      onPressed: (){

saveChs();
      },
      child: Text('复制'),
    ),
),
    SizedBox(width: 10),

Expanded(child: 
    ElevatedButton(
      onPressed: (){
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => PasswordPage()),
);
      }, // 无法点击
      child: Text('发布'),
    ),
),

    SizedBox(width: 10),

Expanded(child: 
 ElevatedButton(
      onPressed: null,
      child: Text('云备份'),
    ),
),
    SizedBox(width: 10),



           Checkbox(
    
      value: false,
      onChanged: null, // 无法勾选
    ),
Expanded(child: 
 
Text('分享链接:'),),


 
    // 


    //  SizedBox(width: 10),
    // ElevatedButton(
    //   onPressed: null, // 无法点击
    //   child: Text('默认'),
    // ),







    
 SizedBox(width: 40),


  ],
),
],
),
   floatingActionButton: FloatingActionButton(
        onPressed: () {
        //  Navigator.pop(context, selectedValuezt);
 saveChanges(true);
 //saveChs();
        },
        child: Icon(Icons.check),
      ),
);

}


}



