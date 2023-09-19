import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isro_mission/screens/listscreen.dart';
import 'package:launch_review/launch_review.dart';
import 'package:page_transition/page_transition.dart';

import '../utils/arc.dart';
import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Icon(
      Icons.home,
      size: 150,
    ),
    Icon(
      Icons.favorite_border,
      size: 150,
    ),
    Icon(
      Icons.person,
      size: 150,
    ),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ISRO Space Mission",style: TextStyle(fontSize: 24.0,),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: new Icon(Icons.star_rate, color: Colors.orange),
            onPressed: ()   {
              LaunchReview.launch(
                androidAppId: androidAppIdValue,
                iOSAppId: iOSAppIdValue,);

            })

    ],

  ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  GestureDetector(
                  onTap : () {
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: ListScreen(listIndex : 1)));

            },
                    child: Container(
                      height: 180,
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.blueAccent.shade400,
                        child: Padding(
                          padding: const EdgeInsets.only(right:8.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                     Text('Spacecraft \nMissions',
                                        style: GoogleFonts.nunito(textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 0.5,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,)
                                        )),

                                    ElevatedButton(
                                      //on pressed
                                      onPressed: () async {
                                      },
                                      child:  Text('125',
                                          style: GoogleFonts.nunito(textStyle: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 0.5,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,)
                                          )),
                                      //style section code here
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all<double>(0),
                                        shape:
                                        MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12.0),
                                            )),
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black54
                                        ),
                                      ),
                                    ),


                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Image.asset(
                      'assets/images/spacecraft.png',
                      fit: BoxFit.cover,
                      height: 180,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 180,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  GestureDetector(
                    onTap : () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: ListScreen(listIndex : 2)));

                    },
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.pink.shade400,
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Launch \nMissions',
                                        style: GoogleFonts.nunito(textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 0.5,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,)
                                        )),
                                    ElevatedButton(
                                      //on pressed
                                      onPressed: () async {},
                                      child: Text('94',
                                          style: GoogleFonts.nunito(textStyle: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 0.5,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,)
                                          )),
                                      //style section code here
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all<double>(0),
                                        shape:
                                        MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12.0),
                                            )),
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black54),
                                      ),
                                    ),


                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 0,
                    child: Image.asset(
                      'assets/images/rocket.png',
                      fit: BoxFit.cover,
                      height: 180,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 180,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  GestureDetector(
                    onTap : () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: ListScreen(listIndex : 3)));

                    },
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.deepPurple.shade400,
                        child: Padding(
                          padding: const EdgeInsets.only(right:8.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Student \nSatellites',
                                        style: GoogleFonts.nunito(textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 0.5,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,)
                                        )),
                                    ElevatedButton(
                                      //on pressed
                                      onPressed: () async {},
                                      child: Text('15',
                                          style: GoogleFonts.nunito(textStyle: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 0.5,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,)
                                          )),
                                      //style section code here
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all<double>(0),
                                        shape:
                                        MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12.0),
                                            )),
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black54),
                                      ),
                                    ),


                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/satellite.png',
                        fit: BoxFit.cover,
                        height: 160,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 180,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  GestureDetector(
                    onTap : () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: ListScreen(listIndex : 4)));

                    },
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.teal.shade400,
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Re-entry \nMissions',
                                        style: GoogleFonts.nunito(textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 0.5,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,)
                                        )),
                                    ElevatedButton(
                                      //on pressed
                                      onPressed: () async {},
                                      child: Text('2',
                                          style: GoogleFonts.nunito(textStyle: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 0.5,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,)
                                          )),
                                      //style section code here
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all<double>(0),
                                        shape:
                                        MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12.0),
                                            )),
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black54),
                                      ),
                                    ),


                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 0,
                    child: Image.asset(
                      'assets/images/reentry.png',
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 180,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  GestureDetector(
                    onTap : () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: ListScreen(listIndex : 5)));

                    },
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.red.shade400,
                        child: Padding(
                          padding: const EdgeInsets.only(right:8.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Foreign \nSatellites',
                                        style: GoogleFonts.nunito(textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 0.5,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,)
                                        )),
                                    ElevatedButton(
                                      //on pressed
                                      onPressed: () async {},
                                      child: Text('431',
                                          style: GoogleFonts.nunito(textStyle: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 0.5,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,)
                                          )),
                                      //style section code here
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all<double>(0),
                                        shape:
                                        MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12.0),
                                            )),
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black54),
                                      ),
                                    ),


                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 0,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/gps.png',
                        fit: BoxFit.cover,
                        height: 180,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 220,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  GestureDetector(
                    onTap : () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: ListScreen(listIndex : 6)));

                    },
                    child: Container(
                      height: 240,
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.green.shade400,
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Indian \nPrivate player \nSatellites',
                                        style: GoogleFonts.nunito(textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 0.5,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,)
                                        )),
                                    ElevatedButton(
                                      //on pressed
                                      onPressed: () async {},
                                      child: Text('3',
                                          style: GoogleFonts.nunito(textStyle: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 0.5,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,)
                                          )),
                                      //style section code here
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all<double>(0),
                                        shape:
                                        MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12.0),
                                            )),
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black54),
                                      ),
                                    ),


                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 0,
                    child: Image.asset(
                      'assets/images/last.png',
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite_border),
      //       label: 'favorite',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'About',
      //     ),
      //
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite_border),
      //       label: 'favorite',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'About',
      //     ),
      //
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      // ),

    );
  }
}

