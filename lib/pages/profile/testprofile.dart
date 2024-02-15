import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

class TestProfile extends StatefulWidget {
  TestProfile({Key? key}) : super(key: key);

  @override
  State<TestProfile> createState() => _TestProfileState();
}

class _TestProfileState extends State<TestProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BootstrapContainer(
          fluid: true,
          decoration: BoxDecoration(color: Colors.blue),
          children: [
            BootstrapContainer(fluid: false, children: [
              Column(children: [
                Text("this text"),
                Divider(),
                BootstrapCol(
                  sizes: 'col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4',
                  offsets:
                      'offset-0 offset-sm-0 offset-md-1 offset-lg-1 offset-xl-2',
                  orders: 'order-3 order-sm-3 order-md-3 order-lg-3 order-xl-3',
                  child: Container(
                    color: Colors.amber.shade200,
                    child: Column(
                      children: [
                        Text("this Text 2"),
                        BootstrapContainer(
                          children: [
                            BootstrapCol(
                              sizes: 'col-6',
                              child: Container(
                              color: Colors.purple,
                              child: Column(
                                children:const <Widget>[
                                  Text("Testing 123"),
                                  Text("text 1234"),
                                ],
                              ),
                            ))
                          ]),
                       const ContentWidget(
                          text: 'test string this is',
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                  ),
                ),
              ])
            ]),
           const Divider(),
            BootstrapContainer(

              fluid: false,
              decoration:const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.only(top: 50),
              children: <Widget>[
                BootstrapRow(
                  height: 60,
                  children: <BootstrapCol>[
                    BootstrapCol(
                      sizes: 'col-6',
                      child: ContentWidget(
                        text: 'col 1 of 2',
                        color: Colors.red,
                      ),
                    ),
                    BootstrapCol(
                      sizes: 'col-6',
                      child: ContentWidget(
                        text: 'col 2 of 2',
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                BootstrapRow(
                  height: 60,
                  children: <BootstrapCol>[
                    BootstrapCol(
                      sizes: 'col-3',
                      child: ContentWidget(
                        text: 'col 1 of 3',
                        color: Colors.green,
                      ),
                    ),
                    BootstrapCol(
                      sizes: 'col-6',
                      child: const ContentWidget(
                        text: 'col 2 of 3 (wider)',
                        color: Colors.red,
                      ),
                    ),
                    BootstrapCol(
                      sizes: 'col-3',
                      child: ContentWidget(
                        text: 'col 3 of 3',
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Divider(),
                BootstrapRow(

                  height: 120,
                  children: <BootstrapCol>[
                    BootstrapCol(
                      sizes: 'col-12 col-md-8',
                      child: ContentWidget(
                        text: 'col-12 col-md-8',
                        color: Colors.yellow,
                      ),
                    ),
                    BootstrapCol(
                      sizes: 'col-6 col-md-4',
                      child: const ContentWidget(
                        text: 'col-6 col-md-4',
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                Divider(),
                BootstrapRow(

                  height: 120,
                  children: <BootstrapCol>[
                    BootstrapCol(
                      sizes: 'col-9',
                      child: ContentWidget(
                        text: 'col-9',
                        color: Colors.yellow,
                      ),
                    ),
                    BootstrapCol(
                      sizes: 'col-4',
                      child: ContentWidget(
                        text:
                            'col-4\nSince 9+4 = 13 & 13 > 2, this 4-columns gets wrapped onto a new line',
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                Divider(),
                BootstrapRow(
                  height: 60,

                  children: <BootstrapCol>[
                    BootstrapCol(
                      sizes: 'col-8 col-sm-10 col-md-8',
                      child: ContentWidget(
                        text: 'col-md-8',
                        color: Colors.red,
                      ),
                    ),
                    BootstrapCol(
                      sizes: 'col-md-4',
                      // offsets: 'offset-md-1',
                      child: ContentWidget(
                        text: 'col-md-4 offset-md-1',
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                BootstrapRow(
                  height: 60,
                  children: <BootstrapCol>[
                    BootstrapCol(
                      sizes: 'col-md-3',
                      offsets: 'offset-md-3',
                      child: ContentWidget(
                        text: 'col-md-3 offset-md-3',
                        color: Colors.yellow,
                      ),
                    ),
                    BootstrapCol(
                      sizes: 'col-md-3',
                      offsets: 'offset-md-3',
                      child: ContentWidget(
                        text: 'col-md-3 offset-md-3',
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
                BootstrapRow(
                  height: 60,
                  children: <BootstrapCol>[
                    BootstrapCol(
                      sizes: 'col-md-6',
                      offsets: 'offset-md-3',
                      child: ContentWidget(
                        text: 'col-md-6 offset-md-3',
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
                Divider(),
                BootstrapRow(
                  // height: 200,
                  children: <BootstrapCol>[
                    BootstrapCol(
                      sizes: 'col-12 col-md-8',
                      orders:
                          'order-2 order-sm-2 order-md-1 order-lg-1 order-xl-1',
                      child: ContentWidget(
                        text: 'col-12 col-md-8 order2(xs,sm)',
                        color: Colors.red,
                      ),
                    ),
                    BootstrapCol(
                      sizes: 'col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3',
                      orders:
                          'order-1 order-sm-1 order-md-2 order-lg-2 order-xl-2',
                      child: ContentWidget(
                        text: 'col 2 order1(xs,sm)',
                        color: Colors.green,
                      ),
                    ),
                    BootstrapCol(
                      sizes: 'col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3',
                      offsets:
                          'offset-0 offset-sm-0 offset-md-2 offset-lg-4 offset-xl-5',
                      orders:
                          'order-3 order-sm-3 order-md-3 order-lg-3 order-xl-3',
                      child: ContentWidget(
                        text: 'col 3',
                        color: Colors.yellow,
                      ),
                    ),
                    BootstrapCol(
                      sizes: 'col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3',
                      orders:
                          'order-4 order-sm-4 order-md-4 order-lg-4 order-xl-4',
                      invisibleForSizes: 'sm xl',
                      child: Column(
                        children: [
                          Text(
                            'invisible for sm and xl',
                          ),
                        ],
                        // text: 'invisible for sm and xl',
                        // color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [

                BsCard(children: [
                  BsCardContainer(title: Text("Grid container"),),
                  BsCardContainer(child: BsRow(
                      crossAxisAlignment: WrapCrossAlignment.center,
                    gutter: const EdgeInsets.all(10),
                    children: [
                      BsCol(
                        // decoration: BoxDecoration(
                        //   border: Border.all(color: Colors.red),
                        // ),
                        // visibility: BsVisibility.block,
                        padding: EdgeInsets.all(5.0),
                        sizes: ColScreen(xs: Col.col_12, sm: Col.col_11,  lg: Col.col_6),
                        child: Center(child: Text('col-sm-12 col-lg-6 col-hidden-md')),
                      ),

                      BsCol(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        // padding: EdgeInsets.all(20.0),
                        sizes: ColScreen(xs: Col.col_6, sm: Col.col_6, lg: Col.col_6),
                        child: Center(child: Text('col-sm-12 col-lg-6')),
                      ),



                    ],
                  ),),
                  SizedBox(height: 20,),
                ])
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      color: color,
      child: Text(text),
    );
  }
}
