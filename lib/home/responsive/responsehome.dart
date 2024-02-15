


import 'package:flutter/material.dart';
import 'package:jobhunt/utils/constantss.dart';

import 'a.dart';
import 'b.dart';
import 'c.dart';

class Home1 extends StatefulWidget {
  Home1({Key? key}) : super(key: key);
  String title = appname;
  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
    
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
    appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("Testing..."),


              Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).pushNamed('/flexiwidget');
                Navigator.of(context).push( MaterialPageRoute(builder: (context)=> FlexibleRowDemo()));
              },
              child: Text('Flexi Widget Demo'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).pushNamed('/gallery');
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResponsiveGallery()));
              },
              child: Text('Image Galery Demo'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).pushNamed('/gridview');
                Navigator.of(context).push( MaterialPageRoute(builder: (context)=>const ResponsiveGridview()));
              },
              child: Text('GridView Demo'),
            ),
          ],
        ),




          ],
        ),
 ),





    );
  }
}
