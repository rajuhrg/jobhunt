import 'package:flutter/material.dart';
import 'package:jobhunt/navigators.dart';

import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/constantss.dart';

class NavDrawer extends StatefulWidget {
   const NavDrawer({Key? key, required this.type}) : super(key: key);
final Map type;
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {

  Map type = {};

  @override
  void initState() {
    type = widget.type;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
           UserAccountsDrawerHeader(
            accountName: Text('Your Name'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset("assets/images/girl-profile.png"),
                // Image.network(
                //   'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                //   fit: BoxFit.cover,
                //   width: 90,
                //   height: 90,
                // ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.purple,
              image: DecorationImage(
                fit: BoxFit.fill,
                // image: NetworkImage('https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')
                image: AssetImage("assets/images/profile-bg3.jpg")
              ),
            ),
          ),
        
          // //      const DrawerHeader(
          // //   decoration: BoxDecoration(
          // //     // color: Colors.blue,
          // //   ),
          // //   child: Text(
          // //               appname,
          // //               style: TextStyle(color: Color.fromRGBO(146, 68, 139, 1), fontSize: 22.0, fontWeight:  FontWeight.bold, fontFamily: "Roboto Mono"),
          // //             ),
          // // ),
          // Container(
          //   height: 120,
          //   // padding: EdgeInsets.symmetric(vertical: 6.0.h,horizontal: 8.0.w),

          //   alignment: Alignment.center,
          //   child: Row(children:  [
          //     IconButton(
          //       onPressed: () {
          //         popit(context, "");
          //       },
          //      icon: const Icon(Icons.arrow_back)),
          //     const Padding(
          //       // padding: EdgeInsets.only(left: 1.5.sp),
          //       padding: EdgeInsets.only(left: 10),
          //       child: Align(
          //         alignment: Alignment.center,
          //         child: Text(
          //           appname,
          //           style: TextStyle(
          //               color: Color.fromRGBO(146, 68, 139, 1),
          //               fontSize: 22.0,
          //               fontWeight: FontWeight.bold,
          //               fontFamily: "Roboto Mono"),
          //         ),
          //       ),
          //     ),
          //   ]
          //   ),
          //   decoration: const BoxDecoration(
          //     color: Colors.white,
          //     boxShadow: <BoxShadow>[
          //       BoxShadow(
          //           color: Colors.black12,
          //           blurRadius: 15.0,
          //           offset: Offset(0.0, 0.75))
          //     ],
          //   ),
          // ),

          for (var item in appbarItems)
            Card(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.ac_unit,
                      color: pColor,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        item.toString(),
                        style: const TextStyle(color: pColor),
                      ),
                    ),
                    onTap: () {
                      popit(context, item.toString(),type);
                    },
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  //  Divider(
                  //   height: 1,
                  //   color: Colors.black26,
                  // )
                ],
              ),
            ),

          Card(
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.login,
                    color: pColor,
                  ),
                  title: const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Sing In",
                      style: TextStyle(color: pColor),
                    ),
                  ),
                  onTap: () {
                    popit(context, "Sign In",type);
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>  SignIn()));
                  },
                ),
                // Divider(
                //   height: 1,
                //   color: Colors.black26,
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void popit(BuildContext context, String item, Map<dynamic, dynamic> type) {
    Navigator.of(context).pop();
    if (item == "Sign In") {
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>  SingIn()));
      Navigators.pushNav(context, "signin",type);
    }
  }
}
