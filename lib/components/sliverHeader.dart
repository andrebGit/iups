import 'package:flutter/material.dart';

class SliverHeader extends SliverPersistentHeaderDelegate {
  final Color backgroundColor;
  final String title;
  final height;

  SliverHeader({
    this.backgroundColor,
    this.title = '',
    this.height = 150.0,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      alignment: Alignment.topCenter,
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          'src/img/back_1.jpg',
          fit: BoxFit.cover,
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / height,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Positioned(
          top: height / 2 - shrinkOffset,
          child: Opacity(
            opacity: (1 - shrinkOffset / height),
            child: avatar(context),
          ),
        ),
      ],
    );
  }

  Widget avatar(context) {
    // print(MediaQuery.of(context).size.width / 2);
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.w700,
            fontSize: 23,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              border: Border.all(width: 2),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.grey,
                  spreadRadius: 3,
                )
              ]),
          child: CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage('src/img/avatar.jpeg'),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
