import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  void push(Widget widget) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => widget));
  }

  void pop() => Navigator.pop(this);
}
