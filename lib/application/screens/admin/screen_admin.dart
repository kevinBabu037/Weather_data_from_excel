import 'package:flutter/material.dart';
import 'package:newtok/application/screens/admin/widget/custom_textformfield.dart';
import 'package:newtok/application/screens/auth/login/screen_login.dart';
import 'package:newtok/application/utils/colors.dart';
import 'package:newtok/application/utils/height_width.dart';
import 'package:newtok/application/utils/routs.dart';
import 'package:newtok/application/utils/snakbar_sowdiolag.dart';
import 'package:newtok/application/utils/validation.dart';
import 'package:newtok/data/firebase%20service/admin/firebase_service.dart';

class ScreenAdmin extends StatelessWidget {
   ScreenAdmin({super.key});

  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashboard"),
        actions: [
          IconButton(onPressed: (){
             kShowDialog(context: context, 
             title: "Logout?", 
             contentTxt: "Are you sure want to logout?", 
             actionBtn1Txt: "Cancel", 
             actionBtn2Txt: "Logout", 
             onPressed:(){  
              kNavigationPushRemoveUntil(context,const ScreenLogIn());
             }
             );
          }, icon:const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const Text("Add Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22 ),),
               kHeight20,
                CustomTextFormFeild(
                  validator: (value) =>Validatior.validateMin4Char(value) ,
                  controller: _countryController,
                  hintTxt: 'Enter Country',
                ),
                kHeight30, 
                CustomTextFormFeild(
                   validator: (value) =>Validatior.validateMin4Char(value) ,
                  controller: _stateController,
                  hintTxt: 'Enter State',
                ),
                kHeight30,
                CustomTextFormFeild(
                   validator: (value) =>Validatior.validateMin4Char(value) ,
                  controller: _districtController,
                  hintTxt: 'Enter District',
                ),
                kHeight30, 
                CustomTextFormFeild( 
                   validator: (value) =>Validatior.validateMin4Char(value) ,
                  controller: _cityController,
                  hintTxt: 'Enter City',
                ), 
              ], 
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
        if (formKey.currentState!.validate()) {
           await AdminService().addLocationData(country: _countryController.text, state: _stateController.text, district: _districtController.text, city: _cityController.text).then((v){
          if (v) {
            kSnakBar(context,v? 'Added':'Fail to add',v? kClrGreen:kClrRed);
          }
         });
        }
        },
        child:const Text("ADD",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
    );
  }
}