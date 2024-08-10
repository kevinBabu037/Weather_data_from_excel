
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtok/application/screens/auth/login/bloc/bloc/login_bloc.dart';
import 'package:newtok/application/screens/auth/signup/bloc/bloc/signup_bloc.dart';
import 'package:newtok/application/screens/user/excel%20upload/bloc/bloc/weather_bloc.dart';
import 'package:newtok/application/screens/user/excel%20upload/bloc/excelbloc/bloc/excel_bloc.dart';
import 'package:newtok/application/screens/user/home/bloc/location_bloc.dart';
import 'package:newtok/application/screens/user/home/cubit/theme.dart';
import 'package:newtok/application/screens/auth/login/screen_login.dart';
import 'package:newtok/application/screens/user/profile/bloc/bloc/profile_bloc.dart';
import 'package:newtok/application/screens/user/screen_nav/cubit/nav_bar.dart';
import 'package:newtok/application/screens/user/screen_nav/screen_nav.dart';
import 'package:newtok/data/shared_pref/shared_pref.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
 bool isLoggedIn = await SharedPreferenses.getBoolValue() ?? false;
  runApp( MyApp(isLoggind: isLoggedIn,));
 }


 class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoggind,}); 
  final bool isLoggind;
  @override
  Widget build(BuildContext context){
     
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context) => LoginBloc(),),
        BlocProvider(create: (context) => ThemeCubit(),),
        BlocProvider(create: (context) => SignupBloc(),),
        BlocProvider(create: (context) => NavIndex(),),
        BlocProvider(create: (context) => LocationBloc(),),
        BlocProvider(create: (context) => WeatherBloc(),),
        BlocProvider(create: (context) => ExcelBloc(),),
        BlocProvider(create: (context) => ProfileBloc(),),
      ],
      child:  BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return MaterialApp(
          theme: theme,
          debugShowCheckedModeBanner: false,
          home:isLoggind? const ScreenNavBar() : const ScreenLogIn(),
        );
      },
    )
    );
  }
 }


