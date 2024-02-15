import 'package:flutter/material.dart';

late TabController _controller;
const activeColor = Colors.red;
const InactiveColor = Colors.grey;

enum Buttons {
  Fix,
  Custom,
}

const ktextHeadlineStyle =
TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red);
const ktextSubHeadlineStyle =
TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red);
const kTapTextStyle = TextStyle(color: Colors.white, fontSize: 20);
const kButtonTextStyle =
TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold);

class SubCategoryScreen extends StatefulWidget {
  @override
  _SubCategoryScreenState createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen>
    with SingleTickerProviderStateMixin {
  PageController pageController = PageController();

  //TabController _controller=TabController(length: length, vsync: vsync);


  Color fixedJobColor = activeColor;
  Color customJobColor = InactiveColor;

  late Buttons selectedColor;// = Colors.blue;

  @override
  void initState() {
    selectedColor = Buttons.Custom;
    super.initState();
    pageController = PageController(initialPage: 0);
    _controller =  TabController(length: 3, vsync: this);
  }

  dispose() {
    pageController.dispose();
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(33),
                          bottomRight: Radius.circular(33)),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://st.depositphotos.com/1000291/3041/i/950/depositphotos_30414567-stock-photo-adult-electrician-engineer-worker.jpg'),
                          fit: BoxFit.fill)),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: new InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.search),
                            focusedBorder: OutlineInputBorder(
                              //  borderRadius: BorderRadius.circular(33),
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 1),
                            ),
                            hintText: 'Search in categories',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                    SizedBox(
                      width: 80,
                    ),
                    Text(
                      "Electrician",
                      style: ktextHeadlineStyle.copyWith(color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                splashColor: Colors.red,
                onPressed: () {
                  setState(() {
                    selectedColor = Buttons.Fix;
                  });
                  pageController.animateToPage(0,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeOutSine);
                },
                child: Text('Fixed Jobs', style: kButtonTextStyle),
                color: selectedColor == Buttons.Fix
                    ? activeColor
                    : InactiveColor,
              ),
              MaterialButton(
                splashColor: Colors.red,
                onPressed: () {
                  setState(() {
                    selectedColor = Buttons.Custom;
                  });
                  pageController.animateToPage(1,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeOutSine);
                },
                child: Text('Custom Jobs', style: kButtonTextStyle),
                color: selectedColor == Buttons.Custom
                    ? activeColor
                    : InactiveColor,
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .4,
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {},
                  children: [
                    FixedJobs(),
                    CustomJobs(),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

BoxDecoration kBoxDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  );
}

class FixedJobs extends StatefulWidget {
  @override
  _FixedJobsState createState() => _FixedJobsState();
}

class _FixedJobsState extends State<FixedJobs> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            decoration: kBoxDecoration(),
            child: MaterialButton(
              splashColor: Colors.red,
              onPressed: () {
                // pageController.animateToPage(0,
                //     duration: Duration(seconds: 1),
                //     curve: Curves.easeOutSine);
              },
              child: TabBar(
                controller: _controller,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.yellow,
                indicatorWeight: 10.0,
                indicator: BoxDecoration(color: Colors.red),
                tabs: [
                  Text('Taps', style: kButtonTextStyle.copyWith(color: Colors.red)),
                  Text('Taps', style: kButtonTextStyle.copyWith(color: Colors.red)),
                  Text('Taps', style: kButtonTextStyle.copyWith(color: Colors.red)),
                ],
              ),
              // child: Text('Taps',
              //     style: kButtonTextStyle.copyWith(color: Colors.red)),
              // color: Colors.yellow,
            ),
          ),
          Container(
            height: 300,
            child: TabBarView(
              controller: _controller,
              children:[
                new Container(
                  color: Colors.yellow,
                ),
                new Container(
                  color: Colors.orange,
                ),
                new Container(
                  color: Colors.lightGreen,
                ),

              ]
              ,
            )
            ,
          )
          ,
          // Column(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.symmetric(vertical: 10),
          //       child: Container(
          //         color: Color(0XFF252C41),
          //         child: TabBar(
          //           isScrollable: true,
          //           // indicatorSize: TabBarIndicatorSize.label,
          //           indicatorColor: Colors.yellow,
          //           indicatorWeight: 10.0,
          //           indicator: BoxDecoration(color: Colors.red),
          //           controller: _controller,
          //           tabs: [
          //             new Tab(child: Text("Bio", style: kTapTextStyle)),
          //             new Tab(
          //               child: Text("Training Location",
          //                   style: kTapTextStyle),
          //             ),
          //             new Tab(
          //                 child: Text("Reviews", style: kTapTextStyle)),
          //             new Tab(
          //                 child: Text("Reviewed", style: kTapTextStyle)),
          //           ],
          //         ),
          //       ),
          //     ),
          //     Container(
          //       height: MediaQuery.of(context).size.height + 300,
          //       width: MediaQuery.of(context).size.width,
          //       child: TabBarView(
          //         controller: _controller,
          //         children: [
          //           new Card(
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     "James White",
          //                     style: ktextHeadlineStyle,
          //                   ),
          //                   Padding(
          //                     padding:
          //                     const EdgeInsets.symmetric(vertical: 20),
          //                     child: Text(
          //                       "Football",
          //                       style: ktextHeadlineStyle,
          //                     ),
          //                   ),
          //                   Text(
          //                     "When developing an application, I had the need for a TabBar with buttons as Tabs. After searching around, I didn’t find anything; the default TabBar widget didn’t have that option, therefore, I decided to make it myself.",
          //                     style: ktextSubHeadlineStyle,
          //                   ),
          //                   SizedBox(
          //                     height: 80,
          //                   ),
          //                   // Center(
          //                   //     child: EditBottons(
          //                   //       onPressed: () {},
          //                   //     )),
          //                 ],
          //               )),
          //           new Card(
          //               child: Padding(
          //                 padding: const EdgeInsets.symmetric(horizontal: 15),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Padding(
          //                       padding:
          //                       const EdgeInsets.symmetric(vertical: 10),
          //                       child: Text("Enter Your Name"),
          //                     ),
          //                     SizedBox(
          //                       height: 30,
          //                       child: TextField(
          //                         decoration: InputDecoration(
          //                             filled: true,
          //                             fillColor: Color(0XFFE0E0E0),
          //                             border: OutlineInputBorder(
          //                               borderRadius:
          //                               BorderRadius.circular(33),
          //                             )),
          //                       ),
          //                     ),
          //                     //SizedBox(height: 20,),
          //                     // Row(
          //                     //   children: [
          //                     //     TextFieldBottumLine(
          //                     //       onChanged: null,
          //                     //       name: "Street Address",
          //                     //     ),
          //                     //     TextFieldBottumLine(
          //                     //       onChanged: null,
          //                     //       name: "City",
          //                     //     ),
          //                     //     TextFieldBottumLine(
          //                     //       onChanged: null,
          //                     //       name: "State",
          //                     //     ),
          //                     //   ],
          //                     // ),
          //                     // Row(
          //                     //   children: [
          //                     //     TextFieldBottumLine(
          //                     //       onChanged: null,
          //                     //       name: "Zip Code",
          //                     //     ),
          //                     //     TextFieldBottumLine(
          //                     //       onChanged: null,
          //                     //       name: "City",
          //                     //     ),
          //                     //   ],
          //                     // ),
          //                     SizedBox(
          //                       height: 30,
          //                     ),
          //                     Padding(
          //                       padding: const EdgeInsets.only(left: 240),
          //                       child: Container(
          //                         decoration: BoxDecoration(
          //                           color: Colors.red,
          //                           borderRadius: BorderRadius.circular(22),
          //                         ),
          //                         height: 40,
          //                         width: 100,
          //                         child: MaterialButton(
          //                           onPressed: () {},
          //                           child: Text(
          //                             "Save",
          //                             style: ktextSubHeadlineStyle.copyWith(
          //                                 color: Colors.white),
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: 20,
          //                     ),
          //                     Text(
          //                       'Location',
          //                       style: ktextSubHeadlineStyle,
          //                     ),
          //                     SizedBox(
          //                       height: 20,
          //                     ),
          //                     RaisedButton(
          //                       shape: RoundedRectangleBorder(
          //                           borderRadius: BorderRadius.circular(18.0),
          //                           side: BorderSide.none),
          //                       onPressed: () {},
          //                       color: Colors.grey,
          //                       elevation: 20,
          //                       textColor: Colors.white,
          //                       child: Row(
          //                         mainAxisAlignment:
          //                         MainAxisAlignment.spaceBetween,
          //                         children: <Widget>[
          //                           Icon(Icons.location_on),
          //                           Text(
          //                             'New York NY United States',
          //                             style: ktextSubHeadlineStyle.copyWith(
          //                                 color: Colors.black),
          //                           ),
          //                           Icon(Icons.delete)
          //                         ],
          //                       ),
          //                     ),
          //                     RaisedButton(
          //                       shape: RoundedRectangleBorder(
          //                           borderRadius: BorderRadius.circular(18.0),
          //                           side: BorderSide.none),
          //                       onPressed: () {},
          //                       color: Colors.grey,
          //                       elevation: 20,
          //                       textColor: Colors.white,
          //                       child: Row(
          //                         mainAxisAlignment:
          //                         MainAxisAlignment.spaceBetween,
          //                         children: <Widget>[
          //                           Icon(Icons.location_on),
          //                           Text(
          //                             'New York NY United States',
          //                             style: ktextSubHeadlineStyle.copyWith(
          //                                 color: Colors.black),
          //                           ),
          //                           Icon(Icons.delete)
          //                         ],
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: 50,
          //                     ),
          //                     // Center(
          //                     //     child: EditBottons(
          //                     //       onPressed: () {},
          //                     //     ))
          //                   ],
          //                 ),
          //               )),
          //           new Card(
          //             child: ListView(children: [
          //               ListTile(
          //                 leading: Container(
          //                   height: 50,
          //                   width: 50,
          //                   decoration: BoxDecoration(
          //                       image: DecorationImage(
          //                           image: AssetImage('assets/pic.jpg'),
          //                           fit: BoxFit.fill)),
          //                 ),
          //                 title: Text("Jane Pin"),
          //                 subtitle: Text(
          //                     'ajfideifheihafdifdf difidhafa dfd af d faf difidhafdhf d f hfiahfdhif  '),
          //               ),
          //               ListTile(
          //                 leading: Container(
          //                   height: 50,
          //                   width: 50,
          //                   decoration: BoxDecoration(
          //                       image: DecorationImage(
          //                           image: AssetImage('assets/pic.jpg'),
          //                           fit: BoxFit.fill)),
          //                 ),
          //                 title: Text("Jane Pin"),
          //                 subtitle: Text(
          //                     'ajfideifheihafdifdf difidhafa dfd af d faf difidhafdhf d f hfiahfdhif  '),
          //               ),
          //               ListTile(
          //                 leading: Container(
          //                   height: 50,
          //                   width: 50,
          //                   decoration: BoxDecoration(
          //                       image: DecorationImage(
          //                           image: AssetImage('assets/pic.jpg'),
          //                           fit: BoxFit.fill)),
          //                 ),
          //




        ],
      ),
    );
  }
}

class CustomJobs extends StatefulWidget {
  @override
  _CustomJobsState createState() => _CustomJobsState();
}

class _CustomJobsState extends State<CustomJobs> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: kBoxDecoration(),
        child: Column(
          children: [
            Expanded(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Icon(
                        Icons.account_circle,
                        size: 40,
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                          "Please describe the work thatyou need. Our professionalwill contact you"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                  child: Material(
                    // elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10),
                      child: SizedBox(
                        width: 350.0,
                        height: 100.0,
                        child: TextField(
                          //   controller: notification,
                          style: TextStyle(fontSize: 20.0),
                          maxLines: 10,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2)),
                            hintText: 'Enter Your Text',
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}