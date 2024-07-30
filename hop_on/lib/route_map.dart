import 'package:flutter/material.dart';

class route_map extends StatefulWidget {
  const route_map({super.key});

  @override
  State<route_map> createState() => _route_mapState();
}

class _route_mapState extends State<route_map> {
  double _scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Center(
        child: InteractiveViewer(
          panEnabled: false, // Set it to false
          boundaryMargin: EdgeInsets.all(20),
          minScale: 0.5,
          maxScale: 5.0,
          child: Container(
            width: 400,
            height: 500,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                'assets/buses_maps.jpg',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
