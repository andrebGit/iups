import 'package:flutter/foundation.dart';

class DimensionCns {
  // var media;
  var mediaW;
  var mediaH;
  var _x;
  var _y;
  var tmCns = 36.894164194;
  DimensionCns({
    // @required this.media,
    @required this.mediaW,
    @required this.mediaH,
    // diferença da base e altura em porcentagem ex: 36.894164194%
    tmCns = 36.894164194,
  }) {
    _x = mediaW - 5;
    _y = (_x - (_x * tmCns) / 100);
    if (y > mediaH) {
      _y = mediaH - 20;
      _x = (_y + (_y * 58.5) / 100);
    }
  }

  get y {
    return _y;
  }

  get x {
    return _x;
  }
}
