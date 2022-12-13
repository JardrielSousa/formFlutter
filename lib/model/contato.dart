import 'package:flutter/widgets.dart';

class ContatoModel {
  String? nome ;
  String? email ;
  String? cpf;
  String? telefone;
  ContatoType? tipo;

  ContatoModel({@required this.nome, @required this.telefone, @required this.tipo, @required this.cpf});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ContatoModel &&
              runtimeType == other.runtimeType &&
              telefone == other.telefone;

  @override
  int get hashCode => telefone.hashCode;

  ContatoModel toContato() {
    return ContatoModel(nome: nome, telefone: telefone, tipo: tipo, cpf: cpf);
  }

  static ContatoModel fromContato(ContatoModel contato) {
    var contatoModel = ContatoModel();
    contatoModel.nome = contato.nome;
    contatoModel.telefone = contato.telefone;
    contatoModel.tipo = contato.tipo;
    contatoModel.cpf = contato.cpf;
    return contatoModel;
  }
}

enum ContatoType {
  CELULAR , TRABALHO , FAVORITO , CASA
}