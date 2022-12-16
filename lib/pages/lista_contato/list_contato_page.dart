import 'package:flutter/material.dart';
import 'package:form_flutter/model/contato.dart';
import 'package:form_flutter/pages/lista_contato/list_contato.dart';
import 'package:form_flutter/pages/novo_contato.dart';

import 'contato_drawer.dart';


class ListContatoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: ContatoDrawer(),
        appBar: AppBar(
          title: Text('Meus Contatos'),
          actions: [
            IconButton(
                icon: Icon(Icons.add), onPressed: () => sendNewContato(context))
          ],
        ),
        body: ListContatos());
  }

  sendNewContato(BuildContext context) {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (_) => NovoContatoPage(contato: new ContatoModel(nome: '', telefone: '',
        tipo: null, cpf: ''))));
  }

}