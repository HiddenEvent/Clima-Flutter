import 'package:geolocator/geolocator.dart';

class LocationInfo {
  double _latitude; // 위도
  double _longitude;

  double get latitude => _latitude; // 경도
  double get longitude => _longitude;

  Future<void> getCurrentLocation() async{
    try{

      //정확도를 높일수록 배터리 소모가 큼
      Position position = await Geolocator().getCurrentPosition
        (desiredAccuracy: LocationAccuracy.low);

      print(position.latitude);
      _latitude = position.latitude;
      _longitude = position.longitude;
      // 사용자에게게 위치보 동의를 구해야한다.
    }
    catch(e){
      print(e);
    }
  }
}
