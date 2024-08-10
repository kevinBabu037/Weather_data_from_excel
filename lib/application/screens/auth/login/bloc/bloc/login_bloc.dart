
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newtok/data/firebase%20service/auth/auth_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {


    on<AgentLoginEvent>((event, emit)async {
      emit(LoginLoadingState());
      
      bool res = await AuthService.login(event.email, event.password);
      if (res) {
        emit(LoginSucessState());
      } else if(res==false&& event.email!="admin@gmail.com"&&event.password!='Kevin123#'){
        emit(LoginErrorState());
      }
      if (event.email=="admin@gmail.com"&&event.password=='Kevin123#') {
         emit(LoginByAdminState());
      }
    
    });
  }
}
