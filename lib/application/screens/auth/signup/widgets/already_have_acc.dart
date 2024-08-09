import 'package:flutter/material.dart';
import 'package:newtok/application/screens/auth/login/screen_login.dart';
import 'package:newtok/application/utils/colors.dart';
import 'package:newtok/application/utils/routs.dart';

class AlredyHaveAccWidget extends StatelessWidget {
  const AlredyHaveAccWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
     children: [
      const Text('Already have an account?'),
       GestureDetector( 
         onTap: () {
            kNavigationPushReplacement(context,const ScreenLogIn());
         },
         child: const Text(' Login',style: TextStyle(color: kClrBlue,fontSize: 16 ,fontWeight: FontWeight.bold),),
         ),
                   
     ],
       );
  }
}