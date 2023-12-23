import 'dart:math' as math;

import 'package:FreeTime/export.dart';


class salosoft extends StatefulWidget {
      final Item item;

   salosoft({
    Key? key,
     this.color =Colors.black,
    this.size = 800.0,
    this.duration =  const Duration(milliseconds: 4000),
    this.strokeWidth,
    this.controller, required this.item, 
  }) : super(key: key);

  final double size;
  final Color color;
  final Duration duration;
  final double? strokeWidth;
  final AnimationController? controller;

  @override
  State<salosoft> createState() => _SpinKitPouringHourGlassRefinedState();
}

class _SpinKitPouringHourGlassRefinedState extends State<salosoft>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pouringAnimation;
  late Animation<double> _rotationAnimation;
  int _currentIndex = 0; // 当前显示的 TimerFrame 的索引

  late String content;
  late int value;
  late int width;
  late int height;
  late Color color;
  late int textsize;
  late String values;
 late DateTime date;

  List<String> valueList = [];
  List<int> intList = [];

List<int> secord = []; // 假设这是你的values列表
  @override
  void initState() {
    super.initState();
        content = widget.item.content;
    value = widget.item.value;
    width = widget.item.width;
    height = widget.item.height;
    color = widget.item.color;
    textsize = widget.item.textsize;
       values = widget.item.values;
       date = widget.item.date;

    final item = widget.item;
    values = item.values;
    valueList = values.split(',');
    intList = valueList.map((str) => int.parse(str)).toList();

int seconds = convertValuesToSeconds(intList);
print(seconds);
    _controller = (widget.controller ?? 
    AnimationController(vsync: this, duration: Duration(milliseconds: seconds*1000)))
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      })
      ..repeat();
    _pouringAnimation = CurvedAnimation(parent: _controller, 
    curve: const Interval(0.0, 0.9))
      ..addListener(() => setState(() {}));
    _rotationAnimation = Tween(begin: 0.0, end: 0.5)
        .animate(CurvedAnimation(parent: _controller, curve: 
        const Interval(0.9, 1.0, curve: Curves.fastOutSlowIn)));

   // 在 initState 中调用 qt 函数
}

int convertValuesToSeconds(List<int> values) {
  int seconds = 0;
  seconds += values[0] * 86400; // 将天数转换为秒
  seconds += values[1] * 3600; // 将小时数转换为秒
  seconds += values[2] * 60; // 将分钟数转换为秒
  seconds += values[3]; // 将秒数加上
  if (seconds == 0) {
    seconds = 10; // 如果seconds为0，则将其设置为10
  }
  return seconds;
}


  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return      Listener(
      onPointerDown: (PointerDownEvent event) async {
        // if (event.buttons == kPrimaryButton) {
        //   print('Left button clicked');
        //   await windowManager.startDragging();
        // } else
         if (event.buttons == kSecondaryButton) {
          print('Right button clicked');
Navigator.pop(context,true);
 //Navigator.push(context, MaterialPageRoute(builder: (context,) => ItemListPage()) ,);
        }
      }, 
          child:
          GestureDetector( 

       onPanStart: (e) {
            windowManager.startDragging();
          },
    
           child:
     Center(
      child: RotationTransition(
        
        turns: _rotationAnimation,
        child: SizedBox.fromSize(
          size: Size.square(widget.size * math.sqrt1_2),
          child: CustomPaint(
            painter: _HourGlassPaint(
              poured: _pouringAnimation.value,
              color:  widget.item.color,
              strokeWidth: widget.strokeWidth,
            ),
          ),
        ),
      ),
         ),
      ),
    );
  }
}

class _HourGlassPaint extends CustomPainter {
  _HourGlassPaint({this.strokeWidth, this.poured, required Color color})
      : _paint = Paint()
          ..style = PaintingStyle.stroke
          ..color = color,
        _powderPaint = Paint()
          ..style = PaintingStyle.fill
          ..color = color;

  final double? strokeWidth;
  final double? poured;
  final Paint _paint;
  final Paint _powderPaint;

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final halfHeight = size.height / 2;
    final hourglassWidth = math.min(centerX * 0.8, halfHeight);
    final gapWidth = math.max(3.0, hourglassWidth * 0.05);
    final yPadding = gapWidth / 2;
    final top = yPadding;
    final bottom = size.height - yPadding;
    _paint.strokeWidth = strokeWidth ?? gapWidth;

    final hourglassPath = Path()
      ..moveTo(centerX - hourglassWidth + 2, top)
      ..lineTo(centerX + hourglassWidth, top)
      ..arcToPoint(
        Offset(centerX + hourglassWidth, top + 7),
        radius: const Radius.circular(4),
        clockwise: true,
      )
      ..lineTo(centerX + hourglassWidth - 2, top + 8)
      ..quadraticBezierTo(centerX + hourglassWidth - 2, (top + halfHeight) / 2 + 2, centerX + gapWidth, halfHeight)
      ..quadraticBezierTo(
          centerX + hourglassWidth - 2, (bottom + halfHeight) / 2, centerX + hourglassWidth - 2, bottom - 7)
      ..arcToPoint(
        Offset(centerX + hourglassWidth, bottom),
        radius: const Radius.circular(4),
        clockwise: true,
      )
      ..lineTo(centerX - hourglassWidth, bottom)
      ..arcToPoint(
        Offset(centerX - hourglassWidth, bottom - 7),
        radius: const Radius.circular(4),
        clockwise: true,
      )
      ..lineTo(centerX - hourglassWidth + 2, bottom - 7)
      ..quadraticBezierTo(centerX - hourglassWidth + 2, (bottom + halfHeight) / 2, centerX - gapWidth, halfHeight)
      ..quadraticBezierTo(
          centerX - hourglassWidth + 2, (top + halfHeight) / 2 + 2, centerX - hourglassWidth + 2, top + 7)
      ..arcToPoint(
        Offset(centerX - hourglassWidth, top),
        radius: const Radius.circular(4),
        clockwise: true,
      )
      ..close();
    canvas.drawPath(hourglassPath, _paint);

    final upperPart = Path()
      ..moveTo(0.0, top)
      ..addRect(Rect.fromLTRB(0.0, halfHeight * poured!, size.width, halfHeight));
    canvas.drawPath(Path.combine(PathOperation.intersect, hourglassPath, upperPart), _powderPaint);

    final lowerPartPath = Path()
      ..moveTo(centerX, bottom)
      ..relativeLineTo(hourglassWidth * poured!, 0.0)
      ..lineTo(centerX, bottom - poured! * halfHeight - gapWidth)
      ..lineTo(centerX - hourglassWidth * poured!, bottom)
      ..close();
    final lowerPart = Path.combine(
      PathOperation.intersect,
      lowerPartPath,
      Path()..addRect(Rect.fromLTRB(0.0, halfHeight, size.width, size.height)),
    );
    canvas.drawPath(lowerPart, _powderPaint);

    canvas.drawLine(Offset(centerX, halfHeight), Offset(centerX, bottom), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
