import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppIconsAdaptive {
  // EMAIL
  static IconData get clock =>
      Platform.isAndroid ? Icons.watch_later_outlined : CupertinoIcons.clock;

  // EMAIL
  static IconData get email =>
      Platform.isAndroid ? Icons.email_outlined : CupertinoIcons.mail;

  // FILTER
  static IconData get filter => Platform.isAndroid
      ? Icons.filter_alt_outlined
      : CupertinoIcons.slider_horizontal_3;

  // HOME
  static IconData get home =>
      Platform.isAndroid ? Icons.home : CupertinoIcons.house_alt;

  static IconData get homeFilled =>
      Platform.isAndroid ? Icons.home_filled : CupertinoIcons.house_alt_fill;

  // MOBILE PHONE
  static IconData get mobilePhone => Platform.isAndroid
      ? Icons.phone_android_outlined
      : CupertinoIcons.device_phone_portrait;

  static IconData get mobilePhoneFilled => Platform.isAndroid
      ? Icons.phone_android_rounded
      : CupertinoIcons.device_phone_portrait;

  // MOON
  static IconData get moon =>
      Platform.isAndroid ? Icons.nightlight_outlined : CupertinoIcons.moon;

  static IconData get moonFilled =>
      Platform.isAndroid ? Icons.nightlight_round : CupertinoIcons.moon_fill;

  // PASSWORD
  static IconData get password =>
      Platform.isAndroid ? Icons.lock_outline : CupertinoIcons.lock;

  // PROFILE
  static IconData get profile =>
      Platform.isAndroid ? Icons.person_outline : CupertinoIcons.person;

  static IconData get profileFilled =>
      Platform.isAndroid ? Icons.person : CupertinoIcons.person_fill;

  // SEARCH
  static IconData get search =>
      Platform.isAndroid ? Icons.search_outlined : CupertinoIcons.search;

  static IconData get searchFilled =>
      Platform.isAndroid ? Icons.search : CupertinoIcons.search;

  // SETTING
  static IconData get setting =>
      Platform.isAndroid ? Icons.settings : CupertinoIcons.gear_alt_fill;

  // SUN
  static IconData get sun =>
      Platform.isAndroid ? Icons.wb_sunny_outlined : CupertinoIcons.sun_max;

  static IconData get sunFilled =>
      Platform.isAndroid ? Icons.wb_sunny : CupertinoIcons.sun_max_fill;

  // USERNAME
  static IconData get userName =>
      Platform.isAndroid ? Icons.person_2_outlined : CupertinoIcons.person;

  // VISIBILITY
  static IconData get visibility =>
      Platform.isAndroid ? Icons.visibility_outlined : CupertinoIcons.eye;

  static IconData get visibilityOff => Platform.isAndroid
      ? Icons.visibility_off_outlined
      : CupertinoIcons.eye_slash;
}
