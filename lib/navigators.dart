import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jobhunt/company/signin/singin.dart';
// import 'package:jobhunt/about/about_yourself.dart';
import 'package:jobhunt/forgotpwd/forgotpwd1.dart';
import 'package:jobhunt/signin/bloc/signin_bloc.dart';
import 'package:jobhunt/utils/constantss.dart';

import 'signin/signup/signup.dart';
import 'signin/singin.dart';

class Navigators {
  static void pushNav(BuildContext context, dynamic s, Map map) {
    if (s == "signin") {
      // Provider();
      // Get.to(SingIn());
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  BlocProvider(
                    create: (context) => SigninBloc(),
                    child:
              (map["from"] == typecomp)? const SignInComp(): const SingIn() ,
                  ),
                        ));
    } else if (s == "forgotpwd1") {
      // Provider();
      // Get.to(ForgotPassword1());
      Navigator.push(
          context, MaterialPageRoute(
              builder: (context) =>
                  // BlocProvider(
                  //   create: (context) => SigninBloc(),
                  //   child: const
                    ForgotPassword1(),
                  // )
          ));
    }else if(s == "signup"){
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  SignUp()));
    }
  }
}
