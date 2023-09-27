import 'package:flutter/painting.dart';

LinearGradient centerLeftRight({required Color leftColor, required Color rightColor}) =>
    LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [leftColor, rightColor],
    );
