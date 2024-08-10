import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newtok/data/firebase%20service/user/profile_service.dart';
import 'package:newtok/data/model/profile_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {

   

    on<FechUserProfileEvent>((event, emit)async {
       emit(ProfileLoadingState());
       
       ProfileModel? profile = await ProfileService.fetchUserProfile();

       if (profile!=null) {
         emit(ProfileSuccessState(profile: profile)); 
       }else{
         emit(ProfileErrorState());
       }

    });
  }
}
