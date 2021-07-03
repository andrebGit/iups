import 'package:flutter/material.dart';

class Dialogs extends StatelessWidget {
  // final title;
  final body;
  final fn;
  final btnClose;

  Dialogs({
    this.btnClose = true,
    //this.title = '',
    @required this.body,
    this.fn,
  });

  bool get barrierDismissible => true;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      scrollable: true,
      elevation: 0,
      content: bodyAll(context),
    );
  }

  bodyAll(context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.0),
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
}
