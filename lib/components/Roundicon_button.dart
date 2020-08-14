import 'package:flutter/material.dart';
class   RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon,@required this.onPressed});
final IconData icon;
final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child:Icon(icon),
      onPressed:onPressed,
      elevation:0.0,
      constraints:BoxConstraints.tightFor(
        height:40,
        width:30,
      ),
      shape: CircleBorder(),
      fillColor:Color(0xFF4C4F5E)
    );
  }
}