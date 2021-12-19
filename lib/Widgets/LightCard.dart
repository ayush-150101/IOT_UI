import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LightCard extends StatelessWidget {
  String imageName;
  String title;
  bool isSelected;
  LightCard({Key key,@required this.imageName,@required this.title,@required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    print("SIZE : $screenHeight");
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,0,10,0),
      child: Container(
        /*width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.height * 0.035,*/

        width: 120>MediaQuery.of(context).size.width * 0.35?120:MediaQuery.of(context).size.width * 0.35,
        height: 150,

        decoration: BoxDecoration(
          color: !isSelected?Colors.white:Color(0xFA151F5F),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(2,0,2,0),
              child: SvgPicture.asset("assets/$imageName.svg"),
            ),
            /*FittedBox(
                fit: BoxFit.fitWidth,
                child: Text('$title',style: TextStyle(color: !isSelected?Color(0xFA151F5F):Colors.white,fontWeight: FontWeight.bold,fontSize: 20),))*/
            Padding(
              padding: const EdgeInsets.fromLTRB(2,0,0,0),
              child: Text('$title',style: TextStyle(color: !isSelected?Color(0xFA151F5F):Colors.white,fontWeight: FontWeight.bold,fontSize: screenHeight/41),),
            )
          ],
        ),
      ),
    );
  }
}

