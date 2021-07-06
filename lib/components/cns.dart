import 'package:flutter/material.dart';
import 'package:sus_plus/class/dimesionsCns.dart';
import 'package:sus_plus/class/formattedData.dart';
import 'package:sus_plus/class/people.dart';

class Cns extends StatelessWidget {
  final mediaW;
  final mediaH;
  final People people;
  const Cns({
    this.mediaH = 0,
    this.mediaW = 0,
    this.people,
  });
  //final tmCns = 36.894164194;

  @override
  Widget build(BuildContext context) {
    var dims = DimensionCns(
      mediaW: mediaW == 0 ? MediaQuery.of(context).size.width : mediaW,
      mediaH: MediaQuery.of(context).size.height,
    );
//    print('${dims.x}, ${dims.y} #${MediaQuery.of(context).size.height}');
    double topP = (dims.y * 0.5);
    double leftP = (dims.x * 0.1);
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          left: leftP,
          top: topP,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 2),
              child: Text(
                //Nome
                people.name,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: calc(dims.x, 16),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 7),
              //Data de nascimento
              child: Text(
                '${FormattedData().dateBr(val: people.birth)}, Sexo: ${getSex(people.sex)}',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: calc(dims.x, 12),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 7),
              //Cartão sus
              child: Text(
                people.cns,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: calc(dims.x, 18),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            //CPF
            Text(
              'CPF: ${people.cpf}',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: calc(dims.x, 16),
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      width: dims.x,
      height: dims.y,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          //fit: BoxFit.fill,
          image: AssetImage('src/img/cns.png'),
        ),
        //color: Colors.green,
      ),
    );
  }

  String getSex(val) {
    return val == 1 ? 'Masculino' : 'Feminino';
  }

  calc(screenX, size) {
    var fontZise = 360 / size;
    return screenX / fontZise;
  }
}
