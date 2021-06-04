import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/great_places.dart';

class PlaceDetail extends StatelessWidget {
  const PlaceDetail({Key? key}) : super(key: key);

  static const routeNmae = '/place-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final selectedPlace =
        Provider.of<GreatPlaces>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),
      // ignore: sized_box_for_whitespace
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.file(
          selectedPlace.image,
          fit: BoxFit.cover,
          //width: double.infinity,
        ),
      ),
    );
  }
}
