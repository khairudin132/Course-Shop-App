import 'package:flutter/material.dart';

extension SeparatorListWidget on List<Widget> {
  List<Widget> separatorListWidget(Widget separator) {

    List<Widget> list = [];
    for (var i = 0; i < length - 1; i++) {
      list.add(this[i]);
      list.add(separator);
    }
    list.add(last);
    return list;
  }
}
