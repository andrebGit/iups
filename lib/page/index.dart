import 'package:flutter/material.dart';
import 'package:sus_plus/components/AppBarBotton.dart';
import 'package:sus_plus/components/cardUs.dart';
import 'package:sus_plus/components/cns.dart';
import 'package:sus_plus/components/dialog.dart';
import 'package:sus_plus/components/scroll_h.dart';
import 'package:sus_plus/components/sliverHeader.dart';
import 'package:sus_plus/components/solicitarCardSus.dart';
import 'package:sus_plus/models/peopleModel.dart';
import 'package:sus_plus/page/listUs.dart';

class Index extends StatefulWidget {
  //
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  PeopleModel people = PeopleModel();
  @override
  void initState() {
    super.initState();
    print("Pegando dados de pessoas");
    people.getPeople().then((value) {
      print(value);
    });
    /* setState(() {
        }); */
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
                title: 'André Barbosa',
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
                    body: [
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Cns(
                              mediaW: constraints.maxWidth,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Cns(
                              mediaW: constraints.maxWidth,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Cns(
                              mediaW: constraints.maxWidth,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Cns(
                              mediaW: constraints.maxWidth,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return GestureDetector(
                              onTap: () {
                                openDialog();
                              },
                              child: Cns(
                                mediaW: constraints.maxWidth,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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

  void openDialog({title, body}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialogs(
          body: Cns(),
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
