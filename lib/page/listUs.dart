import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sus_plus/class/shadowCard.dart';
import 'package:sus_plus/components/detailsUs.dart';
import 'package:sus_plus/components/dialog.dart';
import 'package:sus_plus/components/load.dart';
import 'package:sus_plus/helper/databasseHelper.dart';
import 'package:sus_plus/models/usModel.dart';
import 'package:sus_plus/class/us.dart';
import 'package:url_launcher/url_launcher.dart';

class ListUs extends StatefulWidget {
  @override
  _ListUsState createState() => _ListUsState();
}

class _ListUsState extends State<ListUs> {
  List<bool> _selections = List.generate(3, (_) => false);

  UsModel us = UsModel();
  List<Us> cardUs = [];
  List<Us> filterList = [];

  bool isCheck = false;

  double appH = 0;
  String filterText;

  bool notfound = false;
  var _clearFind = TextEditingController();
  @override
  void initState() {
    _selections[0] = true;

    us.showAll().then((value) {
      addCard(value);
    });
    super.initState();
  }

  addCard(val) {
    setState(() {
      cardUs = val;
    });
  }

  openApp(val) {
    setState(() {
      appH = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    // crio o filtro
    if (filterText != null) {
      filterList = [];
      for (dynamic val in cardUs) {
        String data;
        if (_selections[0]) {
          data = val.name.toString().toLowerCase();
        } else if (_selections[1]) {
          data = val.phone;
        } else {
          data = val.location.toString().toLowerCase();
        }
        if (data.contains(filterText.toLowerCase())) {
          filterList.add(val);
          notfound = false;
        } else {
          notfound = true;
        }
      }
    } else {
      notfound = false;
      filterList.addAll(cardUs);
    }
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            child: appH == 0 ? Text('') : form(),
            preferredSize: Size.fromHeight(appH)),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              openApp(70.0);
            },
          ),
        ],
        title: Text("Unidades"),
      ),
      body: filterList.length == 0
          ? (notfound ? cardNotfound() : Load())
          : Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: filterList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[700].withOpacity(0.9),
                      ),
                      //fromRGBO(64, 75, 96, .9)),
                      child: lista(index),
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget cardNotfound() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          Icons.warning,
          size: 40,
          color: Colors.red,
        ),
        Center(
          child: Text(
            'Nada encontrado.',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
            ),
          ),
        ),
      ],
    );
  }

  Widget lista(index) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 7.0),
      leading: GestureDetector(
        onTap: () {
          goMap(filterList[index].geolocation);
        },
        child: Container(
          //height: 190,
          padding: EdgeInsets.only(left: 15, top: 5, right: 15),
          decoration: new BoxDecoration(
            color: Colors.grey.withAlpha(70),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Icon(
                Icons.location_on,
                color: filterList[index].type == 1
                    ? Colors.yellow.shade600
                    : Colors.white,
                size: 30,
              ),
              Text(
                'Mapa',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      //body of list
      title: GestureDetector(
        onTap: () {
          openDialog(data: filterList[index]);
        },
        child: bodyCard(index),
      ),
    );
  }

  void openDialog({data}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialogs(
          body: DetailsUs(data),
        );
      },
    );
  }

  Widget bodyCard(index) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.blueGrey[700],
        boxShadow: ShodowCard().box,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            filterList[index].name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // Endereço
          Text('${filterList[index].location}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              )),
          paddings(),
          // Telefone
          Row(
            children: [
              Icon(Icons.phone_callback, color: Colors.grey[300]),
              Text(' ${filterList[index].phone}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  )),
            ],
          ),
          paddings(),
          Text(filterList[index].officeHours,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14,
              ))
        ],
      ),
    );
  }

  void goMap(String geo) async {
    List geolocatio = geo.split(',');
    String lat = geolocatio[0];
    String lng = geolocatio[1];
    var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }

  Widget paddings() {
    return Padding(padding: EdgeInsets.only(top: 7));
  }

  Widget form() {
    return Container(
      height: 126,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                onTap: () {
                  openApp(0.0);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(9),
                      )),
                  child: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 4),
                child: ToggleButtons(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(Icons.local_hospital),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(Icons.phone),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(Icons.home_work),
                    ),
                  ],
                  isSelected: _selections,
                  onPressed: (int index) {
                    setState(() {
                      //_selections[index] = !_selections[index];
                      for (int i = 0; i < _selections.length; i++) {
                        _selections[i] = i == index;
                      }
                    });
                  },
                  color: Colors.grey,
                  selectedColor: Colors.white,
                  fillColor: Colors.grey[600],
                ),
              ),
            ],
          ),
          new ListTile(
            // leading:
            title: new TextField(
              onChanged: (txt) {
                setState(() {
                  filterText = txt;
                });
              },
              style: TextStyle(
                color: Colors.white,
              ),
              controller: _clearFind,
              decoration: new InputDecoration(
                suffixIcon: IconButton(
                  padding: EdgeInsets.all(8),
                  color: Colors.grey[200],
                  onPressed: () {
                    _clearFind.text = '';
                    setState(() {
                      filterText = '';
                    });
                  },
                  icon: Icon(Icons.clear),
                ),
                hintText: "Pesquisar...",
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )),
              ),
            ),
          ),
          /* TextButton(
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              width: 100,
              color: Colors.red,
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  Text('ok'),
                ],
              ),
            ),
          ) */
          /*  new ListTile(
            leading: const Icon(Icons.phone),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Phone",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.email),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Email",
              ),
            ),
          ), */
        ],
      ),
    );
  }
}
