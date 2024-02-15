import 'package:flutter/material.dart';


class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisSize: MainAxisSize.min,
      children: [

        IconButton(
            onPressed: () {},
            icon: Image.asset('assets/icons/smsicon.png'),
            // Icon( Icons.sms,color: iconColor,          )
            ),
        // IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.notifications_outlined,
        //       color: iconColor,
        //     )),
        // TextButton(
        //     onPressed: () {
        //       // Navigator.push(context, MaterialPageRoute(builder: (context)=>SingIn()));
        //     },
        //     child: Text(
        //       "Sign In",
        //       style: TextStyle(color: pbtnColor1),
        //     )),
        // IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.keyboard_arrow_down,
        //     color: iconColor,
        //   ),
        // ),

      ],
    );
  }
}
