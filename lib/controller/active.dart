import '../export.dart';
class ClockWidgets extends StatelessWidget {
  final Color handColor;
  final Color numberColor;
  final Color borderColor;
  final DateTime datetime;
  final Color color;
  final double strokeWidth;
  final double width;
  final double height;

  ClockWidgets(
    this.datetime, {
    this.handColor = Colors.black,
    this.numberColor = Colors.black,
    this.borderColor = Colors.black,
    this.color = Colors.blue,
    this.strokeWidth = 1.0,
    this.width = 100,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
        double radius = min(width, height) * 0.5;

    return CustomPaint(
      size: Size(width, height),
      painter: ClockPainter(
        
        datetime,
        handColor: handColor,
        numberColor: numberColor,
        borderColor: borderColor,
        color: color,
        strokeWidth: strokeWidth, radius: radius,
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final DateTime dateTime;
  final Color handColor;
  final Color numberColor;
  final Color borderColor;
  final Color color;
  final double strokeWidth;

  ClockPainter(
    this.dateTime, {
    this.handColor = Colors.black,
    this.numberColor = Colors.black,
    this.borderColor = Colors.black,
    this.color = Colors.blue,
    this.strokeWidth = 1.0, required double radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final center = Offset(radius, radius);

    // Calculate the position of the hour hand
    final hour = dateTime.hour % 12;
    final hourAngle = (hour * pi / 6) + (dateTime.minute * pi / 360);
    final hourHandLength = radius * 0.4;
    final hourHand1 = center;
    final hourHand2 = center.translate(
      cos(hourAngle) * hourHandLength,
      sin(hourAngle) * hourHandLength,
    );

    // Calculate the position of the minute hand
    final minuteAngle = dateTime.minute * pi / 30;
    final minuteHandLength = radius * 0.6;
    final minuteHand1 = center;
    final minuteHand2 = center.translate(
      cos(minuteAngle) * minuteHandLength,
      sin(minuteAngle) * minuteHandLength,
    );

    // Calculate the position of the second hand
    final secondAngle = dateTime.second * pi / 30;
    final secondHandLength = radius * 0.8;
    final secondHand1 = center;
    final secondHand2 = center.translate(
      cos(secondAngle) * secondHandLength,
      sin(secondAngle) * secondHandLength,
    );

    // Draw the hour hand
    final hourPaint = Paint()
      ..color = handColor
      ..strokeWidth = strokeWidth * 2;
    canvas.drawLine(hourHand1, hourHand2, hourPaint);

    // Draw the minute hand
    final minutePaint = Paint()
      ..color = handColor
      ..strokeWidth = strokeWidth;
    canvas.drawLine(minuteHand1, minuteHand2, minutePaint);

    // Draw the second hand
    final secondPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = strokeWidth / 2;
    canvas.drawLine(secondHand1, secondHand2, secondPaint);

    // Draw the clock face
    final facePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, facePaint);

    // Draw the clock numbers
    final textStyle = TextStyle(
      color: numberColor,
      fontSize: radius / 6,
    );
    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    for (var i = 1; i <= 12; i++) {
      final numberAngle = i * pi / 6;
      final numberOffset = Offset(
        center.dx + cos(numberAngle) * radius * 0.85,
        center.dy + sin(numberAngle) * radius * 0.85,
      );
      textPainter.text = TextSpan(
        text: i.toString(),
        style: textStyle,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        numberOffset - Offset(textPainter.width / 2, textPainter.height / 2),
      );
    }

    // Draw the clock border
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth * 2;
    canvas.drawCircle(center, radius - strokeWidth, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Clock extends StatefulWidget {
  final Color handColor;
  final Color numberColor;
  final Color borderColor;
  final Color color;
  final double strokeWidth;
  final double size;

  Clock({
    this.handColor = Colors.black,
    this.numberColor = Colors.black,
    this.borderColor = Colors.black,
    this.color = Colors.blue,
    this.strokeWidth = 1.0,
    this.size = 200,
  });

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Timer _timer;
  late DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClockWidgets(
      _dateTime,
      handColor: widget.handColor,
      numberColor: widget.numberColor,
      borderColor: widget.borderColor,
      color: widget.color,
      strokeWidth: widget.strokeWidth,
      width: widget.size,
      height: widget.size,
    );
  }
}