import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:pie_chart/pie_chart.dart';
enum Gender { MALE, FEMALE, OTHER }
double bmi = 0;
int currentvalue =1;
double _lowerValue = 0;
double _higherValue = 0;
double height;
String ans="";
var c1 = Colors.white70;
var c2 = Colors.white70;
var c3 = Colors.white70;
var c4 = Colors.white70;
String type="";
final my = TextEditingController();
String name="";
class bmical extends StatefulWidget{
  @override
  _bmicalState createState() => _bmicalState();
  Map<String, double> dataMap = new Map();

}

class _bmicalState extends State<bmical> {
  @override
  Gender _genderValue = Gender.MALE;
  Widget build(BuildContext context) {
    // TODO: implement build
    final theme = Theme.of(context);


    return new Scaffold(
      appBar: new AppBar(
        title: Text("BMI CALCULATOR",
          style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body:
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: 500,
          child: new Column(
            children: <Widget>[
              new Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                color: Colors.indigo,
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Container(
                        width: 400,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: new TextField(
                            controller: my,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              hintText: "Enter Your Name",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              new Row(
                children: <Widget>[
                  new Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: Colors.pink,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text("Gender",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3,
                                fontSize: 20
                            ),),
                        ),
                        new Container(
                          width: 150,
                          height: 200,
                          alignment: Alignment.center,
                          child: new Container(
                            width: 140,
                            height: 170,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.indigo,
                            ),
                            child: Align(alignment: Alignment.centerLeft,
                              child: new Column(
                                children: <Widget>[
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10),
                                      child: new FlatButton.icon(
                                        label: const Text("Male",
                                        style: TextStyle(
                                          color: Colors.white
                                        ),),
                                        icon: Radio(value: Gender.MALE,
                                            groupValue: _genderValue,
                                            activeColor: Colors.pink,
                                            onChanged: (Gender value) {
                                              setState(() {
                                                _genderValue = value;
                                              });
                                            }),
                                        onPressed: () {
                                          setState(() {
                                            _genderValue = Gender.MALE;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: new FlatButton.icon(
                                      label: const Text("Female",
                                          style: TextStyle(
                                              color: Colors.white
                                          )),
                                      icon: Radio(value: Gender.FEMALE,
                                          groupValue: _genderValue,
                                          activeColor: Colors.pink,
                                          onChanged: (Gender value) {
                                            setState(() {
                                              _genderValue = value;
                                            });
                                          }),
                                      onPressed: () {
                                        setState(() {
                                          _genderValue = Gender.FEMALE;
                                        });
                                      },
                                    ),
                                  ),
                                  new FlatButton.icon(
                                    label: const Text('Others',
                                        style: TextStyle(
                                            color: Colors.white
                                        )),
                                    icon: Radio(value: Gender.OTHER,
                                        groupValue: _genderValue,
                                        activeColor: Colors.pink,
                                        onChanged: (Gender value) {
                                          setState(() {
                                            _genderValue = value;
                                          });
                                        }),
                                    onPressed: () {
                                      setState(() {
                                        _genderValue = Gender.OTHER;
                                      });
                                    },
                                  ),

                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)
                    ),
                    color: Colors.pink,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Text("Weight (kg) ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 3,
                                  fontSize: 20,
                                  color: Colors.white

                              )
                          ),
                          new Container(
                            width: 228,
                            height: 200,
                            child: Column(
                              children: <Widget>[
                                new Container(
                                  width: 150,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.indigo
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: new Column(
                                      children: <Widget>[
                                        new Theme(
                                          data: theme.copyWith(
                                            accentColor: Colors.pink,
                                            textTheme: theme.textTheme.copyWith(
                                                body1: theme.textTheme.headline.copyWith(
                                                  color: Colors.white
                                                )
                                            )
                                          ),
                                          child: new NumberPicker.horizontal(
                                              initialValue: currentvalue,
                                              minValue: 0,
                                              maxValue: 200,
                                              highlightSelectedValue: true,
                                              onChanged: (newValue) =>
                                                  setState(() {
                                                    currentvalue=newValue;
                                                  })
                                              ),
                                        ),

                                      ],

                                    ),
                                  ),
                                ),
                              ],
                            ),

                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              Row(
                children: <Widget>[
                  new Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)
                    ),
                    color: Colors.indigo,
                    child: new Container(
                      width: 100,
                      height: 400,
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20,top:10),
                              child: new Text("Height (Cm)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 3,
                                      fontSize: 16,
                                      color: Colors.white

                                  )
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 325,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(right:15.0),
                                  child: new FlutterSlider(
                                    values: [300],
                                    axis: Axis.vertical,
                                    max: 300,
                                    rtl: true,
                                    min: 50,
                                    handlerAnimation: FlutterSliderHandlerAnimation(
                                        curve: Curves.elasticOut,
                                        reverseCurve: Curves.bounceIn,
                                        duration: Duration(milliseconds: 500),
                                        scale: 1.5
                                    ),
                                    tooltip: FlutterSliderTooltip(
                                        textStyle: TextStyle(fontSize: 17, color: Colors.white),
                                        boxStyle: FlutterSliderTooltipBox(
                                            decoration: BoxDecoration(
                                                color: Colors.pink
                                            )
                                        )
                                    ),
                                    trackBar: FlutterSliderTrackBar(
                                      inactiveTrackBar: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.black12,
                                        border: Border.all(width: 50, color: Colors.pink),
                                      ),
                                      activeTrackBar: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: Colors.pink
                                      ),
                                    ),
                                    onDragging: (handlerIndex, lowerValue, upperValue) {
                                      _lowerValue = lowerValue;
                                      _higherValue = upperValue;
                                      setState(() {
                                        change();
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          new Text("$_lowerValue",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 3,
                                  fontSize: 16,
                                  color: Colors.white

                              ))
                        ],
                      ) ,
                    ),
                  ),
                  new Card(
                    color: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: new Container(
                      width: 290,
                      height: 400,
                      child: new Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top:20.0),
                            child: new Text("!!RESULT!!",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                        fontSize: 20,
                        color: Colors.indigo)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:30,left: 10),
                            child: new Text("$ans",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 3,
                                    fontSize: 20,
                                    color: Colors.pink)
                              ),
                          ),
                          Container(
                            width: 290,
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20.0),
                              child: new Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                color: Colors.indigo,
                                child: Center(
                                  child: new Text("UnderWeight- Below 18.4",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 3,
                                      fontSize: 16,
                                      color:c1
                                  ),),
                                ),
                              ),
                            ),
                          ),
                          new Container(
                            width: 290,
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20.0),
                              child: new Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                color: Colors.indigo,
                                child: Center(
                                  child: new Text("Normal - 18.5-24.9",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 3,
                                        fontSize: 16,
                                        color:c2
                                    ),),
                                ),
                              ),
                            ),

                          ),
                          Container(
                            width: 290,
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20.0),
                              child: new Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                color: Colors.indigo,
                                child: Center(
                                  child: new Text("OverWeight- 25.0-29.9",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 3,
                                        fontSize: 16,
                                        color:c3
                                    ),),
                                ),
                              ),
                            ),

                          ),
                          Container(
                            width: 290,
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.only(top:20.0),
                              child: new Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                color: Colors.indigo,
                                child: Center(
                                  child: new Text("Obese -Above 30.0",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 3,
                                        fontSize: 16,
                                        color:c4
                                    ),),
                                ),
                              ),
                            ),

                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  changed(newValue) {
    setState(() {
      currentvalue = newValue;
    });
  }

  change() {
    name = my.text;
    double h = (_lowerValue / 100);
    bmi = (currentvalue /(h * h));
    ans = "Hello $name ,your BMI is $bmi";
    if(bmi<18.5)
      {
        setState(() {
          c1=Colors.pink;
          c2=Colors.white70;
          c3=Colors.white70;
          c4=Colors.white70;
        });
      }
   else if(bmi>18.6 && bmi<=24.9)
    {
      setState(() {
        c1=Colors.white70;
        c2=Colors.pink;
        c3=Colors.white70;
        c4=Colors.white70;
      });
    }
    else if(bmi>=25.0 && bmi<=29.9)
    {
      setState(() {
        c1=Colors.white70;
        c2=Colors.white70;
        c3=Colors.pink;
        c4=Colors.white70;
      });
    }
    else{
      setState(() {
        c1=Colors.white70;
        c2=Colors.white70;
        c3=Colors.white70;
        c4=Colors.pink;
      });
    }
    }

  }
