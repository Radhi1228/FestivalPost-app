import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:festival_app/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool forGrid = true;
  bool forColor = true;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Are You Sure Want To Exit..",
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    },
                      child: const Text("No",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),),
                    TextButton(onPressed: (){
                      exit(0);
                    },
                      child: const Text("Yes",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),)
                  ],
                ),
              ],
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.10),
          //centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Your Beautiful Festivals ",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          actions: [
            IconButton(onPressed: (){
              showDialog(context: context,
                builder: (context){
                  Random r1 = Random();
                  int i = r1.nextInt(Diwali.length);
                  return AlertDialog(
                    title: Text("${Diwali[i].caption}",
                      style: TextStyle(fontFamily: "Lugra",
                          color: Colors.pink.shade200,
                          fontWeight: FontWeight.bold),),
                  );},);
            }, icon: const Icon(Icons.leak_add),color: Colors.black,),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      forGrid=!forGrid;
                    });
                  }, child: const Text("Tap")),
            )
          ],
        ),
        body: forGrid
            ?ListView.builder(
          // forGrid = !forGrid;
          scrollDirection: Axis.vertical,
          itemCount: festivalModalList.length,
          itemBuilder: (context, index) => Tile(index),
        )
            : GridView.builder(
          itemCount: festivalModalList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index)
          {
            return Tile(index);
          },
        ),
      ),
    );
  }
  Widget Tile(int index) {
    return InkWell(
      onTap: (){
        List mainList = [Diwali,Navaratri,Holi,Dussera,Ganesha,Janamastami,MakarSankranti,MahaShivratri,Rakhi,RepublicDay];
        Navigator.pushNamed(context, 'caption',arguments: mainList [index]);
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(15),
          color: Colors.pink.shade100,
            image: DecorationImage(
                image: AssetImage("${festivalModalList[index].image}",),fit: BoxFit.cover)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              //margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5),
                  topLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Text(
                "${festivalModalList[index].fesName}",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
