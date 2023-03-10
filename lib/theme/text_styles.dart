import 'package:flutter/material.dart';
import 'package:said/config/color_constants.dart';

blackHeader() => const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 28,
    );

subHeader() => const TextStyle(
    fontWeight: FontWeight.bold,
    color: ColorConstants.secondaryColor,
    fontSize: 16);

subHeaderWhite() => const TextStyle(
    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16);

primaryText() =>
    const TextStyle(color: Color(0xfff59e0b), fontWeight: FontWeight.bold);

userName() => const TextStyle(fontWeight: FontWeight.bold, fontSize: 28);

announcementDate() => const TextStyle(color: Colors.grey);

screeningWarningTitle() =>
    const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

screeningWarningBody() => const TextStyle(color: Colors.white);
