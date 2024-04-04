import 'dart:math';

import 'package:flutter/material.dart';

class Produtos extends StatelessWidget {
  const Produtos({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  TextEditingController nomeController = new TextEditingController();
  TextEditingController precoController = new TextEditingController();
  String _textoInfo = "Informe os dados";

  void _limpar_Tela() {
    nomeController.text = "";
    precoController.text = "";
    setState(() {
      _textoInfo = "Informe os dados";
    });
  }

  void _cadatrar() {
    nomeController.text = "";
    precoController.text = "";
    setState(() {
      _textoInfo = "Dados cadastrado com sucesso!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Cadastro de Produtos"),
          centerTitle: true,
          backgroundColor: Colors.purple,
          actions: <Widget>[
            IconButton(onPressed: _limpar_Tela, icon: Icon(Icons.refresh))
          ]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(
              Icons.person_outline,
              size: 120.0,
              color: Colors.purple,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(color: Colors.purpleAccent)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: nomeController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Preço",
                  labelStyle: TextStyle(color: Colors.deepPurple)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              obscureText: true,
              controller: precoController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height: 50.0,
                child: ElevatedButton(
                    onPressed: _cadatrar,child: const Text("Calcular")),
              ),
            ),
            Text(_textoInfo,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25.0)),
          ],
        ),
      ),
    );
  }
}