import 'package:flutter/material.dart';
import 'package:sus_plus/class/dimesionsCns.dart';
import 'package:sus_plus/class/shadowCard.dart';
//import 'package:perguntas/decoration.dart';

class ScrollHorizontCard extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);
  final List<dynamic> body;

  ScrollHorizontCard({
    @required this.body,
  });

  @override
  _ScrollHorizontCardState createState() => _ScrollHorizontCardState();
}

class _ScrollHorizontCardState extends State<ScrollHorizontCard> {
  var _correntIndex = 0;
  final PageController controller = PageController(viewportFraction: 0.8);
  bool activ;
  double top;
  @override
  void initState() {
    controller.addListener(() {
      int next = controller.page.round();
      if (_correntIndex != next) {
        setState(() {
          _correntIndex = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dims = DimensionCns(
      mediaW: MediaQuery.of(context).size.width,
      mediaH: MediaQuery.of(context).size.height,
    );
    return Container(
      // padding: EdgeInsets.only(top: 5.0, left: 7),
      width: dims.x,
      height: dims.y,
      padding: EdgeInsets.all(3),
      decoration: deconretion(),
      child: PageView.builder(
        controller: controller,
        itemCount: widget.body.length,
        itemBuilder: (_, currentindex) {
          activ = (currentindex == _correntIndex);
          top = activ ? 0.0 : 50.0;
          Object border = activ
              ? Colors.blueGrey[200].withOpacity(0.5)
              : Colors.transparent;

          return AnimatedContainer(
            padding: EdgeInsets.only(
              top: top,
              left: 7,
            ),
            duration: Duration(milliseconds: 500),
            child: Align(
              alignment: Alignment.topCenter,
              child: cont(currentindex),
            ),
          );
        },
      ),
    );
  }

  Widget cont(currentindex) {
    return widget.body[currentindex];
  }
}

deconretion() {
  return BoxDecoration(
    color: Colors.grey[300],
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: ShodowCard().box,
  );
}
