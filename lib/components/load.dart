import 'package:flutter/material.dart';

class Load extends StatelessWidget {
  //const Load({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 75,
        child: Image.asset('src/img/load.gif'),
      ),
    );
  }
}
