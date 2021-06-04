import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../helpers/db_helper.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> itemsList = [];

  List<Place> get items {
    return [...itemsList];
  }

  Place findById(String id) {
    return itemsList.firstWhere((place) => id == place.id);
  }

  void addPlace(String title, File image) {
    final newPlace =
        Place(id: DateTime.now().toString(), title: title, image: image);
    itemsList.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchSetPlace() async {
    final dataList = await DBHelper.getData('user_places');
    itemsList = dataList
        .map((item) => Place(
              id: item['id'],
              title: item['title'],
              image: File(item['image']),
            ))
        .toList();
    notifyListeners();
  }
}
