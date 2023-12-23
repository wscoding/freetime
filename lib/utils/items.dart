 import '../export.dart';
// class Item {
//   String id;
//   String title;
//   String content;
//   String type;
//   DateTime date;
//   Color color;
//   int value;
//   int width; // 新增宽属性
//   int height; // 新增高属性
//   String randomString; // 新增随机字符串属性
// int textsize;
// String textheme;
// String values;
// int selectedValuezv;
//   Item({
//     required this.id,
//     required this.title,
//     required this.content,
//     required this.type,
//     required this.date,
//     required this.color,
//     required this.value,
//      required this.width,
//     required this.height,
//     required this.randomString, // 带有默认值的随机字符串属性
//      required this.textsize,
//        required this.textheme,
//   required this.values,
//   required this.selectedValuezv,

//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'title': title,
//       'content': content,
//       'type': type,
//       'date': date.toIso8601String(),
//       'color': color.value,
//       'value': value,
//       'width': width,
//       'height': height,
//       'randomString': randomString, // 将随机字符串添加到映射中
// 'textsize': textsize,
// 'values':values,
// 'textheme':textheme,
// 'selectedValuezv':selectedValuezv,
//     };
//   }

//   factory Item.fromMap(Map<String, dynamic> map) {
//     return Item(
//       id: map['id'],
//       title: map['title'],
//       content: map['content'],
//       type: map['type'],
//       date: DateTime.parse(map['date']),
//       color: Color(map['color']),
//       value: map['value'],
//        width: map['width'],
//         height: map['height'],
//       randomString: map['randomString'], // 从映射中获取随机字符串
//  textsize: map['textsize'],
//  values: map['values'],
// selectedValuezv: map['selectedValuezv'],
// textheme: map['textheme'],
//     );
//   }
// }
class Item {
  String id;
  String title;
  String content;
  String type;
  DateTime date;
  Color color;
  int value;
  int width; // 新增宽属性
  int height; // 新增高属性
  String randomString; // 新增随机字符串属性
  int textsize;
  String textheme;
  String values;
  String selectedValuezv;
  bool isapp;
  Item({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.date,
    required this.color,
    required this.value,
    required this.width,
    required this.height,
    required this.randomString,
    required this.textsize,
    required this.textheme,
    required this.values,
    required this.isapp,
    required this.selectedValuezv,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      type: json['type'],
      date: DateTime.parse(json['date']),
      color: Color(json['color']),
      value: json['value'],
      width: json['width'],
      height: json['height'],
      randomString: json['randomString'],
      textsize: json['textsize'],
      textheme: json['textheme'],
      values: json['values'],
      selectedValuezv: json['selectedValuezv'],
      isapp: json['isapp'] as bool,

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'type': type,
      'date': date.toIso8601String(),
      'color': color.value,
      'value': value,
      'width': width,
      'height': height,
      'randomString': randomString,
      'textsize': textsize,
      'textheme': textheme,
      'values': values,
      'selectedValuezv': selectedValuezv,
      'isapp':isapp as bool,
          };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      type: map['type'],
      date: DateTime.parse(map['date']),
      color: Color(map['color']),
      value: map['value'],
      width: map['width'],
      height: map['height'],
      randomString: map['randomString'],
      textsize: map['textsize'],
      textheme: map['textheme'],
      values: map['values'],
     // isapp:map['isapp'] as bool,
     isapp: map['isapp'] != null ? map['isapp'] as bool : false,

      selectedValuezv: map['selectedValuezv'],

    );
  }


  
}