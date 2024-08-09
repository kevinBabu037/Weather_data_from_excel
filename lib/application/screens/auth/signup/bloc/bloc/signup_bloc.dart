import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:newtok/data/firebase%20service/auth/auth_service.dart';


part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    
     on<SignupEvent>(signupEvent);

  }


  FutureOr<void> signupEvent(SignupEvent event, Emitter<SignupState> emit)async {
    
      emit(SignUpLoadingState());
       bool result = await AuthService.signUp(event.name, event.email, event.pasword);

       if (result) {
         emit(SignUpSuccessState());
       }else{
         emit(SignUpErroeState(error:"Fail to add user" ));
       }

  }





}
