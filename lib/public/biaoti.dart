import '../export.dart';

class EditPage extends StatefulWidget {
  final String type;
  final String initialValue;
  final String selectedValuezt;
  final String initialSelectedValue;

  final dropdownValue = "new";
  final void Function(String selectedValuezt, String initialValue,
      String initialSelectedValue) onSave;

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
    late String zhuti;

  late String selectedValuezv;
  String selectedValuezt = "guwu";
  final TextEditingController _daysController = TextEditingController();
  final TextEditingController _hoursController = TextEditingController();
  final TextEditingController _minutesController = TextEditingController();
  final TextEditingController _secondsController = TextEditingController();
  final TextEditingController _valuesController = TextEditingController();

  Widget themetext() {
    return const Row(
      children: [
        Expanded(
          child: Text(
            "已支持的主题(左):",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: Text(
            "暂不支持(开发适配中):",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _values.text = widget.initialValue;
    selectedValuezv = widget.initialSelectedValue;
    selectedValuezt = widget.selectedValuezt;
    zhuti = widget.type;
                  print(selectedValuezv);
print("主题:"+zhuti);
    allshuxin.any((item) =>
            ["all", 'new', "old", "custom", "default", 'times'] ==
            selectedValuezv)
        ? selectedValuezv
        : (selectedValuezv = "custom");

 if(widget.type == "daojishi"  )
 hebing();

print( _values.text);
print("selectedValuezv");

  if(widget.type == "jishuqi"  )
//combineValues(  _values.text);

   _values.text =   _values.text.replaceAll(RegExp(r'[^\w\s]+'), '');

    print(selectedValuezv);

    if(zhuti == "huaban")
    selectedValuezt = "huaban";
  }



  hebing(){
    final int days = int.tryParse(_daysController.text) ?? 0;
          final int hours = int.tryParse(_hoursController.text) ?? 0;
          final int minutes = int.tryParse(_minutesController.text) ?? 0;
          final int seconds = int.tryParse(_secondsController.text) ?? 0;
          final String values = '$days,$hours,$minutes,$seconds';
          _values.text = values;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.type + " 私有属性编辑"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      //       GestureDetector(
      //              onTap: () {
      //   // 在这里编写触发的事件逻辑
      //   print('点击了文本');
      // },
      //   child:  
        Text(
              widget.type == 'huaban'
                  ? '编辑 huaban'
                  : widget.type == 'd'
                      ? '编辑 d'
                      : widget.type == 'c'
                          ? '编辑 c'
                          : widget.type+"  私有属性编辑",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        
        //    ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: SingleChildScrollView(
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
                              SizedBox(height: 16),
                              DropdownButton(
                                value: allshuxin.any(
                                        (item) => item.value == selectedValuezv)
                                    ? selectedValuezv
                                    : null,
                                //value: allshuxin.any((item) => item.value == selectedValuezv)  ? selectedValuezv : null,
                                onChanged: (value) =>
                                    setState(() => selectedValuezv = value!),
                                items: allshuxin
                                    .where((item) => [
                                          "all",
                                          'work',
                                          "timeup",
                                          "custom",
                                        ].contains(item.value))
                                    .toList(),
                              ),
                              const Text(
    '选择时间进度时,不需要填写属性,默认今日进度\n(请在编辑页面选择可选主题\选择其他主题会自动使用默认主题)'),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 200, // 指定高度
                                child: buildCheckboxList(daoshurititle,
                                    daoshuri, rightValues, daoshuriX),
                              ),
                            ],
                          )
                        : widget.type == 'time'
                            ? Column(
                                children: [
                                  DropdownButton(
                                    value: allshuxin.any((item) =>
                                            item.value == selectedValuezv)
                                        ? selectedValuezv
                                        : null,
                                    //value: allshuxin.any((item) => item.value == selectedValuezv)  ? selectedValuezv : null,
                                    onChanged: (value) => setState(
                                        () => selectedValuezv = value!),
                                    items: allshuxin
                                        .where((item) => [
                                              "all",
                                              'new',
                                              "old",
                                              "custom",
                                            ].contains(item.value))
                                        .toList(),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('内容过多,不建议选择all,部分主题可能不支持农历'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  themetext(),
                                  SizedBox(
                                    height: 200, // 指定高度
                                    child: buildCheckboxList(
                                        tts, ttitle, rightValues, daoshuriX),
                                  ),
                                ],
                              )
                            : widget.type == 'daoshuri'
                                ? Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('请在首页选择日期,在此处选择展示类型:'),
                                          DropdownButton(
                                            value: allshuxin.any((item) =>
                                                    item.value ==
                                                    selectedValuezv)
                                                ? selectedValuezv
                                                : null,
                                            //value: allshuxin.any((item) => item.value == selectedValuezv)  ? selectedValuezv : null,
                                            onChanged: (value) => setState(
                                                () => selectedValuezv = value!),
                                            items: allshuxin
                                                .where((item) => [
                                                      "all",
                                                      'new',
                                                      "old",
                                                      "custom",
                                                    ].contains(item.value))
                                                .toList(),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
//Text('请在主页选择一个日期,软件会自动判断'),
                                      Text('date已经过去xx天xx小时'),
                                      Text('距离date还有xx天xx小时'),
                                      Text('内容过多,不建议选择all,部分主题可能不支持农历'),

                                      SizedBox(
                                        height: 10,
                                      ),
                                      themetext(),
                                      SizedBox(
                                        height: 200, // 指定高度
                                        child: buildCheckboxList(daoshurititle1,
                                            daojishi1, rightValues, daoshuriX),
                                      ),
                                    ],
                                  )
                                : widget.type == 'qrcode'
                                    ? Column(
                                      children: [
                                        Row(
                                          children: [
    Expanded(  flex:2, child:
                                           TextField(
                                        controller: _values,
                                        decoration: InputDecoration(
                                          labelText: '二维码内容',
                                        ),
                                      ),   ),
                                      Expanded(
flex:1,
                                        child:  
                                          
                                          DropdownButton(
                                            value: allshuxin.any((item) =>
                                                    item.value ==
                                                    selectedValuezv)
                                                ? selectedValuezv
                                                : null,
                                            //value: allshuxin.any((item) => item.value == selectedValuezv)  ? selectedValuezv : null,
                                            onChanged: (value) => setState(
                                                () => selectedValuezv = value!),
                                            items: allshuxin
                                                .where((item) => [
                                                      "3f1y",
                                                      '3y1f',
                                                      "1y1y",
                                                      "custom",
                                                    ].contains(item.value))
                                                .toList(),
                                          ),)
                                          ],
                                        ),
                            
                                      
                                    themetext(),
                              SizedBox(
                                height: 200, // 指定高度
                                child: buildCheckboxList(qrt, qrv,
                                    rightValues, daoshuriX),
                              ),
                                      ],
                                    )
                                    
                                    
                                 
                                    : widget.type == 'c'
                                        ? TextField(
                                            controller: _values,
                                            decoration: InputDecoration(
                                              labelText: '初始值 c',
                                            ),
                                          )
                                        : SizedBox(),
                    SizedBox(height: 16),
                    widget.type == 'c'
                        ? DropdownButton(
                            value: allshuxin.any(
                                    (item) => item.value == selectedValuezv)
                                ? selectedValuezv
                                : null,

                            //value: allshuxin.any((item) => item.value == selectedValuezv)  ? selectedValuezv : null,
                            onChanged: (value) =>
                                setState(() => selectedValuezv = value!),
                            items: allshuxin
                                .where((item) => [
                                      "all",
                                      'new',
                                      "old",
                                      "custom",
                                    ].contains(item.value))
                                .toList(),
                          )
                        : SizedBox(),
                    widget.type == 'miaobiao'
                        ? Column(
                            children: [Row(children: [
    SizedBox(width: 200,  child:         DropdownButton(
                                value: ["all", "s", "m", "h", "custom"]
                                        .contains(selectedValuezv)
                                    ? selectedValuezv
                                    : "all",

                                //value: allshuxin.any((item) => item.value == selectedValuezv)  ? selectedValuezv : null,
                                onChanged: (value) =>
                                    setState(() => selectedValuezv = value!),

                                items: allshuxin
                                    .where((item) => [
                                          "all",
                                          's',
                                          "m",
                                          "h",
                                          "custom",
                                        ].contains(item.value))
                                    .toList(),
                              ),
                              
                              ),
                     Text("该属性开发中..."),
                            ],),
                            
                              SizedBox(
                                height: 20,
                              ),
                              themetext(),
                              SizedBox(
                                height: 200, // 指定高度
                                child: buildCheckboxList(miaobiaotite, miaobiao,
                                    rightValues, daoshuriX),
                              ),
                            ],
                          )
                        : SizedBox(),
                    widget.type == 'daojishi'
                        ? Column(
                            children: [
                              Container(
                                // color: Colors.grey,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        //  color: Colors.blue,
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 80,
                                                child: TextField(
                                                  controller: _daysController,
                                                  decoration: InputDecoration(
                                                      labelText: '天'),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 80,
                                                child: TextField(
                                                  controller: _hoursController,
                                                  decoration: InputDecoration(
                                                      labelText: '小时'),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 80,
                                                child: TextField(
                                                  controller:
                                                      _minutesController,
                                                  decoration: InputDecoration(
                                                      labelText: '分钟'),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 80,
                                                child: TextField(
                                                  controller:
                                                      _secondsController,
                                                  decoration: InputDecoration(
                                                      labelText: '秒'),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    //   SizedBox(width: 30, ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        //    color: Colors.green,
                                        child: Center(
                                          child: DropdownButton(
                                            value: allshuxin.any((item) =>
                                                    item.value ==
                                                    selectedValuezv)
                                                ? selectedValuezv
                                                : null,
                                            //value: allshuxin.any((item) => item.value == selectedValuezv)  ? selectedValuezv : null,
                                            onChanged: (value) => setState(
                                                () => selectedValuezv = value!),
                                            items: allshuxin
                                                .where((item) => [
                                                      "all",
                                                      's',
                                                      "m",
                                                      "times",
                                                      "custom",
                                                    ].contains(item.value))
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 160,
                                    child: TextField(
                                      controller: _values,
                                      decoration: InputDecoration(
                                        labelText: '时长',
                                        //      suffixText: '天,小时,分钟,秒',
                                      ),
                                    ),
                                  ),
                                  Text('格式为 天,小时,分钟,秒  '),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      //final String duration = _values.text;
                                      final int days =
                                          int.tryParse(_daysController.text) ??
                                              0;
                                      final int hours =
                                          int.tryParse(_hoursController.text) ??
                                              0;
                                      final int minutes = int.tryParse(
                                              _minutesController.text) ??
                                          0;
                                      final int seconds = int.tryParse(
                                              _secondsController.text) ??
                                          0;
                                      final String values =
                                          '$days,$hours,$minutes,$seconds';
                                      _values.text = values;
                                    },
                                    child: Text('合并'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
//Text('60s=1m, 1800s=30m,  3600s=1h,  7200s=2h'),
                              themetext(),
                              SizedBox(
                                height: 200, // 指定高度
                                child: buildCheckboxList(daojishititle,
                                    daojishi, rightValues, daoshuriX),
                              ),
                            ],
                          )
                        : SizedBox(),
                    widget.type == 'jishuqi'
                        ? Column(
                            children: [
                              SizedBox(
                                width: 300,
                                child: TextField(
                                  controller: _values,
                                  decoration: InputDecoration(
                                    labelText: '初始次数',
                                    suffixText: '次',
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(
                                        r'^([1-9]|[1-9]\d{1,7}|100000)$')),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                              DropdownButton(
                                value: allshuxin.any(
                                        (item) => item.value == selectedValuezv)
                                    ? selectedValuezv
                                    : null,
                                //value: allshuxin.any((item) => item.value == selectedValuezv)  ? selectedValuezv : null,
                                onChanged: (value) =>
                                    setState(() => selectedValuezv = value!),
                                items: allshuxin
                                    .where((item) => [
                                          "all",
                                          'times',
                                          "custom",
                                        ].contains(item.value))
                                    .toList(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              themetext(),
                              SizedBox(
                                height: 200, // 指定高度
                                child: buildCheckboxList(
                                    jsqt, jsqv, rightValues, daoshuriX),
                              ),
                            ],
                          )
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                Text("部分不支持的主题在适配中..."),
                                SizedBox(
                                  child: Text("暂无其他属性,请返回后选择一个日期时间\n"),
                                ),
                                SizedBox(
                                  height: 40,
                                  child:
                                      Text("动态主题需要 GPU 支持 DirectX 9.3 版本及以上"),
                                ),
                              ],
                            ),
                          ),
                    //      SizedBox(height: 16),
                  ],
                ),
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

  Widget buildCheckboxList(List<String> title, List<String> selectvalue,
      List<String> left, List<String> no) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: title.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  title: Row(
                    children: [
                      Text(title[index]),
                      // SizedBox(width: 30),
                      Expanded(
                        child: Text(
                          shipei[index],
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  value: selectvalue[index],
                  subtitle: Text(selectvalue[index]),
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
          const VerticalDivider(
            thickness: 1, // 设置分隔线的厚度
            color: Colors.grey, // 设置分隔线的颜色
          ),
          Expanded(
            child: ListView.builder(
              itemCount: left.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  title: Text(no[index]),
                  subtitle: Text(left[index]),
                  value: left[index],
                  groupValue: left,
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
