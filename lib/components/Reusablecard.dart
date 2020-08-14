import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
      ReusableCard({this.cardchild ,this.colour,this.onpress, Color Color});
    final Color colour;
    final  Widget cardchild;
    final Function onpress;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(15.0),
          color: colour
        ),
      ),
      
    );
  }
}