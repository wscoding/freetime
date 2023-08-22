
import 'package:FreeTime/export.dart';


class EditPage extends StatefulWidget {
  final String type;
  final String initialValue;
    final String selectedValuezt;
  final String initialSelectedValue;
  final void Function(
    String selectedValuezt, String initialValue, String initialSelectedValue) onSave;

  const EditPage({
    Key? key,
    required this.type,
       required this.selectedValuezt,
    required this.initialValue,
    required this.initialSelectedValue,
    required this.onSave, 
    required String selectedValue,
  }) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController _values = TextEditingController();
  String selectedValuezv = "1";
String  selectedValuezt =  "guwu";


  @override
  void initState() {
    super.initState();
    _values.text = widget.initialValue;
    selectedValuezv = widget.initialSelectedValue;
selectedValuezt = widget.selectedValuezt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('编辑页面'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.type == 'daojishi'
                  ? '编辑 daojishi'
                  : widget.type == 'd'
                      ? '编辑 d'
                      : widget.type == 'c'
                          ? '编辑 c'
                          : widget.type+"  私有属性编辑",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 16),
            Expanded(
              
              child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.type == 'jindu'
                      ? Column(
                      
                        children: [
                          

   TextField(
              controller: _values,
              decoration: InputDecoration(
                labelText: '初始进度',
                suffixText: '%',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'^[0-9]\d?$|^100$'),
                ),
              ],
            ),
  SizedBox(height: 16
  ),
            DropdownButton(
                          value: selectedValuezv,
                          onChanged: (value) =>
                              setState(() => selectedValuezv = value!),
                          items:const [
                            DropdownMenuItem(
                              value: "1",
                              child:  Row(
                                children: [
                                  Icon(Icons.one_k),
                                  SizedBox(width: 8),
                                  Text('all'),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: "10",
                              child: Row(
                                children: [
                                  Icon(Icons.sailing),
                                  SizedBox(width: 8),
                                  Text('工作'),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: "100",
                              child: Row(
                                children: [
                                  Icon(Icons.info),
                                  SizedBox(width: 8),
                                  Text('时间'),
                                ],
                              ),
                            ),
                          ],
            ),
           
Text('选择时间进度时,不需要填写属性,默认今日进度\n(请在编辑页面选择可选主题\选择其他主题会自动使用默认主题)'),
 
  SizedBox(
              height: 10,
            ),
       SizedBox(
  height: 200, // 指定高度
  child:
   buildCheckboxList(jindutheme, jindutheme,leftValues),
),
                        ],                   
                      )
                   
                     
                      :   Text("部分不支持的主题在适配中..."), 
                      //      SizedBox(height: 16),
                      SizedBox(

child: 
Text("暂无其他属性,请返回后选择一个日期时间\n"),

                      ),
SizedBox(width: 40,child:    Text("动态主题需要 GPU 支持 DirectX 9.3 版本及以上"),),
                ],
              ),
            ),
         
            Center(
              child: ElevatedButton(
                child: Text('保存'),
                onPressed: () {
                  widget.onSave(_values.text, selectedValuezv, selectedValuezt);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


// /text(zhtai['es'])




  Widget buildCheckboxList( List<String> allItems, List<String> selectedItems,
   List<String> leftValues) {
     return Scaffold(

      body: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: jindus.length,
              itemBuilder: (context, index) {
                return RadioListTile(
title: Row(
  children: [
    Text(jindus[index]),
   // SizedBox(width: 30),
    Expanded(
      child: Text(
        shipei[index],
        textAlign: TextAlign.right,
      ),
    ),
  ],
),                  value: leftValues[index],
                  subtitle:Text(leftValues[index]),
                  groupValue: selectedValuezt,
                  onChanged: (value) {
                    setState(() {
                      selectedValuezt = value!;
                    });
                  },
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: rightValues.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  title: Text(rightValues[index]),
                  value: rightValues[index],
                  groupValue: selectedValuezt,
                  onChanged: null,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        //  Navigator.pop(context, selectedValuezt);
        selectedValuezt = selectedValuezt;
        print(selectedValuezt);
        },
        child: Icon(Icons.check),
      ),
    );
  
}
}