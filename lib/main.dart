import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  double celcius = 0;
  double kelvin = 0;
  double reamor = 0;
  TextEditingController inputSuhu = TextEditingController();
  
  konversi() {
    setState(() {
      celcius = double.parse(inputSuhu.text);
      reamor = 4 / 5 * celcius;
      kelvin = 273.15 + celcius;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator'),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            inputan(),
            OutputSuhu(),
            ButtonSubmit(),
          ],
        ),
      )
      )
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

  OutputSuhu(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(            
          children: [
            const Text('Suhu dalam Reamor', style: TextStyle(
              fontSize: 15
            ),),
            const SizedBox(height :20),
            Text("$reamor", style: const TextStyle(
              fontSize: 25
            ),)
          ],
        ),
        
        Column(
          children: [
            const Text('Suhu dalam Kelvin', style: TextStyle(
              fontSize: 15
            ),),
            const SizedBox(height :20),
            Text("$kelvin", style: const TextStyle(
              fontSize: 25
            ),)
          ],
        ),
      ],
    );
  }

  ButtonSubmit(){
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: const Text('Submit'),
        onPressed: () => konversi(),
      )
    );
  }
}
