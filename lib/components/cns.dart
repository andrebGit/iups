import 'package:flutter/material.dart';
import 'package:sus_plus/class/dimesionsCns.dart';

class Cns extends StatelessWidget {
  final mediaW;
  final mediaH;
  const Cns({this.mediaH = 0, this.mediaW = 0});
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
                'André Babosa',
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
              child: Text(
                '26/10/1979 Sexo: Masculino',
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
              child: Text(
                '000 0000 0000 0000',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: calc(dims.x, 18),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              '000.000.000-00',
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

  calc(screenX, size) {
    var fontZise = 360 / size;
    return screenX / fontZise;
  }
}
