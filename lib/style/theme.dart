import 'package:flutter/material.dart';
import 'dart:ui';

Map<int, Color> getSwatch(Color color) {
  final hslColor = HSLColor.fromColor(color);
  final lightness = hslColor.lightness;
  final lowDivisor = 6;

  final highDivisor = 5;

  final lowStep = (1.0 - lightness) / lowDivisor;
  final highStep = lightness / highDivisor;

  return {
    50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
    100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
    200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
    300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
    400: (hslColor.withLightness(lightness + lowStep)).toColor(),
    500: (hslColor.withLightness(lightness)).toColor(),
    600: (hslColor.withLightness(lightness - highStep)).toColor(),
    700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
    800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
    900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
  };
}

const kBannerTitleStyle = const TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w800,
    fontSize: 40.0,
    color: const Color(0xff212121),
    decoration: TextDecoration.none);

const kBannerPlasmaTitleStyle = const TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w800,
    fontSize: 40.0,
    color: const Color(0xfff0485b),
    decoration: TextDecoration.none);

const kBannerSubTitleStyle = const TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: const Color(0xFF212121),
    fontSize: 20.0,
    decoration: TextDecoration.none);

const kBannerSub02TitleStyle = const TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w800,
    color: const Color(0xFF212121),
    fontSize: 24.0,
    decoration: TextDecoration.none);
