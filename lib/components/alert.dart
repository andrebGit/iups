import 'package:flutter/material.dart';
import 'package:sus_plus/class/showAlert.dart';

class Alert {
  //const Alert({ Key? key }) : super(key: key);
  final title;
  final subTitle;
  String type;
  var context;
  int timeClose;
  bool closeBtn;

  Alert({
    @required this.context,
    this.title,
    this.subTitle,
    this.type = 'success',
    this.timeClose,
    this.closeBtn = false,
  }) {
    if (type == 'danger') {
      //chamada do diolog
      ShowAlert(
        context: context,
        body: danger(),
        closeTime: timeClose,
        btnClose: closeBtn,
      );
    }
  }

  Widget danger() {
    return bodyIn(Icons.error);
  }

  Widget bodyIn(IconData icon) {
    return Container(
      width: 250,
      height: 150,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 45,
            color: Colors.red,
          ),
          Padding(
              padding: EdgeInsets.only(
            top: 10.0,
          )),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 7.0)),
          Text(
            subTitle,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
