// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:yandex_mapkit/yandex_mapkit.dart';

// class MyMapPage extends StatefulWidget {
//   const MyMapPage({super.key});

//   @override
//   State<MyMapPage> createState() => _MyMapPageState();
// }

// class _MyMapPageState extends State<MyMapPage> {
//  final List<MapObject> mapObjects = [];

//   @override
//   void initState() {
//     super.initState();

//     // Добавляем маркер (placemark)
//     mapObjects.add(
//       PlacemarkMapObject(
//         mapId: const MapObjectId("ny_marker"),
//         point: const Point(latitude: 40.7128, longitude: -74.0060),
//         icon: PlacemarkIcon.single(
//           PlacemarkIconStyle(
//             image: BitmapDescriptor.fromAssetImage("assets/marker.png"),
//             scale: 1.5,
//           ),
//         ),
//       ),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Location")),
//       body: Column(
//         children: [

//         ],
//       )
//     );
//   }
// }
