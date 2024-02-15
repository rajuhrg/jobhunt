
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Social extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  Social({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      alignment: WrapAlignment.spaceAround,
      children: [
        MaterialButton(
          height: 40,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Icon(
            Icons.stay_current_portrait,
            color: Colors.white,
            size: 19.0,
          ),
          onPressed: () {},
          color: Color(0xFF081850),

          // padding: socialbtnpadding,
        ),
        MaterialButton(
          height: 40,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child:Image.asset("assets/icons/googleicon.png",width: 19.0,),
          // Image.asset("assets/icons/google.png", width: 50, height: 30,),
          onPressed: () {},
          color: Colors.white,

          // padding: socialbtnpadding,
        ),
        MaterialButton(
          height: 40,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: SvgPicture.asset("assets/icons/facebook.svg",width: 12.0, height: 18,color: Colors.white,),
          // Text("f", style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
          // Image.asset(
          //   "assets/icons/facebook.jpeg",
          //   width: 40,
          //   height: 30,
          // ),
          onPressed: () {},
          color: Color(0xFF036AE3),
          // padding: socialbtnpadding,
        ),
      ],
    );
  }
}
