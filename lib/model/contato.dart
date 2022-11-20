class ContatoModel {
  String? nome ;
  String? email ;
  String? cpf;
  String? telefone;
  ContatoType? tipo;
}

enum ContatoType {
  CELULAR , TRABALHO , FAVORITO , CASA
}