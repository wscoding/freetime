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
              image: "lib/assets/zsm.png",
              // "lib/assets/clock_background.png",
              title: '微信支付',
              description: '支付前请备注姓名,用于在后续赞助名单展示',
            ),
          ),
          Expanded(
            child: MyImageButton(
              image: "lib/assets/hb.jpg",
              title: '支付宝红包',
              description: '你的备注对我很重要',
            ),
          ),
          Expanded(
            child: MyImageButton(
              image: "lib/assets/zfb.jpg",
              title: '支付宝',
              description: '支付前请备注姓名,用于在后续赞助名单暂时',
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