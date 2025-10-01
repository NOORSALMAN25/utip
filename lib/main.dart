import 'package:flutter/material.dart';

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
  //methods
  void increment(){
    setState(() {
      _personCounter = _personCounter + 1;
    });
  }


  void decrement(){
    setState(() {
      if(_personCounter > 0){
        _personCounter = _personCounter - 1;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Total per person',
                    style: style,
                  ),
                  Text('\$23.44' , 
                  style: style.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontSize: theme.textTheme.displaySmall?.fontSize
                  ),
                  
                  ),
                ],
              ),
            ),
          ),

          // form
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: theme.colorScheme.primary,
                    width: 2
                  ),
                ),
                child:  Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged:(String value) {
                        print("Value entered: $value");
                      } ,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Bill Amount',
                        prefixIcon: Icon(Icons.attach_money),
                        
                      ),
                    ),
                    //split bill area
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                      children: [
                      Text('Split' , style: theme.textTheme.titleMedium,),
                      Row(
                        children: [
                          IconButton(
                            color: theme.colorScheme.primary,
                            onPressed: decrement
                          , icon: const Icon(Icons.remove)),
                          Text("$_personCounter" , style:theme.textTheme.titleMedium ,),
                          IconButton(
                            color: theme.colorScheme.primary,
                            onPressed: increment, icon: const Icon(Icons.add))
                        ],
                      )


                    ],)
                  ],
                ),
              ),
          ),
          
        ],
      ),
    );
  }
}
