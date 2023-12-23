import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class LoveAnimationPage extends StatefulWidget {
  @override
  _LoveAnimationPageState createState() => _LoveAnimationPageState();
}

class _LoveAnimationPageState extends State<LoveAnimationPage> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Love Animation Page'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleFavorite,
          child: _isFavorited
              ? RubberBand(
                  preferences: AnimationPreferences(
                    autoPlay: AnimationPlayStates.Forward,
                  ),
                  child: Icon(
    Icons.favorite,
                    color: Colors.red,
                    size: 300,
                  ),
                )
              : Icon(
                 Icons.favorite,
                  color: Colors.red,
                  size: 300,
                ),
        ),
      ),
    );
  }
}
