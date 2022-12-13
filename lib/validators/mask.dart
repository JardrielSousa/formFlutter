import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Mask {
  var cpfmaskFormatter = new MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: { "#": RegExp(r'[0-9]') },
  );

  var phonemaskFormatter = new MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: { "#": RegExp(r'[0-9]') },
  );
}