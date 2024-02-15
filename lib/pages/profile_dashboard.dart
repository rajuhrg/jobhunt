import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobhunt/appbar/navdrawer.dart';
import 'package:jobhunt/pages/profile/dashboard_menucontroller.dart';
import 'package:jobhunt/sidemenu/sidemenu.dart';
import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:responsive/responsive.dart';


DashBoardMenuController dashController = Get.put(DashBoardMenuController());
class ProfileDashBoard extends StatefulWidget {
  const ProfileDashBoard({Key? key}) : super(key: key);

  @override
  State<ProfileDashBoard> createState() => _ProfileDashBoardState();
}

class _ProfileDashBoardState extends State<ProfileDashBoard> {
  PageController page = PageController();
  int selectedIndex = -1; //dont set it to 0

  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
    double screenWidth = mediaquerySize.width;
    double screenHeight = mediaquerySize.height;
    var a = Responsive.gridSize(screenWidth);

    var maxW = 0.0;
    var i1;
    return Scaffold(
      drawer: (a <= 2) ? const  NavDrawer(type: {"from":typecand}) : null,
      body: Container(
        color: dashBoarbgColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // if (a > 2) //remove comment where no need to show in mobile
              SideMenuDash(),
            // if (a > 2)
            //   (isExpanded
            //       ? blackIconMenu()
            //       : blackIconTiles()), // : Container(width: 0,),
            // Expanded(child: invisibleSubMenus()),


          ],
        ),
      ),
    );
  }
}
