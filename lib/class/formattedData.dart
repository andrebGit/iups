import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormattedData {
  dateBr({String val}) {
    return val.split("-").reversed.join("/").toString();
  }

  String dataDefault({String val}) {
    return val.split("/").reversed.join("-").toString();
  }

  String cpf({String val}) {
    String cpf = val;
    if (cpf == null) {
      return '';
    }
    var cpfM = MaskTextInputFormatter(mask: '###.###.###-##', initialText: cpf);
    return (cpfM.getMaskedText());
  }

  String cns({String val}) {
    String cns = val;
    if (cns == null) {
      return '';
    }
    var cnsM =
        MaskTextInputFormatter(mask: '### #### #### ####', initialText: cns);
    return (cnsM.getMaskedText());
  }
}
