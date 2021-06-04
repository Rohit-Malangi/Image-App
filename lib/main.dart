import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/great_places.dart';
import '../screens/places_list_screen.dart';
import '../screens/add_place.dart';
import './screens/places_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Places Gallery',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: const PlaceListScreen(),
        routes: {
          AddPlaces.routeName: (ctx) => const AddPlaces(),
          PlaceDetail.routeNmae: (ctx) => const PlaceDetail(),
        },
      ),
    );
  }
}
