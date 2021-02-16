import 'package:flutter/material.dart';

const kSelectedIconMenu = Color(0xFF0E66B3);
const kUnselectedIconMenu = Color(0xFF77B5EB);
const kGreyShadow = Color(0xFF999999);
const kTransparent = Colors.transparent;

const kCarouselTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 25.0,
  fontWeight: FontWeight.w600,
  shadows: [
    Shadow(
      offset: Offset(2.0, 2.0),
      blurRadius: 3.0,
      color: Colors.black38,
    ),
  ],
);

enum GroupName {
  habitos,
  nutricionales,
  odontologicos,
  enfermedades,
  ginecobstetricos,
}
