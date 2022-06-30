import 'package:flutter/material.dart';

import 'head.dart';
import 'injection_container.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}
