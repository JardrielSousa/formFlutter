import 'package:flutter/material.dart';
import 'package:form_flutter/model/contato.dart';
import 'package:form_flutter/repository/contato_repository.dart';
import 'package:form_flutter/validators/mask.dart';
import 'package:form_flutter/validators/validators.dart';


class NovoContatoPage extends StatefulWidget {
  final ContatoModel contato;

  const NovoContatoPage.edit({Key? key, required this.contato}) : super(key: key);

  NovoContatoPage() : this.contato = new ContatoModel();


  @override
  State<NovoContatoPage> createState() => _NovoContatoPageState(contato);
}

class _NovoContatoPageState extends State<NovoContatoPage> {
  final _formKey = GlobalKey<FormState>();
  ContatoModel contato = ContatoModel();

  _NovoContatoPageState(this.contato);

  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
        ContatoRepository().saveContato(contato.toContato());
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/", (_) => false);
    } else {
      print('Form is invalid');
    }
  }


  @override
  Widget build(BuildContext context) {
    Validators myValidators = Validators();

    Mask mask = Mask();

    void updateNome(nome) {
      setState(() {
        contato.nome = nome;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(contato.nome ?? ''),
      ),
      body: Form(
        key: _formKey,
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            TextFormField(
              validator:  myValidators.nomeValidator,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: 'Nome'),
              onChanged: updateNome,
              maxLength: 100,

            ),
            TextFormField(
              validator:  myValidators.celularValidador,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Celular'),
              onChanged: (val) => {
                contato.telefone = val},
              inputFormatters: [mask.phonemaskFormatter],

            ),
            TextFormField(
              validator:  myValidators.cpfValidador,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'CPF'),
              onChanged: (val) => {
                contato.cpf = val },
              inputFormatters: [mask.cpfmaskFormatter],

            ),
            TextFormField(
              validator:  myValidators.emailValidator,//validators.emailValidator,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (val) => contato.cpf = val ,

            ),
            ElevatedButton(
              child: const Text(
                'salvar',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: validateAndSave,
            ),
          ],
        ),
      ),
    );
  }

}