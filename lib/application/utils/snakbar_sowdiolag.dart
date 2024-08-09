import 'package:flutter/material.dart';
import 'package:newtok/application/utils/colors.dart';

kSnakBar(BuildContext context,String content,Color clr){
    ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor:Colors.transparent ,
              content:Container(
                decoration:BoxDecoration(
                  color: clr, 
                  borderRadius:BorderRadius.circular(5) 
                   ) , 
                height: 40,
                width:double.infinity ,
                child: Center(child: Text(content,style:const TextStyle(fontWeight: FontWeight.bold),)),
              )
            ),
          );
}


 
kShowDialog(
  {
  required BuildContext context,
  required String title,
  required String contentTxt,
  required String actionBtn1Txt,
  required String actionBtn2Txt,
  required void Function()? onPressed
  }
){
    showDialog(
            context: context,
             builder: (context) {
               return AlertDialog(
                 title: Text(title),
                 content: Text(contentTxt),
                 actions: [
                  TextButton(onPressed: (){
                   Navigator.pop(context);
                  },
                   child: Text(actionBtn1Txt)),
                   TextButton(
                    onPressed:onPressed,
                   child: Text(actionBtn2Txt)),

                 ],
               );
             },
             );
} 


kLodingSnackbar(BuildContext context){
   ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
           content: Row(
             children:  [
               CircularProgressIndicator(),
               SizedBox(width: 20),
               Text('Logging in...'),
             ],
           ),
         ),
       );
}

void kHideLoadingSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
}



void showLocationPopUp(BuildContext context, String locationName) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).size.height * 0.2, 
      left: MediaQuery.of(context).size.width * 0.5 - 100, 
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8), 
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: kClrBlack.withOpacity(0.4),
                blurRadius: 4,
                offset:const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            locationName,
            style:const TextStyle(color:kClrWhite, fontSize: 16),
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry); 

  Future.delayed(const Duration(seconds: 1), () {
    overlayEntry.remove();
  });
}

