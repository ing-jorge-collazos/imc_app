import 'dart:ffi';

import 'package:flutter/material.dart';

class ImcData extends StatefulWidget {
  @override
  _ImcDataState createState() => _ImcDataState();
}

class _ImcDataState extends State<ImcData> {
  final _peso = TextEditingController();
  final _estatura = TextEditingController();

  double _pesoUsuario;
  double _estaturaUsuario;
  double _imcUsuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digite sus datos'),
      ),
      body: ListView(
        children: [
          Divider(),
          TextField(
            controller: _peso,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              labelText: 'Peso actual',
              helperText: '(KG)',
              suffixIcon: Icon(Icons.accessibility),
            ),
          ),
          Divider(),
          TextField(
            controller: _estatura,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              labelText: 'Estatura',
              helperText: '(Mts)',
              suffixIcon: Icon(Icons.accessibility),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.account_circle),
          onPressed: () {
            _pesoUsuario = double.parse(_peso.text);
            _estaturaUsuario = double.parse(_estatura.text);
            _imcUsuario = _pesoUsuario / (_estaturaUsuario * _estaturaUsuario);

            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // Recupero el texto del TextEditingController
                  content: Text('indice de masa corporal: $_imcUsuario'),
                );
              },
            );
          }),
    );
  }
}
