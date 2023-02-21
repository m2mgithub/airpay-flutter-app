import 'package:flutter/material.dart';

const Color mainColor = Color(0xFFf2f2f2);
const Color midColor = Color(0xFF522349);
const Color primaryColor = Color(0xFFCDCCCC);

const Color kBlueMain = Color(0xFF1B7FE9);
const Color kBluefadeone = Color(0xFF2A8AEF);
const Color kSkyBlue = Color(0xFF5CAFFC);

const Color kOrangeMain = Color(0xFFFEB92E);
const Color kOrangeFaded = Color(0xFFFFCE75);

const Color kBlackMain = Color(0xFF2B2B2B);
const Color kBlackFaded = Color(0xFF707070);

const Color kGreyColor = Color(0xFFBCBCBC);
const Color kBackgroundColor = Color(0xFFF1F1F1);

const kOrangeGradient = LinearGradient(
  colors: <Color>[kOrangeMain, kOrangeFaded],
  // stops: [0.0, 0.5, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const kBlueGradient = LinearGradient(
  colors: <Color>[kBlueMain, kSkyBlue],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const purpleGradient = LinearGradient(
  colors: <Color>[mainColor, midColor],
  stops: [0.0, 0.5, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);