


import 'package:flutter/material.dart';
// import 'package:responsive/flex_widget.dart';
import 'package:responsive/responsive.dart';
// import 'package:responsive/responsive_row.dart';

class ResponsiveGridview extends StatelessWidget {
  const ResponsiveGridview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Grid View'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            child: GridView.builder(
              itemCount: 30,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  height: 120,
                  color: Colors.green,
                  child: Card(
                    child:  Image.network(
                      'https://picsum.photos/id/$index/200/200',
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.calcColumns(
                  context: context,
                  columns: FlexColumns(
                    xs: 1,
                    sm: 4,
                    md: 4,
                    lg: 6,
                    xxl: 8,
                  ),
                )!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}