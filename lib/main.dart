import 'package:flutter/material.dart';
import 'package:form_flutter/model/contato.dart';
import 'package:form_flutter/validators/validators.dart';


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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    ContatoModel contato = ContatoModel();
    Validators myValidators = Validators();

    return Scaffold(
      appBar: AppBar(
        title: Text(contato.nome ?? ''),
      ),
      body: Form(
        key: _formKey,
        child: Wrap(
          spacing: 20,
          runSpacing: 10,
          children: [
            TextFormField(
              validator:  myValidators.nomeValidator,
              decoration: const InputDecoration(labelText: 'Nome'),
              onChanged: (val) => contato.nome = val ,
            ),
            TextFormField(
              validator:  myValidators.celularValidador,
              decoration: const InputDecoration(labelText: 'Celular'),
              onChanged: (val) => contato.nome = val ,

            ),
            TextFormField(
              validator:  myValidators.cpfValidador,
              decoration: const InputDecoration(labelText: 'CPF'),
              onChanged: (val) => contato.cpf = val ,

            ),
            TextFormField(
              validator:  myValidators.emailValidator,//validators.emailValidator,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (val) => contato.cpf = val ,

            ),
            ElevatedButton(
              child: const Text(
                'Login',
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

