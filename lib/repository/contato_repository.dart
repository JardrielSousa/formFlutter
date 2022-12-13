import 'package:form_flutter/model/contato.dart';

class ContatoRepository {
  static List<ContatoModel> _contatos = [];

  ContatoRepository() {
    if (_contatos.isEmpty) {
      _contatos.add(new ContatoModel(
          nome: "Joao",
          telefone: "99879-8778",
          tipo: ContatoType.CELULAR,
          cpf: '328.287.402-26') );

      _contatos.add(new ContatoModel(
          nome: "Lucas",
          telefone: "99879-8888",
          tipo: ContatoType.CELULAR,
          cpf: '328.287.402-26'));

      _contatos.add(new ContatoModel(
          nome: "Maria",
          telefone: "98798-7777",
          tipo: ContatoType.FAVORITO,
          cpf: '328.287.402-26'));

      _contatos.add(new ContatoModel(
          nome: "Thiago",
          telefone: "3379-9999",
          tipo: ContatoType.CASA,
          cpf: '328.287.402-26'));

      _contatos.add(new ContatoModel(
          nome: "Mariana",
          telefone: "3379-9999",
          tipo: ContatoType.CASA,
          cpf: '328.287.402-26'));

      _contatos.add(new ContatoModel(
          nome: "Beatriz",
          telefone: "98887-7777",
          tipo: ContatoType.FAVORITO,
          cpf: '328.287.402-26'));

      _contatos.add(new ContatoModel(
          nome: "Liz",
          telefone: "3661-9999",
          tipo: ContatoType.TRABALHO,
          cpf: '328.287.402-26'));

      _contatos.add(new ContatoModel(
          nome: "Matheus",
          telefone: "3344-9999",
          tipo: ContatoType.TRABALHO,
          cpf: '328.287.402-26'));
    }
  }

  findAllContatos() {
    _contatos.sort((a, b) => a.nome!.compareTo(b.nome!));
    return _contatos;
  }

  saveContato(ContatoModel contato) {
    if (_contatos.contains(contato)) {
      _contatos.remove(contato);
    }
    _contatos.add(contato);
  }
}