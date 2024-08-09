
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtok/application/screens/auth/signup/bloc/bloc/signup_bloc.dart';
import 'package:newtok/application/screens/auth/signup/widgets/already_have_acc.dart';
import 'package:newtok/application/screens/user/screen_nav/screen_nav.dart';
import 'package:newtok/application/utils/colors.dart';
import 'package:newtok/application/utils/height_width.dart';
import 'package:newtok/application/utils/routs.dart';
import 'package:newtok/application/utils/snakbar_sowdiolag.dart';
import 'package:newtok/application/utils/validation.dart';
import 'package:newtok/application/widgets/login_signup_button.dart';
import 'package:newtok/application/widgets/login_signup_text.dart';
import 'package:newtok/application/widgets/login_text_formfield.dart';


class ScreenSignup extends StatelessWidget {
   ScreenSignup({super.key});
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 

  @override
  Widget build(BuildContext context) { 
    TextEditingController nameController = TextEditingController();
    TextEditingController eMailController = TextEditingController();
    TextEditingController passWordController = TextEditingController(); 
    return  Scaffold(
      body: SafeArea(  
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15), 
          child: SingleChildScrollView( 
            child: Form(
              key: _formKey,
              child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              
                kHeight15,
              const LoginSignUpHedingWidget( 
                    title: 'Create Account',
                    text: 'Sign up to get started',
                   ),
                 kHeight40, 
                  const Text('Name',style:TextStyle(color:kClrGrey),),  
                   BuildTextFormField( 
                    controller: nameController,
                  hintTxt:'Enter Name',
                  prfixIcon: Icons.person_outlined, 
                  validator: (value) {
                    return   Validatior.validateNameAndUserName(value);
                  },
                  ),
                
                  kHeight30,
                  
                  const Text('Email',style:TextStyle(color:kClrGrey),),   
                   BuildTextFormField( 
                    validator:(value) {
                    return  Validatior.validateEmail(value); 
                      
                    },
                    controller: eMailController,
                  hintTxt:'Enter Email', 
                  prfixIcon: Icons.email_outlined, 
                  ),
                
                  kHeight30,
                  
                  const Text('Password',style:TextStyle(color:kClrGrey),),   
                   BuildTextFormField( 
                    obscureTxt: true,
                  controller:passWordController ,
                  hintTxt:'Enter Password',  
                  prfixIcon: Icons.lock_outlined, 
                  validator: (value) {
                    return Validatior.validatePassword(value); 
                  }, 
                  ),
                 kHeight50,
                 BlocConsumer<SignupBloc, SignupState>(
                   listener: (context, state) {
                    if (state is SignUpLoadingState) {
                       kLodingSnackbar(context);
                    }
                    if (state is SignUpSuccessState) {
                       kHideLoadingSnackbar(context);
                      kNavigationPushRemoveUntil(context,const ScreenNavBar());
                    }
                     if (state is SignUpErroeState) {
                       kSnakBar(context, state.error, kClrRed);
                     }
                   },
                   builder: (context, state) {
                     return LoginSignUpButtonWidget(
                      text: 'Create Account', 
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          context.read<SignupBloc>().add(SignupEvent(name: nameController.text, email: eMailController.text, pasword: passWordController.text));
                         }
                       },
                        );
                   },
                 ),
                  kHeight15,
                 const AlredyHaveAccWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}






