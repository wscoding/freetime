import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  final List<String> leftValues = ["a1", "b2", "c3", "d4"];
  final List<String> rightValues = ["rr", "tt"];

  String ? selectedValue =  "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Page"),
      ),
      body: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: leftValues.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  title: Text(leftValues[index]),
                  value: leftValues[index],
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: rightValues.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  title: Text(rightValues[index]),
                  value: rightValues[index],
                  groupValue: selectedValue,
                  onChanged: null,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, selectedValue);
        },
        child: Icon(Icons.check),
      ),
    );
  }
}