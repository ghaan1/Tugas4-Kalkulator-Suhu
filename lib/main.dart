import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

      
}

class _MyAppState extends State<MyApp> {
  String dropdownvalue = 'Kelvin';  
  String? selectedValue;
  var items = [   
    'Kelvin',
    'Reamor',
    'Farenheit',
  ];
  double celcius = 0;
  double kelvin = 0;
  double reamor = 0;
  double farenheit = 0;
  double output = 0;


  TextEditingController inputSuhu = TextEditingController();

  konversi() {
    setState(() {
      celcius = double.parse(inputSuhu.text);
      if(dropdownvalue == 'Kelvin'){
        output = 273.15 + celcius;
        reamor = 0;
        farenheit = 0;
        kelvin = output;
      }else if(dropdownvalue == 'Reamor'){
        output = 4 / 5 * celcius;
        reamor = output;
        farenheit = 0;
        kelvin = 0;
      }else{
        output = (9/5 *celcius) + 32;
        reamor = 0;
        farenheit = output;
        kelvin = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: 
          Scaffold(
            resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: const Text('Kalkulator'),
              ),
        body: 
          Column(
            children: <Widget>[ 
              Expanded(
              flex: 2,
              child : 
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child : 
                    Expanded(
                      child : 
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children : [ 
                            Container(
                              child : inputan()
                            ),
                            Container(
                              child : dropDown(),
                            ),
                            Container(
                              child : outputSuhu(),
                            ),
                            Container(
                              child : buttonSubmit(),
                            ),
                          ],
                        ),
                    ),
                ),
            ),
            const Expanded(
              flex: 0,
              child: Text('Riwayat Konversi'),
            ),
            Expanded(
              flex: 2,
              child: 
                ListView(
                  children: [
                    // outputSuhu(),
                    // outputSuhu(),
                    // outputSuhu(),
                    // outputSuhu(),
                    // outputSuhu(),
                    // outputSuhu(),
                    // outputSuhu(),
                    // outputSuhu(),
                  ],
                ),
            )
            ],
            
          ),
      ),
    );
  }

  inputan(){
    return TextFormField(
      controller: inputSuhu,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Masukan Suhu Dalam Celcius',
      ),
    );
  }

  dropDown(){
    return DropdownButton(
              // Initial Value
              value: dropdownvalue,
               
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),   
               
              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            );
  }

  outputSuhu(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
          child: Column(            
            children: [
              const Text('Suhu dalam Reamor', style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center),
              const SizedBox(height :20),
              Text("$reamor", style: const TextStyle(
                fontSize: 25
              ),)
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const Text('Suhu dalam \nKelvin', style: TextStyle(
                fontSize: 15
              ),
              textAlign: TextAlign.center,),
              const SizedBox(height :20),
              Text("$kelvin", style: const TextStyle(
                fontSize: 25
              ),)
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const Text('Suhu dalam \nFarenheit', style: TextStyle(
                fontSize: 15
              ),
              textAlign: TextAlign.center),
              const SizedBox(height :20),
              Text("$farenheit", style: const TextStyle(
                fontSize: 25
              ),
              )
            ],
          ),
        ),
      ],
    );
  }

  buttonSubmit(){
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: const Text('Submit'),
        onPressed: () => konversi(),
      )
    );
  }
}
