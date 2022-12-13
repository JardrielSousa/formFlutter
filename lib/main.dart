import 'package:flutter/material.dart';
import 'package:form_flutter/pages/lista_contato/list_contato.dart';
import 'package:form_flutter/pages/lista_contato/list_contato_page.dart';
import 'package:form_flutter/pages/novo_contato.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contato Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: ListContatoPage(),
    );
  }
}


