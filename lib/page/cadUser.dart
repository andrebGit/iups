import 'package:flutter/material.dart';
import 'package:sus_plus/class/formattedData.dart';
import 'package:sus_plus/class/people.dart';
import 'package:sus_plus/class/showAlert.dart';
import 'package:sus_plus/components/alert.dart';
import 'package:sus_plus/models/peopleModel.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/services.dart';

class CadUser extends StatefulWidget {
  final People peopleReload;
  final typeUser;

  const CadUser({Key key, this.peopleReload, this.typeUser = 1})
      : super(key: key);
  // const ListUs({ Key? key }) : super(key: key);
  @override
  _CadUserState createState() => _CadUserState();
}

class _CadUserState extends State<CadUser> {
  People people;
  TextEditingController _name = TextEditingController();
  TextEditingController _birth = TextEditingController();
  TextEditingController _cns = TextEditingController();
  TextEditingController _cpf = TextEditingController();
  int optSex = 1;
  final PeopleModel peopleM = PeopleModel();
  String titleCad;
  int typeUser;
// Focus
  FocusNode nameF;
  FocusNode birthF;
  FocusNode cpfF;
  FocusNode cnsF;

  Widget typeIconUser = Text('Carreando');
  @override
  void initState() {
    super.initState();
    if (widget.peopleReload != null) {
      people = widget.peopleReload;
      _name.text = people.name;
      _birth.text = people.birth;
      _cns.text = people.cns;
      optSex = people.sex == null ? 1 : people.sex;
      _cpf.text = people.cpf;
      titleCad = 'Atualizar cadastro';
    } else {
      titleCad = 'Novo Cadastro';
    }

    typeUser = widget.typeUser;
    print('Tipo de usuario $typeUser');
    LoadTypeUser();

    nameF = FocusNode();
    birthF = FocusNode();
    cpfF = FocusNode();
    cnsF = FocusNode();
  }

  void LoadTypeUser() {
    setState(() {
      typeIconUser = iconUser();
    });
  }

  @override
  void dispose() {
    nameF.dispose();
    birthF.dispose();
    cpfF.dispose();
    cnsF.dispose();
    super.dispose();
  }

  final maskDate = MaskTextInputFormatter(mask: "##/##/####");
  final maskCard = MaskTextInputFormatter(mask: '### #### #### ####');
  final maskCpf = MaskTextInputFormatter(mask: '###.###.###-##');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleCad),
      ),
      //
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            typeIconUser,
            ListTile(
              leading: const Icon(Icons.person),
              title: new TextField(
                controller: _name,
                autofocus: true,
                focusNode: nameF,
                decoration: new InputDecoration(
                  hintText: "Nome",
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: Container(
                width: 200,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RadioListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text('Masculino'),
                        activeColor: Colors.green,
                        value: 1,
                        groupValue: optSex,
                        onChanged: (val) {
                          setState(() {
                            optSex = val;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        contentPadding: EdgeInsets.all(0),
                        activeColor: Colors.green,
                        title: Text('Feminino'),
                        value: 2,
                        groupValue: optSex,
                        onChanged: (val) {
                          setState(() {
                            optSex = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.cake),
              title: new TextField(
                keyboardType: TextInputType.phone,
                inputFormatters: [maskDate],
                controller: _birth,
                focusNode: birthF,
                decoration: new InputDecoration(
                  hintText: "Data de Nascimento",
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.credit_card),
              title: new TextField(
                keyboardType: TextInputType.phone,
                inputFormatters: [maskCard],
                controller: _cns,
                focusNode: cnsF,
                decoration: new InputDecoration(
                  hintText: "Número do Cartão do SUS",
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.card_membership_sharp),
              title: new TextField(
                keyboardType: TextInputType.phone,
                inputFormatters: [maskCpf],
                controller: _cpf,
                focusNode: cpfF,
                decoration: InputDecoration(
                  hintText: "Número do CPF",
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Cadastrar'),
              onPressed: () async {
                //people
                formPeople();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget iconUser() {
    var type = typeUser;
    if (type == 0) {
      return ListTile(
        leading: const Icon(
          Icons.manage_accounts,
          color: Colors.red,
        ),
        title: Text("Usuário Administrador(a)"),
      );
    } else {
      return ListTile(
        leading: const Icon(
          Icons.person_pin,
          color: Colors.green,
        ),
        title: Text("Você é um Usuário Normal"),
      );
    }
  }

  void formPeople() async {
    String name = _name.text;
    String birth = _birth.text.replaceAll(RegExp(r'\D'), '');
    String cns = _cns.text.replaceAll(RegExp(r'\D'), '');
    String cpf = _cpf.text.replaceAll(RegExp(r'\D'), '');
    String imgUrl = '';

    if (name.length < 5) {
      Alert(
        context: context,
        title: 'Erro',
        subTitle: 'Erro no campo nome',
        type: 'danger',
        timeClose: 3,
        closeBtn: false,
      );
      nameF.requestFocus();
      return;
    } else if (birth.length != 8) {
      Alert(
        context: context,
        type: 'danger',
        title: 'Erro',
        subTitle: 'Data de nascimento está errada',
        timeClose: 5,
        closeBtn: false,
      );
      //.requestFocus();
      return;
    } else if (cns.length > 0 && cns.length != 15) {
      Alert(
        context: context,
        type: 'danger',
        title: 'Erro',
        subTitle: 'Cartão do SUS teve ter 15 digitos',
        timeClose: 5,
        closeBtn: false,
      );
      cnsF.requestFocus();
      return;
    }
    // Converte data de dia/mês/Ano para ano-mes-dia, para salvar no banco de dados
    birth = FormattedData().dataDefault(val: _birth.text);

    People peopleClass = People(
      type: typeUser,
      name: name,
      sex: optSex,
      birth: birth,
      cns: cns,
      cpf: cpf,
      imgUrl: imgUrl,
    );
    try {
      if (people == null) {
        await peopleM.create(peopleClass);
        _name.text = '';
        _birth.text = '';
        _cns.text = '';
        _cpf.text = '';
        imgUrl = '';
        optSex = 1;
        typeUser = 1;
        LoadTypeUser();
      } else {
        peopleClass.id = people.id;
        await peopleM.update(peopleClass);
      }

      Alert(
        context: context,
        type: 'success',
        title: 'OK!',
        subTitle: people == null ? 'Dados Cadastrados' : 'Dados Atualizado',
        timeClose: 0,
        closeBtn: true,
      );
      // List<People> respP = await peopleM.getPeople();
    } catch (err) {
      Alert(
        context: context,
        type: 'danger',
        title: 'Erro',
        subTitle: err,
        timeClose: 0,
        closeBtn: true,
      );
    }
  }

  void alertDanger(text) {
    ShowAlert(
      closeTime: 3,
      btnClose: false,
      context: context,
      body: bodyForAlert(text),
    );
  }

  Widget bodyForAlert(String text) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
    );
  }
}
