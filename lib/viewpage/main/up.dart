
import 'package:http/http.dart' as http;

import '../../export.dart';

class ExampleMainWindow extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<ExampleMainWindow> {
  late Map<String, dynamic> data;
  String message = '';
  bool isLoading = true;
  int _currentIndex = 1;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
final response = await http.get(Uri.parse('http://zt.999087.com/app/free/code.json'),
 headers: {
    'Accept': 'application/json',
    'Accept-Charset': 'utf-8',
    'Content-Type': 'application/json; charset=utf-8',
  },
 ).timeout(Duration(seconds: 2));

      if (response.statusCode == 200) {
  String responseBody = utf8.decode(response.bodyBytes);

  data = jsonDecode(responseBody);
        data = jsonDecode(responseBody);
            print(data);
            print('网络错误2222');
                setState(() {
          isLoading = false;
                });

      } else {

        message = '网络错误';
            print('网络错误1');

      }
    } catch (e) {
                  print('网络错误3');

      message = e is TimeoutException ? '网络超时' : '网络失败';
    }
    //setState(() {});
    //print(data);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    if (message.isNotEmpty) {
      return Center(child: Text(message));
    }
    return SingleChildScrollView(child:    
       Column(
      children: <Widget>[
        TextButton(
          child: Text(data['id']),
          onPressed: () {
            if (data['display']) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(data['title']),
                  content: Text(data['content']),
                  actions: <Widget>[
                    TextButton(
                      child: Text('确定'),
                      onPressed: ()async {
                     //   Navigator.of(context).pop();
                        if (await canLaunch(data['up'])) {
                                await launch(data['up']);
                              } else {
                                throw 'Could not launch ${data['up']}';
                              }
                   //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebView(data['up'])));
                      },
                    ),
                  ],
                ),
              );
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text(data['version']),
                ),
              );
            }
          },
        ),
CarouselSlider(
  options: CarouselOptions(  
    aspectRatio: 16 / 9, 
    height: 150, 
    autoPlay: true,
    autoPlayInterval: Duration(seconds: 2),
    onPageChanged: (index, reason) {
      setState(() {
        _currentIndex = index;
      });
    },
  ),
  items: [
    CarouselItem(data['img1'], data['cont1'], data['url1']),
    CarouselItem(data['img2'], data['cont2'], data['url2']),
    CarouselItem(data['img3'], data['cont3'], data['url3']),
  ],
),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: List.generate(
    3,
    (index) => Padding(
      padding: EdgeInsets.all(4),
      child: CircleAvatar(
        radius: _currentIndex == index ? 5 : 4,
        backgroundColor: _currentIndex == index ? Colors.blue : Colors.grey,
      ),
    ),
  ),
),

      ],
    ), );

  }
}

class CarouselItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String url;

  CarouselItem(this.imageUrl, this.title, this.url);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async {
                       if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
    //    Navigator.of(context).push(MaterialPageRoute(builder: (context) => launch(url)));
      },
      child: Column(
        children: <Widget>[
          Image.network(imageUrl),
          Text(title),
        ],
      ),
    );
  }
}

