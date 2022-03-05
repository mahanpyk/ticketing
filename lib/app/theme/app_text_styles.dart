import 'package:flutter/material.dart';
import 'package:ticketing_app/app/theme/app_colors.dart';

class AppTextStyles {
  static const TextStyle _base = TextStyle(
    fontFamily: "IRANSans",
    color: AppColors.defaultTextColor,
  );
  static final headline1 = _base.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w700,
  );
  static final headline2 = _base.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );
  static final headline3 = _base.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static final headline4 = _base.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static final headline5 = _base.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static final headline6 = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static final subtitle1 = _base.copyWith(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static final subtitle2 = _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static final bodyText1 = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static final bodyText2 = _base.copyWith(
    fontSize: 13.12,
    fontWeight: FontWeight.w400,
  );
  static final button =
      _base.copyWith(fontSize: 15, fontWeight: FontWeight.w500);
  static final caption = _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static final overLine = _base.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
}
