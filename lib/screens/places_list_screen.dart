import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/add_place.dart';
import '../providers/great_places.dart';
import '../screens/places_detail_screen.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Places List'),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AddPlaces.routeName),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
        future:
            Provider.of<GreatPlaces>(context, listen: false).fetchSetPlace(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : Consumer<GreatPlaces>(
                builder: (ctx, greatPlace, _) => greatPlace.items.isEmpty
                    ? const Center(child: Text('No Places Added Yet'))
                    : ListView.builder(
                        itemCount: greatPlace.items.length,
                        itemBuilder: (ctx, index) => ListTile(
                              leading: CircleAvatar(
                                  maxRadius: 35,
                                  backgroundImage:
                                      FileImage(greatPlace.items[index].image)),
                              title: Text(
                                greatPlace.items[index].title,
                                style: const TextStyle(fontSize: 20),
                              ),
                              //subtitle: Text(greatPlace.items[index].location),
                              onTap: () => Navigator.of(context).pushNamed(
                                PlaceDetail.routeNmae,
                                arguments: greatPlace.items[index].id,
                              ),
                              contentPadding: const EdgeInsets.all(10),
                            )
                        //const SizedBox(height: 10);
                        ),
              ),
      ),
    );
  }
}
