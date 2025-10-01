import 'package:flutter/material.dart';
import 'package:utip/widgets/bill_amount.dart';
import 'package:utip/widgets/person_counter.dart';
import 'package:utip/widgets/tip_row.dart';
import 'package:utip/widgets/tip_slider.dart';
import 'package:utip/widgets/total_per_person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTip',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int _personCounter = 1;
  
  double _tipPercentage = 0.0;
  double _billTotal = 0.0;

  double totalPerPerson() {
    return (_billTotal + (_billTotal * _tipPercentage)) / _personCounter;
  }
 
double totalTip() {
    return (_billTotal * _tipPercentage);
  }

  //methods
  void increment(){
    setState(() {
      _personCounter = _personCounter + 1;
    });
  }


  void decrement(){
    setState(() {
      if(_personCounter > 1){
        _personCounter = _personCounter - 1;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double total = totalPerPerson();
    double totalT = totalTip();
    //add style
    final style = theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.bold
    );
    return Scaffold(
      appBar: AppBar(title: const Text('UTip App')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TotalPerPerson(style: style, total: total, theme: theme),

          // form
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: theme.colorScheme.primary,
                    width: 2
                  ),
                ),
                child:  Column(
                  children: [
                    BillAmountField(
                      billAmount: _billTotal.toString(),
                      onChanged: (value){
                        setState(() {
                          _billTotal = double.parse(value);
                        });
                        // print('amount entered: $value');
                      },
                    ),
                    //split bill area
                    PersonCounter(theme: theme, personCounter: _personCounter, onDecrement: decrement, onIncrement:increment,),

                    //tip section
                    TipRow(theme: theme, totalT: totalT),
                    // slider text
                    Text('${(_tipPercentage*100).round()}%'),

                    //tip slider
                    TipSlider(
                      tipPercentage: _tipPercentage, onChanged: (double value) {
                      setState(() {
                        _tipPercentage = value;
                      });
                      },)


                  ],
                ),
              ),
          ),
          
        ],
      ),
    );
  }
}

