



import 'package:FreeTime/viewpage/widgets/heart/love.dart';

import '../export.dart';
import '../viewpage/widgets/demo/t1.dart';
import '../viewpage/widgets/notes/note.dart';


class MyListViews extends StatelessWidget {
  const MyListViews({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return 
     ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        if (index == 0) {
          return   ListTile(              
            title: Text('搜索 ${index + 1}'),
            trailing:  Icon(Icons.search),
             contentPadding: EdgeInsets.symmetric(horizontal: 70.0),
            onTap: () {
          //    createNewWindow(ClockPage());
             
              // windowManager.startDragging();
              // Navigate to ViewPager1 page
// Navigator.push(context, MaterialPageRoute(builder:
//  (context) => AltAKeyListener()));
            },

          );
          
       
        } else if (index == 1) {
          return ListTile(
            title: Text('设置 ${index + 1}'),
                   trailing: Icon(Icons.favorite),
             contentPadding: EdgeInsets.symmetric(horizontal: 70.0),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const OtherPage()));
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPager2()));
            },
          );
        } else if (index == 2) {
          return ListTile(
            title: Text('调试 ${index + 1}'),
                   trailing: Icon(Icons.font_download),
             contentPadding: EdgeInsets.symmetric(horizontal: 70.0),
            onTap: () {
              // Navigate to ViewPager3 page
//  Navigator.push(context, MaterialPageRoute(builder: (context) =>
//   Paper()));
            },
          );
        } else if (index == 3) {
          return ListTile(
            title: Text('赞助 ${index + 1}'),
                   trailing: Icon(Icons.font_download),
             contentPadding: EdgeInsets.symmetric(horizontal: 70.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  //builder: (context) => ClockWidget(DateTime.now()),
                  builder: (context) => sz(),
                ),
              );
            },
          );
        } else if (index == 4) {
          return ListTile(
            title: Text('图片 ${index + 1}'),
                   trailing: Icon(Icons.font_download),
             contentPadding: EdgeInsets.symmetric(horizontal: 70.0),
            onTap: () {
              // Navigate to ViewPager3 page
              Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePickerPage()));
            },
          );
        }else if (index == 5) {
          return ListTile(
            title: Text('退出 ${index + 1}'),
                   trailing: Icon(Icons.font_download),
             contentPadding: EdgeInsets.symmetric(horizontal: 70.0),
            onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
      const  SnackBar(
          content: Text("请保存后点击 \"i\" 预览 "),
          duration:  Duration(seconds: 1),
        ),
      );
            },
          );
        }
        
        else if (index == 6) {
          return ListTile(
            title: Text('关于 ${index + 1}'),
                   trailing: Icon(Icons.font_download),
             contentPadding: EdgeInsets.symmetric(horizontal: 70.0),
            onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MySubPageon()));

      //   ScaffoldMessenger.of(context).showSnackBar(
      // const  SnackBar(
      //     content: Text("请保存后点击 \"i\" 预览 "),
      //     duration:  Duration(seconds: 1),
      //   ),
      // );
 //Navigator.push(context, MaterialPageRoute(builder: (context) => 
 //TimerBasic(format:CountDownTimerFormat.daysHoursMinutesSeconds,)));
 // Navigator.of(context).pop();
 //Navigator.push(context, MaterialPageRoute(builder: (context) => 
 //AnniversaryPages(item:item)));

            },
          );
        }
        else if (index == 7) {
          return ListTile(
            title: Text('Language ${index + 1}'),
                   trailing: Icon(Icons.font_download),
             contentPadding: EdgeInsets.symmetric(horizontal: 70.0),
            onTap: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) 
   =>    LoveAnimationPage(), ));
 
            },
          );
        }
          else if (index == 8) {
          return ListTile(
            title: Text('Freetime  ${index + 1}'),
                   trailing: Icon(Icons.font_download),
             contentPadding: EdgeInsets.symmetric(horizontal: 70.0),
            onTap: () {
     Navigator.push(context, MaterialPageRoute(builder: (context) 
    =>     MyInputPage(

 )));
 
            },
          );
        }
         else {
          return Text("123"
       
          );
        }
      },


    );

  }
}