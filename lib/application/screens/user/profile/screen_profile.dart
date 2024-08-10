import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtok/application/screens/auth/login/screen_login.dart';
import 'package:newtok/application/screens/user/profile/bloc/bloc/profile_bloc.dart';
import 'package:newtok/application/screens/user/profile/widget/profile_details.dart';
import 'package:newtok/application/utils/height_width.dart';
import 'package:newtok/application/utils/routs.dart';
import 'package:newtok/application/utils/snakbar_sowdiolag.dart';
import 'package:newtok/application/widgets/error_ui_and_empty_ui_text.dart';
import 'package:newtok/data/shared_pref/shared_pref.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
     context.read<ProfileBloc>().add(FechUserProfileEvent());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
           const Center(
              child: CircleAvatar(
                radius: 60,
                child: Icon(
                  Icons.person,
                  size: 80,
                ),
              ),
            ),
            kHeight20,
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoadingState) {
                  return kCircularProgressIndicator;
                }else if(state is ProfileSuccessState){
                  return  ProfileDetailWidget(profile: state.profile,);
                }
                return centerText("Fail to fech");
              },
              
            ),
            kHeight20,
            Center(
              child: ElevatedButton(
                onPressed: () {
                  kShowDialog(
                    context: context,
                    title: "Logout",
                    contentTxt: "Are you sure you want to logout?",
                    actionBtn1Txt: "Cancel",
                    actionBtn2Txt: "Logout",
                    onPressed: () {
                      SharedPreferenses.deleteBool().then((value) {
                        kNavigationPushRemoveUntil(context, const ScreenLogIn());
                      });
                    },
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    const Icon(Icons.logout),
                    kWidth10,
                    const Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

