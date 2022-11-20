import 'package:form_field_validator/form_field_validator.dart';


class Validators {
  final nomeValidator = MultiValidator([
    RequiredValidator(errorText: 'name is required'),
    MinLengthValidator(4, errorText: 'name must be at least 4 digits long'),
  ]);

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'email is required'), EmailValidator(errorText: 'Email invalido!!')
  ]);

  final cpfValidador  =  MultiValidator([
    RequiredValidator(errorText: 'cpf is required'),
    MaxLengthValidator(8, errorText: 'cpf must be at least 8 digits long'),
  ]);

  final celularValidador  =  MultiValidator([
    RequiredValidator(errorText: 'celular is required'),
    MaxLengthValidator(11, errorText: 'celular must be at least 8 digits long'),
  ]);
}