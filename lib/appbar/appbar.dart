import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:jobhunt/utils/colors.dart';
import 'package:responsive/logic.dart';

import 'web_navbar.dart';

class AppbarW extends StatefulWidget {
   const AppbarW({Key? key, required this.f}) : super(key: key);
final String f;
  @override
  State<AppbarW> createState() => _AppbarWState();
}

class _AppbarWState extends State<AppbarW> {
  String loadedas ="";

  @override
  void initState() {
     loadedas = widget.f; //company / candidate
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
    var a = Responsive.gridSize(mediaquerySize.width);
    return Flex(
      direction: Axis.horizontal,
      children: [
        if (a > 4)
          const Spacer(
            flex: 1,
          ),
        Expanded(
          flex: 10,
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Jobhunt",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                ),
              ),
              //  (a < 3)? NavBar() :
               WebNavBar(loaded: loadedas),
            ],
          ),
        ),
        if (a > 4)
          const Spacer(
            flex: 1,
          ),
      ],
    );
  }
}
