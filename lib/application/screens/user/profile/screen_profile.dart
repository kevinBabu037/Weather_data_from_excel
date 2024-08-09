import 'package:flutter/material.dart';
import 'package:newtok/application/screens/auth/login/screen_login.dart';
import 'package:newtok/application/utils/routs.dart';
import 'package:newtok/application/widgets/error_ui_and_empty_ui_text.dart';
import 'package:newtok/data/shared_pref/shared_pref.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});
 
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title:const Text("Profile"),
        actions: [
          IconButton(onPressed: (){
           SharedPreferenses.deleteBool().
           then((value) { 
             kNavigationPushRemoveUntil(context,const ScreenLogIn());
           },);

          }, icon:const Icon(Icons.logout))
        ],
      ),
     body: centerText("profile"),
    );
  }
}