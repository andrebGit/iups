import 'package:flutter/material.dart';
import 'package:sus_plus/class/people.dart';
import 'package:sus_plus/components/AppBarBotton.dart';
import 'package:sus_plus/components/cardUs.dart';
import 'package:sus_plus/components/cns.dart';
import 'package:sus_plus/components/dialog.dart';
import 'package:sus_plus/components/scroll_h.dart';
import 'package:sus_plus/components/sliverHeader.dart';
import 'package:sus_plus/components/solicitarCardSus.dart';
import 'package:sus_plus/models/peopleModel.dart';
import 'package:sus_plus/page/cadUser.dart';
import 'package:sus_plus/page/listUs.dart';

class Index extends StatefulWidget {
  //
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  PeopleModel peopleModel = PeopleModel();
  People people = People();
  List<People> ListPeople;
  List<dynamic> listCns = [Text('carregando...')];

  String nameAdmin = 'Seu nome aqui...';
  @override
  void initState() {
    setState(() {
      listCns = [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CadUser(typeUser: 0),
                )).then((value) {
              loadAll();
            });
          },
          child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Center(
              child: Text(
                'Toque aqui e \nCadastre os seus dados',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
      ];
      peopleModel.getPeople().then((value) {
        if (value != null) {
          ListPeople = value;
          loadCns();
        }
      });
    });
    super.initState();
  }

  void loadAll() {
    setState(() {
      peopleModel.getPeople().then((value) {
        if (value != null) {
          ListPeople = value;
          loadCns();
        }
      });
    });
  }

  void loadCns() {
    setState(() {
      listCns = listCard();
    });
  }

  void addNameAdmin(val) {
    setState(() {
      nameAdmin = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
        title: Text('ok'),
      ), */
      bottomNavigationBar: AppBarBotton(),
      body: Container(
        color: Colors.blue[100].withAlpha(90),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverHeader(
                backgroundColor: Colors.green,
                title: nameAdmin,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 80),
                  ),

                  //
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Cartão do SUS',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                      //textAlign: TextAlign.center,
                    ),
                  ),
                  //Cartão do sus
                  ScrollHorizontCard(
                    // Carrega os cartões SUS
                    body: listCns,
                  ),

                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Localize',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // unidade de saúdes de palmas-to
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListUs(),
                          // ListUs(),
                        ),
                      );
                    },
                    child: CardUs(),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Cartão do SUS',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      openDialogInf();
                    },
                    child: CardUs(
                      img: 'src/img/cns.png',
                      title: 'Como solicitar o cartão do SUS?',
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<dynamic> listCard() {
    List<dynamic> card = ListPeople.map((el) {
      if (el.type == 0) {
        addNameAdmin(el.name);
      }
      return Padding(
        padding: EdgeInsets.only(top: 2),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return GestureDetector(
              onTap: () {
                openDialog(peopleIndex: el);
              },
              child: Cns(
                people: el,
                mediaW: constraints.maxWidth,
              ),
            );
          },
        ),
      );
    }).toList();

    return card;
  }

  void openDialog({People peopleIndex}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialogs(
          body: Cns(
            people: peopleIndex,
          ),
        );
      },
    );
  }

  void openDialogInf({title, body}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialogs(
          body: SolicitarCardSus(),
        );
      },
    );
  }
}
