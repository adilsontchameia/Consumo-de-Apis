import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Recuperar CEP
  void _RecuperarCep() {
    //CEP
    String cep = "01001000";
    //URL
    String url = "https://viacep.com.br/ws/${cep}/json/";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de APIS"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            RaisedButton(
              child: Text("Recuperar CEP"),
              onPressed: _RecuperarCep,
            )
          ],
        ),
      ),
    );
  }
}
