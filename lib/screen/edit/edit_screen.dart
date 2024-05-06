import 'dart:io';
import 'dart:typed_data';

import 'package:festival_app/modal/caption_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  Color selectedColor = Colors.black;
  String selectedImage = "assets/images/img1.jpeg";
  String? selectFont ="anek";
  FontStyle italic = FontStyle.normal;
  FontWeight bold = FontWeight.normal;
  TextDecoration underline = TextDecoration.none;
  TextAlign alignment = TextAlign.center;
  Alignment forAlign = Alignment.center;
  GlobalKey repaintKey = GlobalKey();

  bool forImage = false;
  bool forColor = false;
  bool forFont = false;
  bool forField = false;

  List imageList = [
    "assets/images/img1.jpeg",
    "assets/images/img2.jpeg",
    "assets/images/img3.jpeg",
    "assets/images/img4.jpeg",
    "assets/images/img5.jpeg",
    "assets/images/img6.jpeg",
    "assets/images/img7.jpeg",
    "assets/images/img8.jpeg",
    "assets/images/img9.jpeg",
    "assets/images/img10.jpeg"
  ];

  List fontList = ['anek', 'Dancing', 'fontstyle', 'Oswald','lugra'];

  @override
  Widget build(BuildContext context) {
    CaptionModel  model =
    ModalRoute.of(context)!.settings.arguments as CaptionModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Screen"),
      ),
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RepaintBoundary(
              key: repaintKey,
              child: Container(
                height: MediaQuery.sizeOf(context).width * 0.90,
                width: MediaQuery.sizeOf(context).width * 0.90,
                color: Colors.amber,
                child: Stack(
                  alignment: forAlign,
                  children: [
                    Image.asset(
                      selectedImage,
                      fit: BoxFit.cover,
                      height: MediaQuery.sizeOf(context).width * 0.90,
                      width: MediaQuery.sizeOf(context).width * 0.90,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SelectableText(
                          "${model.caption}",
                          style: TextStyle(
                            color: selectedColor,
                            fontSize: 20,
                            fontFamily: selectFont,
                            fontStyle: italic,
                            fontWeight: bold,
                            decoration: underline,
                          ),
                          textAlign: alignment,
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(10),
                    //   child: Align(
                    //     alignment: Alignment.bottomRight,
                    //     child: SelectableText(
                    //       "${model.name}",
                    //       style: TextStyle(
                    //         color: selectedColor,
                    //         fontFamily: selectFont,
                    //         fontSize: 18,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Padding(padding: EdgeInsets.only(right: )),
                IconButton.filledTonal(
                  onPressed: () {
                    setState(() {
                      forField = !forField;
                      forFont = false;
                      forColor = false;
                      forImage = false;
                    });
                  },
                  icon: const Icon(Icons.text_fields),
                ),
                IconButton.filledTonal(
                  onPressed: () {
                    setState(() {
                      forImage = !forImage;
                      forColor = false;
                      forFont = false;
                      forField = false;
                    });
                  },
                  icon: Icon(Icons.image),
                ),
                IconButton.filledTonal(
                  onPressed: () {
                    setState(() {
                      forColor = !forColor;
                      forImage = false;
                      forFont = false;
                      forField = false;
                    });
                  },
                  icon: Icon(Icons.color_lens),
                ),
                IconButton.filledTonal(
                  onPressed: () {
                    setState(() {
                      forFont = !forFont;
                      forImage = false;
                      forColor = false;
                      forField = false;
                    });
                  },
                  icon: Icon(Icons.text_format),
                ),
                IconButton.filledTonal(
                  onPressed: () {
                    setState(() async{
                      String? path = await SaveImage();
                      // await Share.shareXFiles([XFile(path!)]);
                    });
                  },
                  icon: const Icon(Icons.share),
                ),
                IconButton.filledTonal(
                  onPressed: () async {
                    SaveImage();
                  },
                  icon: const Icon(Icons.save_alt),
                ),
              ],

            ),
            Visibility(
              visible: forColor,
              child: Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemCount: Colors.primaries.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        selectedColor = Colors.primaries[index];
                      });
                    },
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.all(10),
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.primaries[index],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: forImage,
              child: Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: imageList.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        selectedImage = imageList[index];
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      child:Image.asset(
                        "${imageList[index]}",
                        fit: BoxFit.cover,
                      ),
                      margin: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: forFont,
              child: Expanded(
                  child: ListView.builder(
                    itemCount: fontList.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          selectFont = fontList[index];
                        });
                      },
                      child: Container(
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30,top: 20),
                          child: Text(
                            "Edit Your Screen",
                            style: TextStyle(
                              fontFamily: fontList[index],
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
            Visibility(
              visible: forField,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton.filledTonal(
                        onPressed: () {
                          setState(() {
                            if (bold == FontWeight.normal) {
                              bold = FontWeight.bold;
                            } else {
                              bold = FontWeight.normal;
                            }
                          });
                        },
                        icon: Icon(Icons.format_bold),
                      ),
                      IconButton.filledTonal(
                        onPressed: () {
                          setState(() {
                            if(underline == TextDecoration.none)
                            {
                              underline = TextDecoration.underline;
                            }
                            else
                            {
                              underline = TextDecoration.none;
                            }
                          });
                        },
                        icon: Icon(Icons.format_underline),
                      ),
                      IconButton.filledTonal(
                          onPressed: () {
                            setState(
                                  () {
                                if(italic == FontStyle.normal)
                                {
                                  italic = FontStyle.italic;
                                }
                                else
                                {
                                  italic = FontStyle.normal;
                                }
                              },
                            );
                          },
                          icon: Icon(Icons.format_italic))
                    ],
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton.filledTonal(
                        onPressed: () {
                          setState(() {
                            alignment = TextAlign.left;
                          });
                        },
                        icon: Icon(Icons.format_align_left),
                      ),
                      IconButton.filledTonal(
                        onPressed: () {
                          setState(() {
                            alignment = TextAlign.center;
                          });
                        },
                        icon: Icon(Icons.format_align_center_outlined),
                      ),
                      IconButton.filledTonal(
                        onPressed: () {
                          setState(() {
                            alignment = TextAlign.right;
                          });
                        },
                        icon: Icon(Icons.format_align_right),
                      ),
                    ],
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
  Future<String?> SaveImage() async
  {
    RenderRepaintBoundary boundary = repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    var bytes = byteData!.buffer.asUint8List();
    String name = "${DateTime.now().hour},${DateTime.now().minute},${DateTime.now().second},${DateTime.now().day},${DateTime.now().month},${DateTime.now().year}";
    if(Platform.isAndroid)
    {
      await File("storage/emulated/0/Download/$name.png").writeAsBytes(bytes);
      return "storage/emulated/0/Download/$name.png";
    }
    else
    {
      Directory? dir = await getDownloadsDirectory();

      await File("${dir!.path}/$name.png");
      return "${dir!.path}/$name.png";
    }
  }
}
