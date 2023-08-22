import '../../../../export.dart';

class Line {
  List<Offset> points;
  Color color;
  double strokeWidth;

  Line({
    required this.points,
    this.color = Colors.black,
    this.strokeWidth = 1,
  });

}