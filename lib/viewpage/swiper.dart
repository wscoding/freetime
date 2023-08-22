import '../export.dart';


String? globalTitle;
String? globalContents;

class swSubPage extends StatefulWidget {
  @override
  _MySubPageState createState() => _MySubPageState();
}

class _MySubPageState extends State<swSubPage> {
  late Future<Content> futureContent;



  @override
  Widget build(BuildContext context) {
return Container(
  child: Column(
    children: [
      Expanded(
        flex: 1,
        child: ExampleMainWindow(),
      ),
      Expanded(
        flex: 2,
        child: MyListViews(),
      ),
    ],
  ),
);

  }
}

class NewPage extends StatelessWidget {
  final int index;

  NewPage({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Page ${index + 1}'),
      ),
      body: Center(
        child: Text('This is new page ${index + 1}'),
      ),
    );
  }
}


class Content {
  String id;
  String title;
  String content;
  String version;
  String date;
  List<String> imgs;
  List<String> conts;
  List<String> urls;
  bool code;
  String value;

  Content({
    required this.id,
    required this.title,
    required this.content,
    required this.version,
    required this.date,
    required this.imgs,
    required this.conts,
    required this.urls,
    required this.code,
    required this.value,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      version: json['version'],
      date: json['date'],
      imgs: [json['img1'], json['img2'], json['img3']],
      conts: [json['cont1'], json['cont2'], json['cont3']],
      urls: [json['url1'], json['url2'], json['url3']],
      code: json['code'],
      value: json['value'],
    );
  }
}

    // itemCount: snapshot.data!.imgs.length,
    //                 pagination: SwiperPagination(),
    //                 control: SwiperControl(),
    //                 autoplay: snapshot.data!.time != 0,
    //                 autoplayDelay: snapshot.data!.time * 1000,

