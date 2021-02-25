import 'dart:io';
import 'package:flutter/material.dart';

// Colors
const mainWhite = Color(0xFFFFFFFF);
const mainBlue = Color(0xFF4880EE);
const mainFontBlue = Color(0xFF5489EF);
const mainFontDark = Color(0xFF353C49);
const subBlue = Color(0xFFEAF3FE);
const subGray = Color(0xFFFAFAFB);
const downDark = Color(0x66000000);


//Text StyleSheet
var kAppBarTitleStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: mainFontDark,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);

var kTitleStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: mainFontDark,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);

var kTitleStyleWhite = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: mainWhite,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);

var kTitle2Style = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: mainFontDark,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);

var kTitle3Style = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w600,
  color: mainFontDark,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);

var kSearchHintStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: downDark,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);

var kBlueStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w700,
  color: mainBlue,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);