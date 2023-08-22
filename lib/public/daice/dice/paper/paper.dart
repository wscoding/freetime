import 'dart:ui';
import "package:FreeTime/export.dart";

class Paper extends StatefulWidget {

    final Item item;
   Paper({Key? key, required this.item}) : super(key: key);



  @override
  State<Paper> createState() => _PaperState();
}

class _PaperState extends State<Paper>  with AutomaticKeepAliveClientMixin {

  late String _content;
  late int _value;
  late int width;
  late int height;
  late Color color;
  late int textsize;
  late String _title;
 late DateTime _date;
late String sx = "all";
late  DateTime _dateTime;
 late String _timeString;
late Timer _timer; // 定义定时器

  @override
  void initState() {



    //Timer.periodic(Duration(seconds: 1), (Timer t) => _getCurrentTime());
    super.initState();

        _content = widget.item.content;
    _value = widget.item.value;
    width = widget.item.width;
    height = widget.item.height;
    color = widget.item.color;
    textsize = widget.item.textsize;
       _title = widget.item.title;
       _date = widget.item.date;
           sx = widget.item.selectedValuezv;

 applyWindowSettings('window_settings.json');

    ///nongli();
  }
void applyWindowSettings(String path) async {
  WindowSettings settings = await WindowSettings.loadFromFile(path);
 double  mWidth = (width.toDouble()+textsize.toDouble())*3+100;
  double  mheight = (height.toDouble()+textsize.toDouble())*3+100;

  WindowManager.instance.setSize(Size(mWidth, mheight));
 // WindowManager.instance.setTitle(settings.windowTitle);
 // WindowManager.instance.setIcon(settings.windowIcon);
}





  @override
  bool get wantKeepAlive => true;


  List<Line> _lines = []; // 线列表

  int _activeColorIndex = 0; // 颜色激活索引
  int _activeStorkWidthIndex = 0; // 线宽激活索引

  // 支持的颜色
  final List<Color> supportColors = [
    Colors.black,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.pink,
    Colors.grey,
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.yellowAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.indigoAccent,
    Colors.purpleAccent,
    Colors.pinkAccent,
    Colors.white,
  ];

  // 支持的线粗
  final List<double> supportStorkWidths = [1, 2, 4, 6, 8, 10];

  List<Line> _historyLines = [];

  void _back() {
    Line line = _lines.removeLast();
    _historyLines.add(line);
    setState(() {});
  }

  void _revocation() {
    Line line = _historyLines.removeLast();
    _lines.add(line);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return  Listener(
      onPointerDown: (PointerDownEvent event) async {
        // if (event.buttons == kPrimaryButton) {
        //   print('Left button clicked');
        //   await windowManager.startDragging();
        // } else
         if (event.buttons == kSecondaryButton) {
          print('Right button clicked');

Navigator.pop(context,true);
        }
      }, 
          child:
          GestureDetector( 
     
       onPanStart: (e) {
            windowManager.startDragging();
          },
          
           child:
    Scaffold(
      backgroundColor: color,
      appBar: PaperAppBar(
        onClear: _showClearDialog,
        onBack: _lines.isEmpty ? null : _back,
        onRevocation: _historyLines.isEmpty ? null : _revocation,
      ),
      body: Stack(
        children: [
          GestureDetector(
            onPanStart: _onPanStart,
            onPanUpdate: _onPanUpdate,
            child: CustomPaint(
              painter: PaperPainter(lines: _lines),
              child: ConstrainedBox(constraints: const BoxConstraints.expand()),
            ),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  child: ColorSelector(
                    supportColors: supportColors,
                    activeIndex: _activeColorIndex,
                    onSelect: _onSelectColor,
                  ),
                ),
                StorkWidthSelector(
                  supportStorkWidths: supportStorkWidths,
                  color: supportColors[_activeColorIndex],
                  activeIndex: _activeStorkWidthIndex,
                  onSelect: _onSelectStorkWidth,
                ),
              ],
            ),
          ),
        ],
      ),
      ),
      ),
    );
  }

  void _showClearDialog() {
    String msg = "您的当前操作会清空绘制内容，是否确定删除!";
    showDialog(
        context: context,
        builder: (ctx) => ConformDialog(
              title: '清空提示',
              conformText: '确定',
              msg: msg,
              onConform: _clear,
            ));
  }

  void _clear() {
    _lines.clear();
    Navigator.of(context).pop();
    setState(() {});
  }

  void _onPanStart(DragStartDetails details) {
    _lines.add(Line(
      points: [details.localPosition],
      strokeWidth: supportStorkWidths[_activeStorkWidthIndex],
      color: supportColors[_activeColorIndex],
    ));
  }

  void _onPanUpdate(DragUpdateDetails details) {
    Offset point = details.localPosition;
    double distance = (_lines.last.points.last - point).distance;
    if (distance > 5) {
      _lines.last.points.add(details.localPosition);
      setState(() {});
    }
  }

  void _onSelectStorkWidth(int index) {
    if (index != _activeStorkWidthIndex) {
      setState(() {
        _activeStorkWidthIndex = index;
      });
    }
  }

  void _onSelectColor(int index) {
    if (index != _activeColorIndex) {
      setState(() {
        _activeColorIndex = index;
      });
    }
  }

}

class PaperPainter extends CustomPainter {
  PaperPainter({
    required this.lines,
  }) {
    _paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
  }

  late Paint _paint;
  final List<Line> lines;

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < lines.length; i++) {
      drawLine(canvas, lines[i]);
    }
  }

  ///根据点位绘制线
  void drawLine(Canvas canvas, Line line) {
    _paint.color = line.color;
    _paint.strokeWidth = line.strokeWidth;
    canvas.drawPoints(PointMode.polygon, line.points, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
