
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobhunt/appbar/navdrawer.dart';
import 'package:jobhunt/company/dashboard/dashboard_menucontroller.dart';
import 'package:jobhunt/company/sidemenu/sidemenu_comp.dart';

import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:responsive/responsive.dart';

DashBoardMenuControllerComp dashController = Get.put(DashBoardMenuControllerComp());
class DashBoardCompany extends StatefulWidget {
  const DashBoardCompany({Key? key}) : super(key: key);

  @override
  _DashBoardCompanyState createState() => _DashBoardCompanyState();
}

class _DashBoardCompanyState extends State<DashBoardCompany> {

  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    print("company dash board");
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
    double screenWidth = mediaquerySize.width;
    double screenHeight = mediaquerySize.height;
    var a = Responsive.gridSize(screenWidth);

    return Scaffold(
      drawer: (a <= 2) ? const  NavDrawer(type: {"from":typecomp}) : null,
      body: Container(
        color: dashBoarbgColor,
        height: screenHeight,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            // if (a > 2) //remove comment where no need to show in mobile
            SideMenuDashComp(),
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
