import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.backgroundColor, this.cardChild, this.onPressed});
  final Color backgroundColor;
  final Widget cardChild;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          child: cardChild,
          decoration: BoxDecoration(
              color: backgroundColor, borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(10)),
    );
  }
}
