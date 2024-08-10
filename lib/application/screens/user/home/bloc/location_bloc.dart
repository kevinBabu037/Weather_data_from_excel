import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newtok/data/firebase%20service/user/location_service.dart';
import 'package:newtok/data/model/location_model.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {


    on<FechLocations>((event, emit)async {
       emit(LocationLoadingState());
      
     List<LocationModel> locations = await LocationService().getLocations();

     if (locations.isNotEmpty) {
       emit(LocationSuccessStae(locations: locations));
     }else if(locations.isEmpty){
       emit(LocationEmptyState());
     }else{
       emit(LocationErrorState());
     }
    });



  }
}
