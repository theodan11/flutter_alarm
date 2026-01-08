import 'package:geocoding/geocoding.dart';

Future<String> getLocationName(double lat, double lon) async{
    try{
      List<Placemark> placeMarks = await placemarkFromCoordinates(lat, lon);
      Placemark place = placeMarks.first;

      return "${place.locality}, ${place.administrativeArea}, ${place.country}";
    }catch(error){
      return throw Exception("Error getting location");

    }
}