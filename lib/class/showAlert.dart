import 'dart:async';

import 'package:flutter/material.dart';

class ShowAlert {
  //final title;
  final body;
  final btnClose;
  final context;
  final closeTime;

  ShowAlert({
    @required this.context,
    // this.title,
    this.body,
    this.btnClose = true,
    this.closeTime = 0,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert();
      },
    );
  }

  alert() {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      scrollable: true,
      elevation: 0,
      content: bodyAll(),
    );
  }

  bodyAll() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          margin: EdgeInsets.only(top: 25.0, right: 25),

          //Body
          child: body,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //Botão fechar
          children: [
            Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.red[300],
                shape: BoxShape.circle,
              ),
              child: iconGo(context),
            ),
          ],
        ),
      ],
    );
  }

  Widget iconGo(context) {
    call(context);
    if (btnClose) {
      return IconButton(
        color: Colors.white,
        icon: Icon(
          Icons.close_sharp,
        ),
        onPressed: () => Navigator.pop(context),
      );
    }
    return Text('');
  }

  call(context) {
    print(closeTime);
    print('================================');
    if (closeTime == 0) {
      return false;
    }
    Timer(Duration(seconds: closeTime), () {
      Navigator.pop(context);
    });
  }
  /* void openDialogInf({title, body}) {
   
  } */
}
