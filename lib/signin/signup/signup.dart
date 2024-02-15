import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:jobhunt/dropzone/model/dropped_file.dart';
import 'package:jobhunt/signin/signup/uploadfile/upload_resume.dart';

import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:responsive/responsive.dart';

import '../../social.dart';
import 'privacy_check.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool keepSignIn = false;
  var a;
  late double screenWidth;
  late double screenHeight;

  bool isHighlighted = false;
  String selectedfile = "Upload the file";
  late DropzoneViewController dropController;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
     screenWidth = mediaquerySize.width;
 screenHeight = mediaquerySize.height;
 a = Responsive.gridSize(screenWidth);


    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ResponsiveRow(
          children: [
            Visibility(
              visible: (a > 2) ? true : false,
              child: FlexWidget(
                child: Container(
                  height: screenHeight,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/sin/lsingupimg.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                md: 6,
                lg: 6,
                xl: 6,
                xxl: 6,
                xxxl: 6,
                smLand: 6,
                mdLand: 6,
                lgLand: 6,
                xlLand: 6,
                xxlLand: 6,
              ),
            ),
            FlexWidget(
              child: Container(
                width: (a < 4) ? double.infinity : 510,
                height: screenHeight,
                decoration: BoxDecoration(
                  image: (a <= 2)
                      ? const DecorationImage(
                          image: AssetImage(
                        
                            "assets/images/sin/lsingupimg.png",
                          ),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      
                      width: (a < 4) ? double.infinity : 520,
                      padding: EdgeInsets.symmetric(
                          vertical: 50,
                          horizontal: (a == 2) ? screenWidth * 0.2 : 50.0),
                      child: Container(
                        color: Colors.white70,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                          child: Column(
                            crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "jobhunt",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 30.0,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Text(
                                "Find and match with the best jobs in your area. Create your account to continue.",
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w300),
                              ),
                              const  SizedBox(height: 20.0),
                              Text(
                                "Let us do the work",
                                style: TextStyle(
                                    color: primaryPurple,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 20.0),
                              MaterialButton(
                                onPressed: () async {

                                  uploadResume();
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>  UploadResume()));

                                  // FilePickerResult? result =
                                  //     await FilePicker.platform.pickFiles();
                        
                                  // if (result != null) {
                                  //   // File file = File(result.files.single.path);
                                  //   // File file = File(result.files.single.bytes.);
                                  // } else {
                                  //   // User canceled the picker
                                  // }
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                padding:const  EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFE2DFE1),
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 300.0, minHeight: 35.0),
                                    alignment: Alignment.center,
                                    child: Wrap(
                                      direction: Axis.horizontal,
                                      children: const [
                                        Icon(Icons.upload),
                                        Text(
                                          "Upload your resume",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF5F6368),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                             const  SizedBox(height: 20.0),
                              Row(children: const <Widget>[
                                Expanded(
                                  child: Divider(
                                    thickness: 1.0,
                                    color: Color(0xFF5F6368),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Text(
                                    " or ",
                                    style: TextStyle(color: Color(0xFF9FA2B4)),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 1.0,
                                    color: Color(0xFF5F6368),
                                  ),
                                ),
                              ]),
                              const SizedBox(height: 30.0),
                              SizedBox(
                                height: inputBoxHeith,
                                child: TextFormField(
                                  keyboardType: TextInputType.name,
                                  decoration:const InputDecoration(
                                      labelText: "Name",
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.account_circle)),
                                ),
                              ),
                              const  SizedBox(height: 30.0),
                              SizedBox(
                                height: inputBoxHeith,
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration:const  InputDecoration(
                                      labelText: "Email Address",
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.email)),
                                ),
                              ),
                              const  SizedBox(height: 30.0),
                              SizedBox(
                                height: inputBoxHeith,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration:const  InputDecoration(
                                      labelText: "Mobile No",
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.stay_current_portrait)),
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              SizedBox(
                                height: inputBoxHeith,
                                child: TextFormField(
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  decoration:const  InputDecoration(
                                      labelText: "Password (8+ characters)",
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.visibility)),
                                ),
                              ),
                              const  SizedBox(height: 30.0),
                              Flex(
                                direction: Axis.horizontal,
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: keepSignIn,
                                    onChanged: (value) {
                                      print("$value");
                                      setState(() {
                                        keepSignIn = !keepSignIn;
                                      });
                                    },
                                  ),
                                  // Flexible(
                                  //     child: Text(
                                  //         "I agree to the Terms of Service and Privacy Policy")),

                                          Flexible(
                                            child: RichText(
                                                text: TextSpan(
                                                  style: TextStyle(color: textColor, ),
                                                  children: <TextSpan>[
                                                    const  TextSpan(text: 'I agree to the  '),
                                                    TextSpan(
                                                        text: 'Terms of Service ',
                                                        style: TextStyle(color: textColor, fontWeight: FontWeight.w700, decoration: TextDecoration.underline),
                                                        recognizer: TapGestureRecognizer()
                                                          ..onTap = () {
                                                            print('Terms of Service"');
                                                          }),
                                                    const  TextSpan(text: ' and '),
                                                    TextSpan(
                                                        text: 'Privacy Policy',
                                                        style: TextStyle(color: textColor,fontWeight: FontWeight.w700, decoration: TextDecoration.underline),
                                                        recognizer: TapGestureRecognizer()
                                                          ..onTap = () {
                                                            print('Privacy Policy"');
                                                          }),
                                                  ],
                                                ),
                                              ),
                                          ),
                                ],
                              ),
                              const SizedBox(height: 30.0),
                              MaterialButton(
                                onPressed: () {
                                  Map d = Map();
                        
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PrivacyCheck()));
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutYourSelf()));
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(btnRadious1)),
                                padding: const EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      gradient: btnGradient,
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 300.0, minHeight: 40.0),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "Create an Account",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const  SizedBox(height: 30.0),
                              Row(children: const <Widget>[
                                Expanded(
                                  child: Divider(
                                    thickness: 1.0,
                                    color: Color(0xFF5F6368),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Text(
                                    "or Sign In using",
                                    style: TextStyle(color: Color(0xFF9FA2B4)),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 1.0,
                                    color: Color(0xFF5F6368),
                                  ),
                                ),
                              ]),
                              const  SizedBox(height: 30.0),
                              Social(),
                              const  SizedBox(height: 30.0),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: SizedBox(
                                  child: Flex(
                                    direction: Axis.horizontal,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const   Text(
                                        "Already a member? ",
                                        style: TextStyle(color: Color(0xFF374151)),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) => SingIn()));
                                          // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>const MyHomePage(title: appname)), (route) => false);
                                        },
                                        child: Text(
                                          "Sign in",
                                          style: TextStyle(
                                              color: primaryColor,
                                              decoration: TextDecoration.underline),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const   SizedBox(height: 30.0),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              xs: 12,
              sm: 12,
              md: 6,
              lg: 6,
              xl: 6,
              xxl: 6,
              xxxl: 6,
              xsLand: 12,
              smLand: 12,
              mdLand: 6,
              lgLand: 6,
              xlLand: 6,
              xxlLand: 6,
              xxxlLand: 6,
            ),
          ],
        ),
      ),
    );
  }

  void uploadResume() {

    AwesomeDialog(
        context: context,
        width: (a <= 2)
            ? screenWidth * 0.8
            : 600.0,
        animType: AnimType.LEFTSLIDE,
        headerAnimationLoop: false,
        dialogType: DialogType.NO_HEADER,
        // title: 'Succes',
      padding:const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        body: Column(
          children: [
            Image.asset(
              "assets/images/sin/upimg.png",
              // width: 100.0.sp,
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: 150.0,
              height: 20.0,
              child: LiquidLinearProgressIndicator(
                backgroundColor: const Color(0xFFE0E0E0),
                valueColor: const AlwaysStoppedAnimation(pbtnColor2),
                borderColor: const Color(0xFF9B9B9B),
                borderWidth: 1.0,
                borderRadius: 10.0,
                center: const Icon(
                  Icons.upload_file,
                  color: Colors.grey,
                  size: 18,
                ),
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   height: 35,
            //   padding: EdgeInsets.symmetric(horizontal: 24.0),
            //   child: LiquidLinearProgressIndicator(
            //     backgroundColor: const Color(0xFFE0E0E0),
            //     valueColor: AlwaysStoppedAnimation(pbtnColor2),
            //     direction: Axis.horizontal,
            //   ),
            // ),
            SizedBox(
              height: 120.0,
              child: Container(
                color:const  Color(0xFFF9F9FB),

                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    color: isHighlighted ? Colors.amber.shade100 : Colors.transparent,
                    child: DottedBorder(
                      dashPattern: const [6],
                      borderType: BorderType.Rect,
                      color: Colors.black38,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GestureDetector(
                          onTap: () async {
                            final events = await dropController.pickFiles();
                            if (events.isEmpty) return;
                            onDrop(events.first);
                          },
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              DropzoneView(
                                operation: DragOperation.copy,
                                cursor: CursorType.grab,
                                onCreated: (ctrl) => dropController = ctrl,
                                // onCreated: (DropzoneViewController ctrl) => controller = ctrl,
                                // onLoaded: () => print('Zone loaded'),
                                onError: (String? ev) => print('Error: $ev'),
                                // onHover: () => print('Zone hovered'),
                                onDrop: onDrop,
                                onHover: () {
                                  setState(() {
                                    isHighlighted = true;
                                  });
                                },
                                onLeave: () {
                                  setState(() {
                                    isHighlighted = false;
                                  });
                                },
                                // onLeave: () => print('Zone left'),
                              ),
                              SizedBox(
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  direction: Axis.horizontal,
                                  crossAxisAlignment:
                                  WrapCrossAlignment.center,
                                  children: [
                                    const Icon(Icons.upload),
                                    Text(selectedfile),
                                  ],
                                ),
                              ),
                              // Flex(direction: Axis.horizontal, children: [
                              //   Flexible(
                              //     flex: 1,
                              //     child: Text(

                              //         'Click to browse or drag and drop your files', textAlign: TextAlign.center,),
                              //   )
                              // ]
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            const Text(
              "Attach file in Pdf, doc & jpeg. these are format will be upported.",
              style: TextStyle(
                color: pbtnColor2,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            const  Text(
              " File size of your documents should not exceed 10MB",
              style: TextStyle(
                color: pbtnColor2,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            MaterialButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutYourSelf()));

              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(btnRadious1)),
              padding:const  EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: btnGradient,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                  constraints:const  BoxConstraints(
                      maxWidth: 300.0, minHeight: 40.0),
                  alignment: Alignment.center,
                  child:const  Text(
                    "Submit",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Do you need help?",
                  style: TextStyle(
                      color: Color(0xFF9B9B9B), fontSize: 14.0),
                ))
          ],
        ),
        ).show();
  }

  Future<void> onDrop(dynamic event) async {
    final name = event.name;
    final mime = await dropController.getFileMIME(event);
    final bytes = await dropController.getFileSize(event);
    final url = await dropController.createFileUrl(event);
    print("name: $name");
    print("mime: $mime");
    print("byte: $bytes");
    print("url: $url");

    final droppedFile =
    DroppedFile(url: url, name: name, mime: mime, bytes: bytes);
    print(droppedFile);
    selectedfile = "$name  -  ${droppedFile.size}";
    // widget.onDroppedFile(droppedFile);
    // DroppedFile()
    // setState(() {
    //   isHighlighted = false;
    // });
    setState(() {
      isHighlighted = false;
    });
  }
}
