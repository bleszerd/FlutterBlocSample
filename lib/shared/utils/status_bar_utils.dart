import 'package:flutter/services.dart';

abstract class StatusBarUtils {
  static setColor(Brightness brightness, Color color) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: brightness,
        statusBarColor: color,
      ),
    );
  }
}
