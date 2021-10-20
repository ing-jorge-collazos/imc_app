import 'package:flutter/material.dart';

class ImcData extends StatefulWidget {
  @override
  _ImcDataState createState() => _ImcDataState();
}

class _ImcDataState extends State<ImcData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcular IMC'),
      ),
    );
  }
}
