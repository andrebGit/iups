import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sus_plus/class/people.dart';
import 'package:sus_plus/class/showAlert.dart';
import 'package:sus_plus/components/alert.dart';
import 'package:sus_plus/models/peopleModel.dart';
import 'package:brasil_fields/brasil_fields.dart';

class CadUser extends StatefulWidget {
  // const ListUs({ Key? key }) : super(key: key);
  @override
  _CadUserState createState() => _CadUserState();
}

class _CadUserState extends State<CadUser> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _sex = TextEditingController();
  final TextEditingController _birth = TextEditingController();
  final TextEditingController _cns = TextEditingController();
  final TextEditingController _cpf = TextEditingController();
  final PeopleModel peopleM = PeopleModel();
// Focus
  FocusNode nameF;
  FocusNode sexF;
  FocusNode birthF;
  FocusNode cndF;
  FocusNode cpfF;

  @override
  void initState() {
    super.initState();
    nameF = FocusNode();
    sexF = FocusNode();
    birthF = FocusNode();
    cndF = FocusNode();
    cpfF = FocusNode();
  }

  @override
  void dispose() {
    nameF.dispose();
    sexF.dispose();
    birthF.dispose();
    cndF.dispose();
    cpfF.dispose();
    super.dispose();
  }

  int optSex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      //
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            new ListTile(
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
            new ListTile(
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
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  DataInputFormatter(),
                ],
                controller: _birth,
                focusNode: birthF,
                decoration: new InputDecoration(
                  hintText: "Data de Nascimento",
                ),
                onChanged: (val) {
                  var x = val;
                  x = x.replaceAll(RegExp(r'\D'), '');
                  x = x.replaceAll(RegExp(r'^(\D\D)(\D)'), "");
                  print(x);
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.credit_card),
              title: new TextField(
                controller: _cns,
                focusNode: cndF,
                decoration: new InputDecoration(
                  hintText: "Número do Cartão do SUS",
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.card_membership_sharp),
              title: new TextField(
                controller: _cpf,
                focusNode: cpfF,
                decoration: new InputDecoration(
                  hintText: "Número do CPF",
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Cadastrar'),
              onPressed: () async {
                String name = _name.text;
                int sex = _sex.text.isEmpty ? 1 : int.parse(_sex.text);
                String birth = _birth.text;
                String cns = _cns.text;
                String cpf = _cpf.text;
                String path = 'www.google.com.br';
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
                } else if (cns.length != 15) {
                  nameF.requestFocus();
                  Alert(
                    context: context,
                    type: 'danger',
                    title: 'Erro',
                    subTitle: 'Erro no campo CND está errado',
                    timeClose: 3,
                    closeBtn: false,
                  );
                }
                People people = People();

                try {
                  print("Buscando dados");
                  var resp = await peopleM.create(people);
                  print(resp);
                  List<People> respP = await peopleM.getPeople();
                  print('Quantidade cadastradas ${respP.length}');
                  for (var i = 0; i < respP.length; i++) {
                    print('$i ${respP[i].name}');
                  }
                  print('fechou');
                } catch (e) {
                  print("ERRO:");
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
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

//ShowAlert(context: context, body: body());
/*  try {
                  print("Buscando dados");
                  var resp = await peopleM.create(people);
                  print(resp);
                  List<People> respP = await peopleM.getPeople();
                  print('Quantidade cadastradas ${respP.length}');
                  for (var i = 0; i < respP.length; i++) {
                    print('$i ${respP[i].name}');
                  }
                  print('fechou');
                } catch (e) {
                  print("ERRO:");
                  print(e);
                } */

/* const Divider(
              height: 5.0,
              color: Colors.grey,
            ),
            new ListTile(
              leading: const Icon(Icons.label),
              title: const Text('Nick'),
              subtitle: const Text('None'),
            ),
            new ListTile(
              leading: const Icon(Icons.today),
              title: const Text('Birthday'),
              subtitle: const Text('February 20, 1980'),
            ),
            new ListTile(
              leading: const Icon(Icons.group),
              title: const Text('Contact group'),
              subtitle: const Text('Not specified'),
            ) */
