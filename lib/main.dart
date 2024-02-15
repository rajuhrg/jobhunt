import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobhunt/about/about_yourself.dart';
import 'package:jobhunt/company/home/company_home.dart';
import 'package:jobhunt/company/pages/postJob/postJobComp.dart';


// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:jobhunt/pages/dashboard_template.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sizer/sizer.dart';

import 'home/home.dart';
// import 'profile/profile_dashboard.dart';

import 'utils/constantss.dart';

// void _enablePlatformOverrideForDesktop() {
//   if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
//     debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
//   }
// }
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(JobApp());
}

class JobApp extends StatefulWidget {
  const JobApp({Key? key}) : super(key: key);

  @override
  State<JobApp> createState() => _JobAppState();
}

class _JobAppState extends State<JobApp> {
  MaterialColor colorCustom = MaterialColor(0xFF8F1560, color);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(//ResponsiveSizer
        builder: (context, orientation, screenType) {
      return MaterialApp(
        title: 'Jobhunt',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // ).copyWith(
          primarySwatch: colorCustom,
          //   colorScheme: ThemeData().colorScheme.copyWith(
          //     primary: colorCustom,
          //   ),
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme,
          ),
          // iconTheme: Brightness.dark,
          // brightness: Brightness.light
          //      textTheme: GoogleFonts.karlaTextTheme(
          //   Theme.of(context).textTheme, // If this is not set, then ThemeData.light().textTheme is used.
          // ),
        ),
        // home: Home(),
        initialRoute: "/",
        routes: {
          '/' : (context) => Home(), //original
          // '/' : (context) => AboutYourSelf(),
          '/company' : (context) =>  CompanyHome(),
          // '/company' : (context) => PostJobComp(),// CompanyHome(),
        },
      );
      //  Home(),
      // home: ProfileDashBoard(),
      // home: DashBoarTemplate(),
    });
  }
}
