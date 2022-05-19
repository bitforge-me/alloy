import 'package:flutter/material.dart';

Gradient? bronzeGradient = LinearGradient(
    begin: Alignment(0.9999999403953552, 8.690536290600903e-9),
    end: Alignment(-1.540519534160012e-8, 0.2562732696533203),
    colors: [
      Color.fromRGBO(114, 57, 32, 1),
      Color.fromRGBO(139, 76, 40, 1),
      Color.fromRGBO(149, 75, 41, 1),
      Color.fromRGBO(195, 100, 55, 1),
      Color.fromRGBO(143, 75, 42, 1),
      Color.fromRGBO(168, 86, 45, 1),
      Color.fromRGBO(237, 120, 66, 1),
      Color.fromRGBO(166, 83, 45, 1),
      Color.fromRGBO(123, 62, 32, 1)
    ]);

Gradient? bronzeSecondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF808080), Color(0xFF808080)]);

Gradient? bronzeCancelGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFFFFF).withOpacity(0.28),
      Color(0xFFFFFFFF).withOpacity(0.28)
    ]);
