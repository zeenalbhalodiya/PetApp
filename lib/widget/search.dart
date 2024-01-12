import 'dart:async';
import 'package:flutter/material.dart';

class SearchBouncer {
  Timer? _timer;
  final int milliSecond;
  VoidCallback? action;

  SearchBouncer({required this.milliSecond});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliSecond), action);
  }

  static filterList(List list, String searchText) {
    List searchList = list;
    /*searchList.map((e) => null);*/
    searchList.where((c) {
      return (c.country.toLowerCase()).contains(searchText.toLowerCase());
    });
    return searchList;
  }
}
