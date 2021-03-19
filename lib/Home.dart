import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerCep = TextEditingController();
  String _resultado = "Resultado";

  // Metodo de Recuperar CEP
  //Comunicacao Sincrona e Assincrona
  //Sincrona: Comunicacao instantanea (exe: conversa cara cara)
  //Assincrona: Comunicacao por sms (com um intermediario), precisa de tempo.
  void _RecuperarCep() async {
    //Metodo Ansicrono
    /*
    String cep = "04005020";
    //URL
    String url = "https://viacep.com.br/ws/${cep}/json/";
    */

    String cepDigitado = _controllerCep.text;

    //URL CEP
    String url = "https://viacep.com.br/ws/${cepDigitado}/json/";
    //Criando Requisicoes
    //Importando a biblioteca http: ^0.12.0+1 no pubspec.
    http.Response response; //

    //Recuperar os dados da web
    response = await http.get(url);
    //Converter a REQ em JSON
    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];
    String cep = retorno["cep"];

    setState(() {
      _resultado =
          "${logradouro}, ${complemento}, ${bairro}, ${localidade}, ${cep}";
    });

    print(
        "Resposta:  ${logradouro}, Complemento: ${complemento}, Bairro: ${bairro}, Localidade: ${localidade}, CEP: ${cep}.");
    //print("Resposta: " + response.body);
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
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Digite o CEP  ex: 123456"),
              style: TextStyle(fontSize: 20),
              controller: _controllerCep,
            ),
            RaisedButton(
              child: Text("Recuperar CEP"),
              onPressed: _RecuperarCep,
            ),
            Text(_resultado),
          ],
        ),
      ),
    );
  }
}
