import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Position position;
  Map<dynamic, dynamic> placeMark;
  String exactLocation;

  getExactLocation() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
    List<Placemark> placemark =
        await Geolocator().placemarkFromPosition(position);

    placeMark = placemark.asMap();

    exactLocation = placeMark[0].thoroughfare;

    if (exactLocation == null)
      return GeoPoint(position.latitude, position.longitude).toString();

    return exactLocation;
  }
}

//todo: will be needing this location on multiple ocasions , convert to model,view,controller type.
//todo:store kitchen location details to database.
