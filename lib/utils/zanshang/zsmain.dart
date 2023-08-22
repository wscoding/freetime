import 'package:flutter/material.dart';

class zsmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('子页面'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: MyImageButton(
              image: 'lib/assets/images/zsm.png',
              title: 'ws',
              description: '这是第一张图片的描述',
            ),
          ),
          Expanded(
            child: MyImageButton(
              image: 'lib/assets/images/hb.jpg',
              title: '22',
              description: '这是第二张图片的描述',
            ),
          ),
          Expanded(
            child: MyImageButton(
              image: 'lib/assets/images/zfb.jpg',
              title: '图片3',
              description: '这是第三张图片的描述',
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Text(
              '关于',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyImageButton extends StatefulWidget {
  final String image;
  final String title;
  final String description;

  MyImageButton({required this.image, required this.title, required this.description});

  @override
  _MyImageButtonState createState() => _MyImageButtonState();
}

class _MyImageButtonState extends State<MyImageButton> {
  bool expanded = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          expanded = !expanded;
        });
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            widget.image,
            fit: expanded ? BoxFit.cover : BoxFit.scaleDown,
          ),
          if (expanded)
   SingleChildScrollView(child:
            Container(
              color: Colors.black54,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
             ),
        ],
      ),
    );
  }
}