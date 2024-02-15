
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobhunt/pages/profile/dashboard_menucontroller.dart';
import 'package:responsive/logic.dart';

import '../pages/profile/profile.dart';
import '../utils/colors.dart';
import '../utils/constantss.dart';
import '../utils/dash/CDM.dart';
import '../utils/dash/Txt.dart';

 DashBoardMenuController dashController = Get.put(DashBoardMenuController());
class SideMenuDash extends StatefulWidget {
   SideMenuDash({Key? key}) : super(key: key);
  @override
  State<SideMenuDash> createState() => _SideMenuDashState();

  static List<CDM> cdms = [
    // CDM(Icons.grid_view, "Control", []),

    CDM(Icons.pie_chart_rounded, "Overview", []),
    CDM(Icons.work, "Job", [
      "Personal",
      "Resume Management",
      "Professional Details",
      "Skills",
      "Educational Details",
      "Certification Details",
      "Achievements or Patents",
      "Social Network",
    ]),
    CDM(Icons.date_range, "Calendar", []),
    CDM(Icons.settings, "Setting", []),
    CDM(Icons.chat_rounded, "Message", []),
    CDM(Icons.notifications_outlined, "Notification", []),
    CDM(Icons.help, "Help", []),
  ];
}

class _SideMenuDashState extends State<SideMenuDash> {
    int selectedIndex = -1; 
 //dont set it to 0
  bool isExpanded = true;

    @override
    dispose() {
      // animationController.dispose(); // you need this
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
     MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
    double screenWidth = mediaquerySize.width;
    double screenHeight = mediaquerySize.height;
    var a = Responsive.gridSize(screenWidth);
    return // Obx(() =>
       Container(
       child:
                isExpanded
                    ? blackIconMenu()
                    : blackIconTiles()
      // ),
    );
  }

  blackIconMenu() {
    return Container(
      width: 250,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
            right: BorderSide(
                width: 1, color: Colors.black, style: BorderStyle.solid)),
      ),
      child: Column(children: [
        controlTile(),
        Expanded(
          child: ListView.builder(
            controller: ScrollController(),
            itemCount: SideMenuDash.cdms.length,
            itemBuilder: (BuildContext context, int index) {
              //  if(index==0) return controlTile();
              CDM cdm = SideMenuDash.cdms[index];

              bool selected = selectedIndex == index;
              return ExpansionTile(
                  onExpansionChanged: (z) {
                    setState(() {
                      selectedIndex = z ? index : -1;
                    });
                  },
                  leading: Icon(cdm.icon, color: primaryPurple),
                  title: Txt(
                    text: cdm.title,
                    color: secondaryColor2,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.1,
                    fontSize: 16.0,
                  ),
                  trailing: (cdm.submenus.isEmpty)
                      ? const Text("")
                      : Icon(
                          selected
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: primaryPurple,
                        ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: cdm.submenus.map((subMenu) {
                          return sMenuButton(subMenu, false);
                        }).toList(),
                      ),
                    ),
                  ]);
            },
          ),
        ),
        // Text("icon mennu"),
      ]),
    );
  }
  blackIconTiles() {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      // color: Colors.white,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
            right: BorderSide(
                width: 1, color: Colors.black, style: BorderStyle.solid)),
      ),
      // decoration: const BoxDecoration(
      //     border: Border(right: BorderSide(color: Colors.black45))),
      width: 100,
      child: Column(
        children: [
          controlTile(),
          Expanded(
            child: ListView.builder(
                controller: ScrollController(),
                itemCount: SideMenuDash.cdms.length,
                itemBuilder: (contex, index) {
                  // if(index==0) return controlButton();
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      height: 45,
                      alignment: Alignment.center,
                      child: Icon(SideMenuDash.cdms[index].icon, color: primaryPurple),
                    ),
                  );
                }),
          ),
          Text("icon  tiles"),
        ],
      ),
    );
  }

  void expandOrShrinkDrawer() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  controlTile() {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 30),
      child: ListTile(
        leading: isExpanded
            ? Icon(
                Icons.arrow_back,
                color: primaryPurple,
              )
            : null, //Icon(Icons.arrow_forward),// FlutterLogo(),
        title: isExpanded
            ? Txt(
                text: appname,
                fontSize: 18,
                color: primaryColor,
                fontWeight: FontWeight.bold,
              )
            : Icon(Icons.arrow_forward, color: primaryPurple),
        onTap: expandOrShrinkDrawer,
      ),
    );
  }

  // Widget sMenuButton(String subMenu, bool bool) {
  Widget sMenuButton(String subMenu, bool isTitle) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          child: InkWell(
            hoverColor: Colors.amber.shade200,
            onTap: () {
              //handle the function
              //if index==0? donothing: doyourlogic here
              if (subMenu == "Personal") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              } else {
                print(subMenu);
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Txt(
                text: subMenu,
                fontSize: isTitle ? 17 : 14,
                color: isTitle ? Colors.black45 : textColor2,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget invisibleSubMenus() {
  //   // List<CDM> _cmds = cdms..removeAt(0);
  //   return AnimatedContainer(
  //     duration: const Duration(milliseconds: 500),
  //     width: isExpanded ? 0 : 125,
  //     color: Colors.white, // Colorz.compexDrawerCanvasColor,
  //     child: Column(
  //       children: [
  //         Container(height: 95),
  //         Expanded(
  //           child: ListView.builder(
  //               controller: ScrollController(),
  //               itemCount: SideMenuDash.cdms.length,
  //               itemBuilder: (context, index) {
  //                 CDM cmd = SideMenuDash.cdms[index];
  //                 // if(index==0) return Container(height:95);
  //                 //controll button has 45 h + 20 top + 30 bottom = 95
  //
  //                 bool selected = selectedIndex == index;
  //                 bool isValidSubMenu = selected && cmd.submenus.isNotEmpty;
  //                 return subMenuWidget(
  //                     [cmd.title]..addAll(cmd.submenus), isValidSubMenu);
  //               }),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget subMenuWidget(List<String> submenus, bool isValidSubMenu) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: isValidSubMenu ? submenus.length.toDouble() * 37.5 : 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isValidSubMenu ? Colors.blueGrey : Colors.transparent,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          )),
      child: ListView.builder(
          controller: ScrollController(),
          padding: EdgeInsets.all(6),
          itemCount: isValidSubMenu ? submenus.length : 0,
          itemBuilder: (context, index) {
            String subMenu = submenus[index];
            return sMenuButton(subMenu, index == 0);
          }),
    );
  }
}