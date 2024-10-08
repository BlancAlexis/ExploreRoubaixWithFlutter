import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:template_flutter_but/application/injections/initializer.dart';
import 'package:template_flutter_but/data/local/database_model/geo_point_2d_model_database.dart';
import 'package:template_flutter_but/ui/screens/nav_bar/nav_bar_ui.dart';

import 'data/local/database_model/photo_model_database.dart';
import 'data/local/database_model/place.model_database.dart';
import 'data/local/database_model/result_model_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeInjections();
  await Hive.initFlutter();
  Hive.registerAdapter(ResultModelDatabaseAdapter());
  Hive.registerAdapter(PhotoModelDatabaseAdapter());
  Hive.registerAdapter(PlaceModelDatabaseAdapter());
  Hive.registerAdapter(LatLngAdapterAdapter());
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Site historique',
      home: MyHomePage(
        title: '',
      ),
    );
  }
}
