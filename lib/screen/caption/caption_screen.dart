import 'package:festival_app/modal/caption_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaptionScreen extends StatefulWidget {
  const CaptionScreen({super.key});

  @override
  State<CaptionScreen> createState() => _CaptionScreenState();
}

class _CaptionScreenState extends State<CaptionScreen> {
  List <CaptionModel> l1 = [];

  @override

  Widget build(BuildContext context) {
    l1=ModalRoute.of(context)!.settings.arguments as List<CaptionModel>;
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishes"),
      ),
      body: ListView.builder(itemCount: l1.length,
        itemBuilder:(context,index ){
          return quotes(index);
        },),
    );
  }
  Widget quotes(int index)
  {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "edit",arguments: l1[index]);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 150,
        decoration: BoxDecoration(
            color:Colors.pink.withOpacity(0.3),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Padding(padding: EdgeInsets.all(10)),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.center,
                child: Text("${l1[index].caption}",
                  maxLines: 3,
                  style: const TextStyle(fontFamily: 'Lugra',
                    overflow: TextOverflow.ellipsis,
                    fontSize: 15,fontWeight: FontWeight.bold,
                  ),),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(right:12),
            //   child: Align(alignment: Alignment.bottomRight,
            //       child: Text("${l1[index].name}",
            //         style: TextStyle(fontFamily: 'Lugra',fontSize: 15),)),
            // ),
          ],
        ),
      ),
    );
  }
}
//Colors.pink.withOpacity(0.3),
