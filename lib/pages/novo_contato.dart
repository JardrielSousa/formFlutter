import 'package:flutter/material.dart';
import 'package:form_flutter/model/contato.dart';
import 'package:form_flutter/model/contato_type.dart';
import 'package:form_flutter/repository/contato_repository.dart';
import 'package:form_flutter/validators/mask.dart';
import 'package:form_flutter/validators/validators.dart';


class NovoContatoPage extends StatefulWidget {
  final ContatoModel contato;

  const NovoContatoPage({Key? key,required this.contato});

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
              onChanged: (val) => updateTelefone,
              inputFormatters: [mask.phonemaskFormatter],

            ),
            TextFormField(
              validator:  myValidators.cpfValidador,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'CPF'),
              onChanged: (val) => updateCpf,
              inputFormatters: [mask.cpfmaskFormatter],

            ),
            TextFormField(
              validator:  myValidators.emailValidator,//validators.emailValidator,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (val) => contato.cpf = val ,

            ),
            DropdownButtonFormField<ContatoType>(
              value: contato.tipo,
              decoration: InputDecoration(border: OutlineInputBorder()),
              items: ContatoType.values.map((ContatoType value) {
                return DropdownMenuItem<ContatoType>(
                  value: value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContatoHelper.getIconByContatoType(value),
                      Text(ContatoHelper.getDescription(value)),
                    ],
                  ),
                );
              }).toList(),
              onChanged: updateTipoContato,
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
  void updateTipoContato(ContatoType? tipoContato) =>
      contato.tipo = tipoContato;
  void updateCpf(cpf) => contato.cpf = cpf;


  void updateTelefone(telefone) => contato.telefone = telefone;

  void updateNome(nome) {
    contato.nome = nome;
  }
}