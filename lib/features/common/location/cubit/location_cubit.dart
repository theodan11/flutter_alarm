import 'package:alermtask/features/common/location/model/location_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationCubit extends Cubit<LocationModel>{
  LocationCubit() : super(LocationModel(lat: 0.0, lon: 0.0));

  void updateLatLon(double lat, double lon){
    emit(state.copyWith(lat: lat, lon: lon));
  }

  void updateLocationName(String locationName){
    emit(state.copyWith(locationName: locationName));
  }
}