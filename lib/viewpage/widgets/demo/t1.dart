import 'package:analog_clock_picker/analog_clock_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';




class sz extends StatefulWidget {
  const sz({Key? key}) : super(key: key);

  @override
  State<sz> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<sz> {
  AnalogClockController analogClockController = AnalogClockController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Analog clock picker / 拖动时钟和分针",
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnalogClockPicker(
              clockBackground: Image.asset(
                "lib/assets/clock_background.png",
              ),
              clockBackgroundColor: Colors.white,
              secondHandleColor: Colors.red,
              minutesHandleColor: Colors.black,
              hourHandleColor: Colors.black,
              controller: analogClockController,
              size: MediaQuery.of(context).size.width * 0.68,
            ),
            ValueListenableBuilder<DateTime>(
              valueListenable: analogClockController,
              builder: (context, value, _) {
                return Container(
                  margin: const EdgeInsets.only(top: 42),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: Text(
                          DateFormat("HH:mm").format(value),
                          style: const TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          analogClockController.setPeriodType(
                            analogClockController.periodType == PeriodType.am
                                ? PeriodType.pm
                                : PeriodType.am,
                          );
                        },
                        child: Text(
                          analogClockController.periodType == PeriodType.am
                              ? "AM"
                              : "PM",
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}