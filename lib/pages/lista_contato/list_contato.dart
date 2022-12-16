import 'package:flutter/material.dart';
import 'package:form_flutter/model/contato.dart';
import 'package:form_flutter/pages/novo_contato.dart';
import 'package:form_flutter/repository/contato_repository.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ListContatos extends StatefulWidget {
  @override
  _ListContatosState createState() => _ListContatosState();
}

class _ListContatosState extends State<ListContatos> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
            itemBuilder: (context, index) {
              var contato = ContatoRepository().findAllContatos()[index];
              return ListTile(
                onTap: () => sendEditContato(context, contato),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue[200],
                ),
                title: Text(contato.nome),
                subtitle: Text(contato.telefone),
                trailing: IconButton(
                  icon: Icon(Icons.call),
                  //onPressed: () => FlutterPhoneState.startPhoneCall(contato.telefone),
                  onPressed: () => makeCall(contato.telefone),

                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: ContatoRepository().findAllContatos().length) ,

    );
  }

  sendEditContato(BuildContext context, contato) {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (_) =>  NovoContatoPage(contato:contato)));
  }

  makeCall(contato) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(contato);
  }
}