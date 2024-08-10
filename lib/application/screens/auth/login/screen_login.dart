import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtok/application/screens/admin/screen_admin.dart';
import 'package:newtok/application/screens/auth/login/bloc/bloc/login_bloc.dart';
import 'package:newtok/application/screens/auth/signup/screen_signup.dart';
import 'package:newtok/application/screens/user/screen_nav/screen_nav.dart';
import 'package:newtok/application/utils/colors.dart';
import 'package:newtok/application/utils/height_width.dart';
import 'package:newtok/application/utils/routs.dart';
import 'package:newtok/application/utils/snakbar_sowdiolag.dart';
import 'package:newtok/application/utils/validation.dart';
import 'package:newtok/application/widgets/login_signup_button.dart';
import 'package:newtok/application/widgets/login_signup_text.dart';
import 'package:newtok/application/widgets/login_text_formfield.dart';

class ScreenLogIn extends StatelessWidget {
  const ScreenLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController eMailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginSignUpHedingWidget(
                  title: 'Login',
                  text: 'Login to get started',
                ),
                kHeight20,
                const Text(
                  'Email',
                  style: TextStyle(color: kClrGrey),
                ),
                BuildTextFormField(
                  hintTxt: 'Enter Email',
                  prfixIcon: Icons.email_outlined,
                  controller: eMailController,
                  validator: (value) {
                    return Validatior.validateEmail(value);
                  },
                ),
                kHeight40,
                const Text(
                  'Password',
                  style: TextStyle(color: kClrGrey),
                ),
                BuildTextFormField(
                  obscureTxt: true,
                  hintTxt: 'Enter Password',
                  prfixIcon: Icons.lock_outlined,
                  controller: passwordController,
                  validator: (value) {
                    return Validatior.validatePassword(value);
                  },
                ), 
                kHeight60,
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginLoadingState) {
                      kLodingSnackbar(context);
                    } else if (state is LoginSucessState) {
                      kHideLoadingSnackbar(context);
                      kNavigationPushReplacement(context, const ScreenNavBar());
                    }
                     if (state is LoginByAdminState) {
                      kHideLoadingSnackbar(context);
                      kNavigationPushReplacement(context, ScreenAdmin());
                    }
                     else if (state is LoginErrorState ) {
                      kSnakBar(context, "Email or Password don't match", kClrRed);
                    }
                    
                  },
                  builder: (context, state) {
                    return LoginSignUpButtonWidget(
                      text: 'Login',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginBloc>(context).add(
                            AgentLoginEvent(
                              email: eMailController.text,
                              password: passwordController.text,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
                kHeight20,
                Align(
                  child: GestureDetector(
                    onTap: () {
                      kNavigationPushReplacement(context, ScreenSignup());
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        color: kClrBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
