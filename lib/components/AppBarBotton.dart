import 'package:flutter/material.dart';
import 'package:sus_plus/helper/databasseHelper.dart';
import 'package:sus_plus/page/listPeople.dart';
import 'package:sus_plus/page/listUs.dart';
import 'package:sus_plus/page/who.dart';
import 'package:url_launcher/url_launcher.dart';

class AppBarBotton extends StatelessWidget {
  final Function() loadParents;

  final DatabaseHelper del = DatabaseHelper();

  AppBarBotton({Key key, this.loadParents}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40),
        topLeft: Radius.circular(40),
      ),
      child: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        //color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: IconTheme(
            data: IconThemeData(
              color: Colors.black,
            ),
            //
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.credit_card_sharp),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListaPeople(),
                    ),
                  ).then((value) {
                    loadParents();
                  }),
                  tooltip: 'Open navigation menu',
                ),
                IconButton(
                  icon: const Icon(Icons.coffee),
                  onPressed: () {
                    print('centrebutton');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Who(),
                        // ListUs(),
                      ),
                    );
                  },
                  tooltip: 'Open navigation menu',
                ),
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    print('centrebutton');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListUs(),
                        // ListUs(),
                      ),
                    );
                  },
                  tooltip: 'Open navigation menu',
                ),
                // para remover o banco de dados basta descomentar
                /*  IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    del.delete().then((val) {
                      print(val);
                    });
                  },
                ) */
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void navigateTo(double lat, double lng) async {
    var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }
}
