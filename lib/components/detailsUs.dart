import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsUs extends StatelessWidget {
  final data;
  const DetailsUs(@required this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 15,
      height: MediaQuery.of(context).size.height / 1.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Center(
                child: Container(
                  color: Colors.black.withAlpha(150),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.type == 0 ? 'Unidade de Saúde ' : 'Emergência',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey[100],
                        ),
                      ),
                      paddings(),
                      Text(
                        'Documetos para Atendimeto\nCartão do SUS ou CPF e RG',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.grey[100],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage("src/img/unidade.jpg"),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    data.name,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  // Endereço
                  Text('${data.location}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20,
                      )),
                  paddings(),
                  // Telefone
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone_callback, color: Colors.grey[600]),
                      Text(' ${data.phone}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                            fontSize: 20,
                          )),
                    ],
                  ),
                  paddings(),
                  Text(
                    'Horário de atendimento',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    data.officeHours,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18,
                    ),
                  ),
                  paddings(),
                  // MAP
                  GestureDetector(
                    onTap: () {
                      goMap(data.geolocation);
                    },
                    child: Container(
                      width: 200,
                      height: 150,
                      decoration: BoxDecoration(
                        /* image: DecorationImage(
                          image: AssetImage('src/img/map.png'),
                          fit: BoxFit.fill,
                        ), */
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: data.type == 1
                                ? Colors.yellow.shade600
                                : Colors.grey[100],
                            size: 70,
                          ),
                          Text(
                            'Veja no Mapa',
                            style: TextStyle(
                              color: Colors.grey[100],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
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
}
