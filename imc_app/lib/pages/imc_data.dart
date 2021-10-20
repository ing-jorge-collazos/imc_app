import 'package:flutter/material.dart';

class ImcData extends StatefulWidget {
  @override
  _ImcDataState createState() => _ImcDataState();
}

class _ImcDataState extends State<ImcData> {
  final _peso = TextEditingController();
  final _estatura = TextEditingController();

  String _pesoUsuario = '';
  String _estaturaUsuario = '';

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
              // counter: Text('Letras ${_nombre.length}'),

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
              // counter: Text('Letras ${_nombre.length}'),

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
            _pesoUsuario = _peso.text;
            _estaturaUsuario = _estatura.text;

            print(_estaturaUsuario);
            print(_pesoUsuario);

            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // Recupera el texto que el usuario ha digitado utilizando nuestro
                  // TextEditingController
                  content: Text(_peso.text),
                );
              },
            );
          }),
    );
  }
}
