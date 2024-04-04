import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:template_flutter_but/application/injections/initializer.dart';
import 'package:template_flutter_but/ui/screens/home/home.screen.dart';
import 'package:template_flutter_but/ui/screens/nav_bar/nav_bar_ui.dart';

import 'data/local/adapter/StringListHiveAdapter.dart';

void main() async {
  initializeInjections();
  await Hive.initFlutter();
 // TODO  Hive.registerAdapter(StringListHiveAdapter());
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Site historique',
      home: MyHomePage(title: '',),
    );
  }
}
