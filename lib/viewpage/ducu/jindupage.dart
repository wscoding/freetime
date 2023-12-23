import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  late Future<Map<String, dynamic>> _data;

  @override
  void initState() {
    super.initState();
    _data = fetchData();
  }

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http
        .get(Uri.parse('http://zt.999087.com/app/lingdong/ducu.json'));

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('开发进度'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            Map<String, dynamic> data = snapshot.data!;
            List<dynamic> widgets = data['widgets'];
            String jindu = data['jindu'];
            String timedata = data['timedata'];
            String version = data['version'];

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(jindu,
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text('日期: $timedata', style: TextStyle(fontSize: 18)),
                Text('版本: $version', style: TextStyle(fontSize: 18)),
                Expanded(
                  child: ListView.builder(
                    itemCount: widgets.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> widgetData = widgets[index];
                      String name = widgetData['name'];
                      String schedule = widgetData['schedule'];
                      String color = widgetData['color'];
                      String beizhu =
                          widgetData['beizhu'] ?? ""; // Add beizhu here
                      String timsee = widgetData['timsee']?.toString() ??
                          ""; // Convert to string if not null
                      List<dynamic> gradeInfo =
                          widgetData['grade'] ?? []; // Grade information

                      // Remove '%' character from schedule before parsing as double
                      double progress =
                          double.parse(schedule.replaceAll('%', '')) / 100;

                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(name),
                            Text(
                                '${widgetData['schedule']}'), // Display percentage
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LinearProgressIndicator(
                              value: progress,
                              backgroundColor: Colors.grey[200],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                getColor(color),
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                    '等级: ${gradeInfo.isNotEmpty ? gradeInfo[0] : ""}'),
                                SizedBox(
                                    width: 16), // Adjust the width as needed
                                Text(
                                    '难度: ${gradeInfo.length > 1 ? gradeInfo[1] : ""}'),
                              ],
                            ),
                            Row(
                              children: [
                                Text('备注: $beizhu'),
                                SizedBox(
                                    width: 16), // Adjust the width as needed

                                Text('日期: $timsee'),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _data = fetchData();
            });
          },
          child: Text('刷新'),
        ),
      ),
    );
  }

  Color getColor(String color) {
    switch (color) {
      case 'green':
        return Colors.green;
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      default:
        return getColorFromHex(color);
    }
  }

  Color getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    int val = int.parse(hexColor, radix: 16);
    return Color(val);
  }
}

void main() {
  runApp(MaterialApp(
    home: ProgressPage(),
  ));
}
