import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jobhunt/navigators.dart';
import 'package:jobhunt/pages/overview.dart';
import 'package:jobhunt/pages/profile/profile.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:provider/provider.dart';
import 'package:responsive/logic.dart';

import '../appbar/navdrawer.dart';
import '../sidemenu/sidemenu.dart';
import '../utils/colors.dart';


enum Page { overview, profile }

extension on Page {
  String get route => describeEnum(this);
}
class DashBoarTemplate extends StatefulWidget {
  DashBoarTemplate({Key? key}) : super(key: key);

  @override
  State<DashBoarTemplate> createState() => _DashBoarTemplateState();
}

class _DashBoarTemplateState extends State<DashBoarTemplate> {
  PageController page = PageController();
  int selectedIndex = 1; //dont set it to 0

  bool isExpanded = true;


  // final List<Widget> _fragments = [
  //   OverView(),
  //   Profile(),
  //   // SearchPage()
  // ];
  // List<int> _backStack = [0];
  // int _currentIndex = 0;

  // void navigateBack(int index) {
  //   setState(() => _currentIndex = index);
  // }
  //  customPop(BuildContext context) {
  //   if (_backStack.length - 1 > 0) {
  //     navigateBack(_backStack[_backStack.length - 1]);
  //   } else {
  //     _backStack.removeAt(_backStack.length - 1);
  //     Provider.of<StreamBackStackSupport>(context, listen: false)
  //         .switchBetweenPages(homePages.values[_backStack.length - 1]);
  //     Navigator.pop(context);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
    double screenWidth = mediaquerySize.width;
    double screenHeight = mediaquerySize.height;
    var a = Responsive.gridSize(screenWidth);

    final navigatorKey = GlobalObjectKey<NavigatorState>(context);

    var maxW = 0.0;
    var i1;
    return Scaffold(
      drawer: (a <= 2) ? const NavDrawer(type: {"from":typecand}) : null,
      body: Container(
        color: dashBoarbgColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (a > 2) SideMenuDash(),
            // Container(
            //   child: Navigator(
            //     onGenerateRoute: (selectedIndex){
            //       MaterialPageRoute(builder: (context)=>OverView());
            //     },
            //       // MaterialPageRoute(builder: (context)=>OverView())
            //   ),
            // )
            // Container(
            //   child: Navigator(
            //     key: navigatorKey,
            //     initialRoute: Page.overview.route,
            //     onGenerateRoute: (settings) {
            //       final pageName = settings.name;
            //
            //       final pagea = _fragments.firstWhere(
            //               (element) => describeEnum(element) == pageName) ;
            //       var a = _fragments.indexOf(pagea);
            //
            //       return MaterialPageRoute(settings: settings,
            //           builder: (context) => _fragments[a]);
            //     },
            //   ),
            // ),
            // OverView(),
            Profile(),
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



// enum homePages { overview, screenProfile, screenSearch }
// enum homePages { overview, profile }

// class StreamBackStackSupport {
//   final StreamController<homePages> _homePages = StreamController<homePages>();
//
//   Stream<homePages> get selectedPage => _homePages.stream;
//
//   void switchBetweenPages(homePages selectedPage) {
//     _homePages.add(homePages.values[selectedPage.index]);
//   }
//
//   void close() {
//     _homePages.close();
//   }
// }
