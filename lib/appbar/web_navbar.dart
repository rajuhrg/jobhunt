import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobhunt/navigators.dart';


// import 'package:jobhunt/signin/singin.dart';
import 'package:jobhunt/utils/colors.dart';
import 'package:responsive/logic.dart';
// import 'package:jobhunt/navigators.dart';

import 'webmenu.dart';

class WebNavBar extends StatelessWidget {
  const WebNavBar({Key? key, required this.loaded}) : super(key: key);
final String loaded;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
    double screenWidth = mediaquerySize.width;
    var a = Responsive.gridSize(screenWidth);
    return (screenWidth < 320)
        ? const Text("")
        : Flex(
            direction: Axis.horizontal,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (a >= 4) const WebMenu(),
              // for (var item in appbarItems)
              //   InkWell(
              //     onTap: (){},

              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //       child: Text(
              //         item.toString(),
              //         style: TextStyle(color: pColor),
              //       ),
              //     ),
              //   ),

              SizedBox(
                height: 1,
              ),
              //  Divider(
              //   height: 1,
              //   color: Colors.black26,
              // )

              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.sms_outlined,
                  color: iconColor,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_outlined,
                    color: iconColor,
                  )),
              if (a > 1)
                Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [pbtnColor1, pbtnColor2],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    // padding: EdgeInsets.all(0.0),
                    onPressed: () {
                      print("pressed sing up button");
                      Navigators.pushNav(context, "signup", {"from":loaded});
                    },
                    child: const Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          fontFamily: "Karla"),
                    ),
                  ),
                ),

              // MaterialButton(
              //   onPressed: () {},
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30.0)),
              //   padding: EdgeInsets.all(0.0),
              //   child: Ink(
              //     decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //         colors: [pbtnColor1, pbtnColor2],
              //         begin: Alignment.centerLeft,
              //         end: Alignment.centerRight,
              //       ),
              //       // borderRadius: BorderRadius.circular(30.0),
              //     ),
              //     child: Container(
              //       // constraints: BoxConstraints(maxWidth: 100.0, minHeight: 40.0),
              //       alignment: Alignment.center,
              //       child: Text(
              //         "SignUp",
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              if (screenWidth > 380)
                TextButton(
                  onPressed: () {
                    Navigators.pushNav(context,"signin",{"from":loaded});
                  },
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          color: pbtnColor1,
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              // IconButton(
              //     onPressed: () {
              //
              //     },
              //     icon: Icon(
              //       Icons.keyboard_arrow_down,
              //       color: iconColor,
              //     )),
              PopupMenuButton(
                icon: Icon(Icons.keyboard_arrow_down),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: 'company',
                      child: Text('Company'),
                    )
                  ];
                },
                onSelected: (String value) {
                  print("selected value $value");
                  Navigator.pushNamed(context, '/company');
                },
              ),
            ],
          );
  }
}
