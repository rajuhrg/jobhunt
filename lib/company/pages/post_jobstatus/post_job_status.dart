import 'dart:convert';

import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';
import 'package:jobhunt/pages/profile/model/request_server.dart';
import 'package:jobhunt/utils/colors.dart';
import 'package:responsive/logic.dart';
import 'package:sizer/sizer.dart';

class PostJobStatus extends StatefulWidget {
  const PostJobStatus({Key? key}) : super(key: key);

  @override
  _PostJobStatusState createState() => _PostJobStatusState();
}

class _PostJobStatusState extends State<PostJobStatus> {
   Future<List>? postData;
  late ScrollController _scrollController;

  var a;
  @override
  void initState() {
    // postData =[];//

    Future.value([]);
    _scrollController =  ScrollController();
    getPostStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
    double screenWidth = mediaquerySize.width;
    double screenHeight = mediaquerySize.height;
     a = Responsive.gridSize(screenWidth);
    return Scaffold(
      body: Container(
        color: homebgColor,
        child: Column(
            children: [
              Expanded(
                child: FutureBuilder<List>(
                    future: postData,
                    builder: (context, snapShot) {
                      if (snapShot.hasError) {
                        return const Center(
                          child: Text("No data getting..."),
                        );
                      }
                      if (snapShot.data == null) {
                        return callAnima();
                      }
                      return (snapShot.hasData) ?
                      ListView.builder(
                          controller: _scrollController,
                          itemCount: snapShot.data!.length,
                          itemBuilder: (BuildContext context, int i) {
                        return buildRow(snapShot.data![i]);
                      }) : const Center(child: CircularProgressIndicator());
                    }
                ),
              ),
            ],
        ),
      ),
    );
  }

  Future<void> getPostStatus() async {
    var response = await HttpRequests().requests(
        {}, "/company/postedjobs.php", 5, 3);
    try{
      Map respD = jsonDecode(response);
      postData = Future.value(respD["data"]);
      setState(() {
        debugPrint("response print $postData");
      });
    }catch(e){
      debugPrint(e.toString());
    }
    // debugPrint(response);
  }

  Widget callAnima() {
    return const Center(child: Text("Not Found. Try Again"));
    // AnimatedBackground(
    //   behaviour: RandomParticleBehaviour(),
    //   vsync: this,
    //   child: Text('Hello'),
    // );
  }

  Widget buildRow(data) {
    print(data);
    Map<String, dynamic> job = data["job"];
    String jobId = job["jobid"];
    String date = job["date"];
    Map<String, dynamic> jobData = data["data"];
    String jobName = jobData["jobName"];
    String work = jobData['work'];
    String exp = jobData['exp'];
    List loc = jobData['loc'];
    return ListTile(
      title: BsCol(
        sizes:const ColScreen(
          xs: Col.col_12,
          sm: Col.col_11,
          md: Col.col_4,
        ),
        child: BsCard(

          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    RichText(
                      text: TextSpan(
                        text: 'Job ID',
                        style:const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: primaryColor2),
                        children: <TextSpan>[
                          TextSpan(
                            text: jobId,
                            style: TextStyle(
                              color: textColor2,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(date, style: TextStyle(
                            color: iconColor, fontSize: 12),),
                        IconButton(onPressed: () {

                        }, icon: Icon(
                          Icons.more_vert, color: iconColor,))
                      ],
                    )
                  ],
                ),
                Text("$jobName", style: TextStyle(color: textColor, fontSize: (a<3)?15.0.sp: 30),),


              ],
            ),
          ],
        ),
      ),
    );
  }
}
