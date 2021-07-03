import 'package:flutter/material.dart';

class CnsBackgound {
  Object call({String nameFn}) {
    var fn = [
      {'susCard': sus},
      {'color1': colorG1},
    ];
    for (var i = 0; i < fn.length; i++) {
      if (fn[i][nameFn] != null) {
        return fn[i][nameFn]();
      }
    }
  }

  sus() {
    return DecorationImage(
      image: AssetImage('/img/cns.png'),
      fit: BoxFit.cover,
    );
  }

  colorG1() {
    return LinearGradient(
        colors: [
          Colors.orange,
          Colors.orangeAccent,
          Colors.red,
          Colors.redAccent
          //add more colors for gradient
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0, 0.2, 0.5, 0.8]);
  }
}
