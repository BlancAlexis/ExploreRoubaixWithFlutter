import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:template_flutter_but/application/injections/initializer.dart';
import 'package:template_flutter_but/domain/database/geo_point_2d_entity_database.dart';
import 'package:template_flutter_but/domain/database/photo_entity_database.dart';
import 'package:template_flutter_but/domain/database/result_entity_database.dart';
import 'package:template_flutter_but/domain/entities/geo_point_2d_entity.dart';
import 'package:template_flutter_but/ui/d.dart';
import 'package:template_flutter_but/ui/screens/home/home.screen.dart';
import 'package:template_flutter_but/ui/screens/nav_bar/nav_bar_ui.dart';

import 'data/local/adapter/StringListHiveAdapter.dart';
import 'domain/entities/photo_entity.dart';
import 'domain/entities/result_entity.dart';

void main() async {
  initializeInjections();
  await Hive.initFlutter();
  Hive.registerAdapter(ResultEntityDatabaseAdapter());
  Hive.registerAdapter(PhotoEntityDatabaseAdapter());
  Hive.registerAdapter(GeoPoint2DEntityDatabaseAdapter());
 // TODO  Hive.registerAdapter(StringListHiveAdapter());
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MySingleton();
    return const MaterialApp(
      title: 'Site historique',
      home: MyHomePage(title: '',),
    );
  }
}
