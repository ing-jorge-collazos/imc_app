import 'dart:async';
import 'package:flutter/material.dart';
import 'package:imc_app/pages/imc_data.dart';

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset('lib/img/logo_udenar.jpg'),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _user = TextEditingController();
  final _pass = TextEditingController();

  bool _validate = false;

  String usuario = 'admin';
  String pass = '123abc';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("IMC: Indice de Masa Corporal")),
        body: ListView(children: [
          TextField(
            controller: _user,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              hintText: 'Usuario',
              labelText: 'Digite su usuario',
              icon: Icon(Icons.account_circle),
              errorText: _validate ? 'El valor no puede estar vacio' : null,
            ),
          ),
          Divider(),
          TextField(
            controller: _pass,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              hintText: 'Usuario',
              labelText: 'Contraseña',
              icon: Icon(Icons.account_circle),
              errorText: _validate ? 'El valor no puede estar vacio' : null,
            ),
          ),
          RaisedButton(
              child: Text('Ingresar'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ImcData()));

                setState(() {
                  _user.text.isEmpty ? _validate = true : _validate = false;
                });
              })
        ]));
  }
}
