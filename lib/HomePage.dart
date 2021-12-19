import 'package:IOT_UI/Widgets/RoomCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<RoomCard> cards = [];

  bool cardsLoaded = false;

  void loadCards(){
    cards.add(RoomCard(imageName: "bed", roomName: "Bed Room", lights: 4));
    cards.add(RoomCard(imageName: "room", roomName: "Living Room", lights: 2));
    cards.add(RoomCard(imageName: "kitchen", roomName: "Kitchen", lights: 5));
    cards.add(RoomCard(imageName: "bathtube", roomName: "Bathroom", lights: 1));
    cards.add(RoomCard(imageName: "house", roomName: "Outdoor", lights: 5));
    cards.add(RoomCard(imageName: "balcony", roomName: "Balcony", lights: 2));
    setState(() {
      cardsLoaded = true;
    });
  }

  void initState(){
    super.initState();
    loadCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFA2E42B3),
        body: cardsLoaded?Stack(
          children: [Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Control\nPanel',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white,width: 3.5),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100),
                            image:  DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/user_image.jpg')
                            ),
                          ),
                          //child: Image.file(File(widget.image_path),fit: BoxFit.fill,),
                        ),
                      ),

                  ),
                ],
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,

                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40), bottom: Radius.zero),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30,30,0,0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'All Rooms',
                              style: TextStyle(
                                  color: Color(0xFA2E42B3),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  MediaQuery.of(context).orientation ==
                                          Orientation.landscape
                                      ? 3
                                      : 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: (2 / 2),
                            ),
                            itemCount: 6,
                            itemBuilder: (context,index){
                              return cards[index];
                            }),
                      ),
                      BottomBar(),
                    ],
                  ),
                ),
              )
            ],
          ),

            //BottomBar(),


          ]
        ):CircularProgressIndicator()
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Align(
        alignment: Alignment.bottomCenter,

        child: Container(
          width: screenWidth,
          height: screenHeight * 0.08,
          decoration: BoxDecoration(
            color: Colors.white,
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset("assets/bulb.svg"),
              SvgPicture.asset("assets/Icon feather-home.svg"),
              SvgPicture.asset("assets/Icon feather-settings.svg"),
            ],
          ),

        ));
  }
}

