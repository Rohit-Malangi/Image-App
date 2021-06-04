// import 'package:flutter/material.dart';
// import 'package:location/location.dart';

// class LocationInput extends StatefulWidget {
//   const LocationInput({Key? key}) : super(key: key);

//   @override
//   _LocationInputState createState() => _LocationInputState();
// }

// class _LocationInputState extends State<LocationInput> {
//   //String _previewImageUrl;

//   Future<void> _getCurrentLocation() async {
//     final locData = Location().getLocation();
//     //print(locData.latitude);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       Container(
//         height: 170,
//         width: double.infinity,
//         alignment: Alignment.center,
//         decoration:
//             BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
//         child:
//             const Text('No location Choosen Yet', textAlign: TextAlign.center),
//         //_previewImageUrl == null
//         // ? const Text('No location Choosen Yet', textAlign: TextAlign.center)
//         // Image.network(_previewImageUrl),
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextButton.icon(
//             style:
//                 TextButton.styleFrom(primary: Theme.of(context).primaryColor),
//             onPressed: _getCurrentLocation,
//             label: const Text('Current Location'),
//             icon: const Icon(Icons.location_on),
//           ),
//           TextButton.icon(
//             style:
//                 TextButton.styleFrom(primary: Theme.of(context).primaryColor),
//             onPressed: () {},
//             label: const Text('Choose Location'),
//             icon: const Icon(Icons.map),
//           ),
//         ],
//       )
//     ]);
//   }
// }
