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
              hintText: 'ejemplo: 70.5',
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
              hintText: 'ejemplo: 1.80',
              labelText: 'Estatura',
              helperText: '(Mts)',
              suffixIcon: Icon(Icons.accessibility),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.accessibility_new),
          onPressed: () {
            _pesoUsuario = double.parse(_peso.text);
            _estaturaUsuario = double.parse(_estatura.text);
            _imcUsuario = _pesoUsuario / (_estaturaUsuario * _estaturaUsuario);

            if (_imcUsuario < 18.5) {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Recupero el texto del TextEditingController
                    content: Text('indice de masa corporal: ' +
                        _imcUsuario.toStringAsFixed(2) +
                        'Bajo de Peso'),
                  );
                },
              );
            } //cierre condicion

            if (_imcUsuario >= 18.5 && _imcUsuario < 24.9) {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Recupero el texto del TextEditingController
                    content: Text('indice de masa corporal: ' +
                        _imcUsuario.toStringAsFixed(2) +
                        'Peso Normal'),
                  );
                },
              );
            } //cierre condicion

            if (_imcUsuario >= 25 && _imcUsuario < 29.9) {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Recupero el texto del TextEditingController
                    content: Text('indice de masa corporal: ' +
                        _imcUsuario.toStringAsFixed(2) +
                        'Esta en Sobrepeso'),
                  );
                },
              );
            } //cierre condicion

            if (_imcUsuario >= 30) {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Recupero el texto del TextEditingController
                    content: Text('indice de masa corporal: ' +
                        _imcUsuario.toStringAsFixed(2) +
                        'Su condicion es Obesidad'),
                  );
                },
              );
            } //cierre condicion
          }),
    );
  }
}
