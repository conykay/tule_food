import 'package:geolocator/geolocator.dart';

class LocationService {
  Position position;
  Map<dynamic, dynamic> placeMark;
  String exactLocation;

  getExactLocation() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark =
        await Geolocator().placemarkFromPosition(position);

    placeMark = placemark.asMap();

    exactLocation = placeMark[0].thoroughfare;

    return exactLocation;
  }
}
