import 'package:BMIcalci/constants.dart';
import 'package:flutter/material.dart';
class Bottombutton extends StatelessWidget {
  Bottombutton({@required this.onTap, @required this.buttontitle});
 final String buttontitle;
 final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: onTap,
     child: Container(
       child: Center(child: Text(buttontitle,style: KLargeButtonTextStyle),),
       color: KBottomContainerColor,
       margin: EdgeInsets.only(top: 10.0),
       padding: EdgeInsets.only(bottom:20.0),
       width: double.infinity,
       height: KBottomContainerHeight,
     ),
    );
  }
}