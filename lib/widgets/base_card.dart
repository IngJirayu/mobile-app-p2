import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  BaseCard({required this.theColor, required this.theChild, this.theOnTapFunc});

  // instance variable
  final Color theColor;
  final Widget theChild;
  final VoidCallback? theOnTapFunc; // function as a variable..nullable

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: theOnTapFunc,
      child: Container(
        child: theChild,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: theColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
