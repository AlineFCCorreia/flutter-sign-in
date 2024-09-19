import 'package:flutter/material.dart';

class BuildIconItem extends StatefulWidget {
  const BuildIconItem({super.key});

  @override
  State<BuildIconItem> createState() => _BuildIconItemState();
}


 

class _BuildIconItemState extends State<BuildIconItem> {

  
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        //ImageIcon(AssetImage("assets/pikachu.gif"), size: 35),
        SizedBox(
          height: 6,
        ),
        Text("ola"),
        SizedBox(
          height: 6,
        ),
        Visibility(
          child: Text("olaa"),
         // visible: ,
        ),
      ],
    );
  }
}
