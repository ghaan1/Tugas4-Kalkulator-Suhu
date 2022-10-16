import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
  var items = [   
    'Kelvin',
    'Reamor',
    'Farenheit',
  ];

  String dropdownvalue = 'Kelvin';  
  String? selectedValue;
  double celcius = 0;
  double kelvin = 0;
  double reamor = 0;
  double farenheit = 0;
  double output = 0;
  String valueList = '';
  List<String> listViewItem1 = <String>[];
  List<String> valueDropDown = <String>[];
  TextEditingController inputSuhu = TextEditingController();

  konversi() {
    setState(() {
      celcius = double.parse(inputSuhu.text);
      if(dropdownvalue == 'Kelvin'){
        output = 273.15 + celcius;
        reamor = 0;
        farenheit = 0;
        kelvin = output;
        valueList = dropdownvalue;
      }else if(dropdownvalue == 'Reamor'){
        output = 4 / 5 * celcius;
        farenheit = 0;
        kelvin = 0;
        reamor = output;
        valueList = dropdownvalue;
      }else{
        output = (9/5 *celcius) + 32;
        reamor = 0;
        kelvin = 0;
        farenheit = output;
        valueList = dropdownvalue;
      }
      listViewItem1.add('$output');
      valueDropDown.add(valueList);
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muhammad Ghani',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: 
          Scaffold(
            resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: const Text('Konversi Suhu'),
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
              const Expanded(
                flex: 0,
                child: Text('Riwayat Konversi',
                style: 
                  TextStyle(
                    fontSize: 20
                  ),
                ),
              ),
              const SizedBox(
                      height: 15,
                    ),
              Expanded(
                flex: 2,
                child: 
                  listHasil(),
              ),
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
      value: dropdownvalue,
      icon: const Icon(Icons.keyboard_arrow_down),   
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
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
              const Text('Suhu dalam Reamur', style: TextStyle(
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
              const Text('Suhu dalam \nFahrenheit', style: TextStyle(
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

  listHasil(){
  return SizedBox( 
  height: 120,
  child: ListView.builder(
    shrinkWrap: true,
    itemCount: listViewItem1.length,
    itemBuilder: (context, index) => 
    Container(
       decoration: BoxDecoration(
        border: Border.all(color: Colors.lightBlueAccent)
      ),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: 
      Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Text((index+1).toString())
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Expanded(
              flex: 2,
              child:  
                Text(valueDropDown.elementAt(index)),
              ),
              const Expanded(
                flex: 1,
                child : 
                  Text('='),
              ),
              Expanded(
                flex: 2,
                child : 
                  Text(listViewItem1.elementAt(index))
                ),
              ],
            ),
          ),
        ]
      ),
    ),
  ),
  );
  }
}
