import 'package:BMIcalci/constants.dart';
import 'package:flutter/material.dart';

import 'components/Bottom_button.dart';
import 'components/Reusablecard.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  ResultsPage({
    @required this.bmiResult,
    @required this.resultText,
    @required this.interpretation
  });
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI calculator"),
        
      ),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[
           Expanded(
             child: Container(
               padding: EdgeInsets.all(15),
               alignment: Alignment.bottomLeft,
             child:  Text("Your RESult",style: KTitleTextStyle,)
             ),
           ),
           Expanded(
             flex: 5,
             child: ReusableCard(
               colour:KActivecardColor,
               cardchild: Column(
                 mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                 crossAxisAlignment:CrossAxisAlignment.center,
                 children: <Widget>[
                   Text(resultText,style: KResultTextStyle,),
                   Text(bmiResult, style:kBMITextStyle,),
                   Text(interpretation,style: KBodyTextStyle,textAlign: TextAlign.center,)
                 ],
               ),
             ),
           ),
           Bottombutton(
             buttontitle:'RE-CALCULATE',
             onTap :() {
               Navigator.pop(context);
             }
           )
         ],
       ),
    );
  }
}