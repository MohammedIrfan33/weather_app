import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';

 class CardItems extends StatelessWidget {
   CardItems({
     required this.text,
     required this.image,
     required this.textResult,
     this.isWeekResult= false,
     this.color =Colors.grey,
     this.isHeading = true,

     Key? key
   }) : super(key: key);

   final String text;
   final String image;
   final Color  color;
   final String textResult;
   final  bool isWeekResult ;
   final bool isHeading;


   @override
   Widget build(BuildContext context) {
     return Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         Text(
           text,
           style: TextStyle(
               color: color,
               fontSize: 12.0
           ),
         ),
         isWeekResult ?
         Image.asset(
             image,
           width: 40.0,
           height: 30.0,
         )
         :
         Container(
           padding: const EdgeInsets.all(10.0),
           margin: EdgeInsets.symmetric(vertical: 10.0),
           width: 60.0,
           height: 60.0,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15.0),
             color: kCardItemsContainerColor,

           ),
           child: Image.asset(image),
         ),

         Text(
           textResult,
           style: kCardItemsTextResultStyle
         )

       ],
     );
   }
 }
