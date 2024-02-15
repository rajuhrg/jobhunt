import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:jobhunt/dropzone/model/dropped_file.dart';
import 'package:jobhunt/utils/colors.dart';

class DropZoneWidget extends StatefulWidget {
  // var onDroppedFile;

  final ValueChanged<DroppedFile> onDroppedFile; //(DroppedFile file);
  // void onDroppedFile(DroppedFile droppedFile) {}
  const DropZoneWidget({Key? key, required this.onDroppedFile}) : super(key: key);

  // const DropZoneWidget({Key? key}) : super(key: key);

  @override
  State<DropZoneWidget> createState() => _DropZoneWidgetState();
}

class _DropZoneWidgetState extends State<DropZoneWidget> {
  late DropzoneViewController dropController;
  bool isHighlighted = false;
  String dropText = 'Click to browse or drag and drop your files';

@override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isHighlighted ? Colors.amber.shade100 : Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: DottedBorder(
          dashPattern: const [6],
          color: Colors.black38,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () async {
                final events = await dropController.pickFiles();
                if (events.isEmpty) return;
                onDrop(events.first);
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: DropzoneView(
                      operation: DragOperation.copy,
                      cursor: CursorType.grab,
                      onCreated: (ctrl) => dropController = ctrl,
                      // gestureRecognizers: ,
                      // onLoaded: () =>
                      //     print('Zone loaded'),
                      onError: (String? ev) =>
                          print('Error: $ev'),
                   
                      onDrop:  onDrop,
                      onHover: () {
                        // setState(() {
                          isHighlighted = true;
                        // });
                      },
                      onLeave: () {
                        // setState(() {
                          isHighlighted = false;
                        // });
                      },
                    ),
                  ),
                  Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  [
                        Flexible(
                            child: Text(
                          dropText,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: forgotcolor1),
                        ))
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future onDrop(dynamic event) async {
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

    widget.onDroppedFile(droppedFile);
    // setState(() {
      dropText = "$name  -  Size ${droppedFile.size}";
      isHighlighted = false;
    // });
  }
}
