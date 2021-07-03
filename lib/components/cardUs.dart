import 'package:flutter/material.dart';

class CardUs extends StatelessWidget {
  final title;
  final img;

  CardUs(
      {this.title = 'Unidades de saúde\nem Palmas-TO',
      this.img = 'src/img/unidade.jpg'});
  //const CardUs({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 300.0,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 300.0,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.grey.withOpacity(0.8),
                  Colors.black45,
                ],
                stops: [
                  0.1,
                  1.0
                ]),

            //Colors.green.withAlpha(70),

            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                // Title
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[200],
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
