
import 'package:flutter/material.dart';
import 'package:jobhunt/dropzone/model/dropped_file.dart';

class DroppedFileWidget extends StatelessWidget {
  final DroppedFile? file;
  const DroppedFileWidget({Key? key, required this.file}) : super(key: key);

  @override
    Widget build(BuildContext context) => buildImage();

Widget buildImage() {
  if(file == null) return buildEmptyFile('No File');

return Column(
  children: [
        Image.network(file!.url,
    
    errorBuilder: (context, error , _) => buildEmptyFile("No Preview")),
    // Text()
  ],
);
}

  Widget buildEmptyFile(String s) {
    return Center(child: Text(s, style: TextStyle(color: Colors.black54, fontSize: 15), textAlign: TextAlign.center,),);
  }
}