import 'package:BMIcalci/results_page.dart';
import 'package:flutter/material.dart';

import 'calculator_brain.dart';
import 'components/Bottom_button.dart';
import 'components/Reusablecard.dart';
import 'components/Roundicon_button.dart';
import 'components/icon_content.dart';
import 'constants.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
enum Gender{
  male,
  Female,
}

class _InputPageState extends State<InputPage> {

 Gender selectGender;
 int height=0;
 int weight=0;
 int age=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(
          child: Text("BMI calculator",style: TextStyle(fontWeight:FontWeight.bold),
        )
      ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child:Row(children: <Widget>[
              Expanded(child: ReusableCard(
                onpress:(){
                  setState((){
                    selectGender=Gender.male;
                  });
                },
                colour: selectGender == Gender.male ?KActivecardColor:KInactivecardColor,
                cardchild: IconContent(
                  icon:FontAwesomeIcons.mars,
                  label:'Male'
                ),
              )),
              Expanded(child: ReusableCard(
                onpress:(){
                  setState((){
                    selectGender=Gender.Female;
                  });
                },
                colour: selectGender == Gender.Female?KActivecardColor:KInactivecardColor,
                cardchild: IconContent(
                  icon:FontAwesomeIcons.venus,
                  label:'female'
                ),
              ))
              
            ],
          ),
          ),
            Expanded(
              child: ReusableCard(
                colour:  KActivecardColor,
                cardchild:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Height",style: KLabelTextStyle,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.baseline,
                       textBaseline: TextBaseline.alphabetic,
                       children: <Widget>[
                         Text(
                         height.toString(),
                         style: KNumberTextStyle,
                         ),
                         Text("cm",style: KLabelTextStyle,)
                       ],
                       ),
                       SliderTheme(
                         data: SliderTheme.of(context).copyWith(
                           inactiveTrackColor:Color(0xFF808E98),
                           activeTrackColor:Colors.white,
                           thumbColor:Colors.blue,
                           thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                           overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                         ),
                         child: Slider(value: height.toDouble(),
                         min: 0,max: 220.0,
                          onChanged: (double newvalue){
                            setState((){
                              height=newvalue. round();
                            });
                          }),
                       )

                  ],
                                 ) ,),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: ReusableCard(Color:KActivecardColor,
                  cardchild: Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children:<Widget>[
                      Text("Weight",style:KLabelTextStyle,),
                      Text(weight.toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon:Icons.add,
                            onPressed:(){
                              setState(() {
                                weight++;
                              });
                            }
                          ),
                          SizedBox(width: 20.0,),
                          RoundIconButton(
                            icon:FontAwesomeIcons.minus,
                            onPressed:(){
                              setState(() {
                                weight--;
                              });
                            }
                          ),
                        ],
                      )
                    ]
                  ),
                  ),),
                    Expanded(child: ReusableCard(Color:KActivecardColor,
                  cardchild: Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children:<Widget>[
                      Text("Age",style:KLabelTextStyle,),
                      Text(age.toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon:Icons.add,
                            onPressed:(){
                              setState(() {
                                age++;
                              });
                            }
                          ),
                          SizedBox(width: 20.0,),
                          RoundIconButton(
                            icon:FontAwesomeIcons.minus,
                            onPressed:(){
                              setState(() {
                                age--;
                              });
                            }
                          ),
                        ],
                      )
                    ]
                  ),
                  ),)
                
                ],
              )
            
              ),  
            
      
      Bottombutton(
        buttontitle:'Calculate',
        onTap:(){
         CalculatorBrain calc=CalculatorBrain(height:height,weight:weight) ;
         Navigator.push(context,MaterialPageRoute(builder: (context)=>ResultsPage(
         bmiResult:calc.calculateBMI(),
         resultText:calc.getResult(),
         interpretation:calc.getInterpretation(),
         )
           )  ); }
          )
        ],)
    );
  }
}