import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../animations/scale_on_hover.dart';
import '../animations/translate_on_hover.dart';


extension HoverExtensions on Widget {
  Widget get showCursorOnHover {
    return _returnUnalteredOnMobile(MouseRegion(
      child: this,
      cursor: SystemMouseCursors.click,
    ));
  }

  Widget get moveUpOnHover {
    return moveOnHover(x: 0.0, y: -5.0);
  }

  /// Moves the widget by x,y pixels on hover
  ///
  /// to move up use -y values, to move left use -x values
  Widget moveOnHover({double? x, double? y}) {
    return _returnUnalteredOnMobile(TranslateOnHover(
      x: x,
      y: y,
      child: this,
    ));
  }

  /// Scales the widget by [scale] on hover
  Widget scaleOnHover({double scale = 1.1}) {
    return _returnUnalteredOnMobile(ScaleOnHover(
      child: this,
      scale: scale,
    ));
  }

  /// Takes in the alteredWidget and if we detect we're on Android or iOS
  /// we return the unaltered widget.
  ///
  /// The reason we can do this is because all altered widgets require mouse
  /// functionality to work.
  Widget _returnUnalteredOnMobile(Widget alteredWidget) {
    if (kIsWeb) {
      return alteredWidget;
    }
    return this;
  }

// Widget get moveUpOnHover {
//   return TranslateOnHover(child: this);
// }
}
