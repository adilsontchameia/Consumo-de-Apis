import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Metodo de Recuperar CEP
  //Comunicacao Sincrona e Assincrona
  //Sincrona: Comunicacao instantanea (exe: conversa cara cara)
  //Assincrona: Comunicacao por sms (com um intermediario), precisa de tempo.
  void _RecuperarCep() async {
    //Metodo Ansicrono
    /*
    String cep = "01001000";
    //URL
    String url = "https://viacep.com.br/ws/${cep}/json/";
    */

    //URL CEP
    String url = "https://viacep.com.br/ws/01001000/json/";
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

    //print("Resposta: " ${logradouro});

    //print("Codigo: " + response.statusCode.toString());
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
