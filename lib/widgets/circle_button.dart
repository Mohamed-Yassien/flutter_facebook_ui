import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {

  CircleButton({
    @required this.iconData,
    @required this.iconSize,
    @required this.onPressed
});

  final IconData iconData;
  final double iconSize;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle
      ),
      child: IconButton(
        icon: Icon(iconData,color: Colors.black,),
        iconSize: iconSize,
        onPressed: onPressed,
      ) ,
    );
  }
}
